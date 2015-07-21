package com.epliskovsky {

import com.epliskovsky.context.GalleryContext;
import com.epliskovsky.view.GalleryLayoutView;

import flash.display.Sprite;
import flash.display.StageAlign;
import flash.display.StageScaleMode;
import flash.events.Event;
import flash.system.Security;

[SWF(width="800", height="600", backgroundColor="#ffffff", frameRate="30")]
public class ImageGallery extends Sprite {

    private var _imageGalleryContext:GalleryContext;

    public function ImageGallery() {
        Security.allowDomain("placeimg.com");
        addEventListener(Event.ADDED_TO_STAGE, addedToStageHandler);
    }

    private function addedToStageHandler(event:Event):void {
        removeEventListener(Event.ADDED_TO_STAGE, addedToStageHandler);

        _imageGalleryContext = new GalleryContext(this);

        stage.align = StageAlign.TOP_LEFT;
        stage.scaleMode = StageScaleMode.NO_SCALE;
        var imageGalleryLayout:GalleryLayoutView = new GalleryLayoutView();
        addChild(imageGalleryLayout);
    }

}
}
