/**
 * Created by Eugene on 7/20/2015.
 */
package com.epliskovsky.model {

import flash.display.BitmapData;

public class GalleryItem {

    private var _bitmapData:BitmapData;

    public function GalleryItem(bitmapData:BitmapData) {
        _bitmapData = bitmapData;
    }

    public function get bitmapData():BitmapData {
        return _bitmapData;
    }
}
}
