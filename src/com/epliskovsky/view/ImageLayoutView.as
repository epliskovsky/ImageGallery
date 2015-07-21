/**
 * Created by Eugene on 7/21/2015.
 */
package com.epliskovsky.view {
import com.epliskovsky.model.GalleryItem;
import com.epliskovsky.utils.GalleryUtils;
import com.greensock.TweenMax;
import com.greensock.easing.Sine;

import flash.display.Bitmap;
import flash.display.Sprite;
import flash.events.MouseEvent;

	import org.osflash.signals.ISignal;

	import org.osflash.signals.Signal;

	public class ImageLayoutView extends Sprite {

    private var _imageContainer:Sprite;
    private var _image:Bitmap;
    private var _galleryItem:GalleryItem;
	private var _isMouseOver:Boolean;
	private var _itemClickSignal:ISignal;

    public function ImageLayoutView(image:GalleryItem) {
		super();
		_galleryItem = image;
		init();
    }

	public function get itemClickSignal():ISignal {
		if (!_itemClickSignal) {
			_itemClickSignal = new Signal();
		}
		return _itemClickSignal;
	}

	private function init():void {
		_imageContainer = new Sprite();
		_image = new Bitmap();
		_image.bitmapData = _galleryItem.bitmapData;

		_imageContainer.x = Math.random() * _imageContainer.width;
		_imageContainer.y = Math.random() * _imageContainer.height;
		_imageContainer.rotation = GalleryUtils.getImageRotation();

		addListeners();

		this.addChild(_imageContainer);
		_imageContainer.addChild(_image);
	}

	private function addListeners():void {
		addEventListener(MouseEvent.ROLL_OVER, mouseOverOutHandler);
		addEventListener(MouseEvent.ROLL_OUT, mouseOverOutHandler);
		addEventListener(MouseEvent.CLICK, mouseClickHandler);
	}

	private function removeListeners():void {
		removeEventListener(MouseEvent.ROLL_OVER, mouseOverOutHandler);
		removeEventListener(MouseEvent.ROLL_OUT, mouseOverOutHandler);
		removeEventListener(MouseEvent.CLICK, mouseClickHandler);
	}

	private function mouseClickHandler(event:MouseEvent):void {
		itemClickSignal.dispatch(_galleryItem);
	}

	private function mouseOverOutHandler(event:MouseEvent):void
	{
		isMouseOver = event.type == MouseEvent.ROLL_OVER;
	}

	private function set isMouseOver(value:Boolean):void
	{
		if (_isMouseOver != value) {
			_isMouseOver = value;
			update();
		}
	}

	private function update():void {
		TweenMax.killTweensOf(this);
		if (_isMouseOver) {
			TweenMax.to(this, 0.5, {scaleX:1.2, scaleY:1.2, ease:Sine.easeInOut});
		}
		else {
			TweenMax.to(this, 0.5, {scaleX:1, scaleY:1, ease:Sine.easeIn});
		}
	}

	public function dispose():void {
		TweenMax.killTweensOf(this);
		removeListeners();
		_image = null;
	}
	}
}
