/**
 * Created by Eugene on 7/20/2015.
 */
package com.epliskovsky.view {

import com.epliskovsky.model.GalleryItem;
import com.epliskovsky.utils.GalleryUtils;
import com.greensock.TweenMax;

import flash.display.Sprite;
import flash.events.Event;
import flash.utils.Dictionary;

public class GalleryLayoutView extends Sprite {

    private var _imagesDictionary:Dictionary;

    private var _resizeDelayFunction:TweenMax;

    public function GalleryLayoutView() {
        super();
		_imagesDictionary = new Dictionary();
        addEventListener(Event.ADDED_TO_STAGE, addedToStageHandler);
    }

    private function addedToStageHandler(event:Event):void {
        removeEventListener(Event.ADDED_TO_STAGE, addedToStageHandler);
        stage.addEventListener(Event.RESIZE, resizeHandler);
    }

    private function resizeHandler(event:Event):void {
        if (_resizeDelayFunction) {
            _resizeDelayFunction.kill();
        }
        _resizeDelayFunction = TweenMax.delayedCall(1, updateLayout);
    }

    private function updateLayout():void {
        var stageWidth:Number = stage.stageWidth;
        var stageHeight:Number = stage.stageHeight;
		var currentWidth:Number = 0;
		var currentHeight:Number = 0;

		for each (var image in _imagesDictionary) {

			(image as  ImageLayoutView).x = currentWidth;
			(image as  ImageLayoutView).y = currentHeight;
			(image as  ImageLayoutView).rotation = GalleryUtils.getImageRotation();

			currentWidth +=(image as  ImageLayoutView).width;
			if (currentWidth > (stageWidth - (image as  ImageLayoutView).width/2)) {
				currentHeight +=(image as  ImageLayoutView).height;
				currentWidth = 0;
			}

			if (currentHeight > (stageHeight - (image as  ImageLayoutView).height/2)) {
				currentHeight = 0;
				currentWidth +=(image as  ImageLayoutView).width;
			}
		}
    }

	public function addImage(item:GalleryItem):void {
		var image:ImageLayoutView = new ImageLayoutView(item);
		image.x = Math.random() * (stage.stageWidth- image.width);
		image.y = Math.random() * (stage.stageHeight - image.height);
		_imagesDictionary[item] = image;
		addChild(image);
		updateLayout();
	}

	public function removeImage(item:GalleryItem):void {
		if (item) {
			removeChild(_imagesDictionary[item]);
			(_imagesDictionary[item] as ImageLayoutView).dispose();
			delete _imagesDictionary[item];
		}
		updateLayout();
	}



}
}
