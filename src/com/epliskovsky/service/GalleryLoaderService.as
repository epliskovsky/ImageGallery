/**
 * Created by Eugene on 7/20/2015.
 */
package com.epliskovsky.service {

import com.epliskovsky.model.GalleryItem;
import com.epliskovsky.signal.ItemLoadedSignal;
import com.epliskovsky.utils.GalleryUtils;

import flash.display.Bitmap;

import flash.display.BitmapData;

import flash.display.Loader;
import flash.display.LoaderInfo;
import flash.events.Event;
import flash.events.IOErrorEvent;
import flash.events.SecurityErrorEvent;
import flash.net.URLRequest;
import flash.system.LoaderContext;

public class GalleryLoaderService implements IImageLoader{

    [Inject]
    public var itemLoadedSignal:ItemLoadedSignal;

    private var _imageLoader:Loader;

    public function GalleryLoaderService() { }

    public function loadImagesGallery():void {
        var imageCount = 0;
        while(imageCount <= GalleryUtils.INITIAL_IMAGE_COUNT)
        {
            loadImage();
            imageCount++;
        }
    }

    public function loadImage():void {
        _imageLoader = new Loader();
        addListeners();
        var loaderContext:LoaderContext = new LoaderContext(true);
        loaderContext.checkPolicyFile = true;
        _imageLoader.load(new URLRequest(GalleryUtils.generateRandomImageURL()), loaderContext);
    }

    private function removeListeners():void {
        _imageLoader.contentLoaderInfo.removeEventListener(Event.COMPLETE, loadCompleteHandler);
        _imageLoader.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR, errorHandler);
        _imageLoader.contentLoaderInfo.removeEventListener(SecurityErrorEvent.SECURITY_ERROR, securityErrorHandler);
    }

    private function addListeners():void {
        _imageLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, loadCompleteHandler);
        _imageLoader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, errorHandler);
        _imageLoader.contentLoaderInfo.addEventListener(SecurityErrorEvent.SECURITY_ERROR, securityErrorHandler);
    }

    private function loadCompleteHandler(event:Event):void {
        removeListeners();
        dispatchLoaderCompleteSignal((event.target as LoaderInfo).content);
    }

    private function errorHandler(event:Event):void
    {
        removeListeners();
        dispatchLoaderCompleteSignal(null);
    }

    private function securityErrorHandler(event:Event):void
    {
        removeListeners();
        trace(event);
        dispatchLoaderCompleteSignal(null);
    }

    private function dispatchLoaderCompleteSignal(data:Object):void {
        itemLoadedSignal.dispatch(createImage(data));
    }

    private function createImage(data:Object):GalleryItem
    {
        return new GalleryItem(data is BitmapData ? data as BitmapData : (data is Bitmap ? data.bitmapData : null));
    }
}
}
