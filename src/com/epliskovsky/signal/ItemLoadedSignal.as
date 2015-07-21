/**
 * Created by Eugene on 7/20/2015.
 */
package com.epliskovsky.signal {

import com.epliskovsky.model.GalleryItem;

import org.osflash.signals.Signal;

public class ItemLoadedSignal extends Signal {

    public function ItemLoadedSignal() {
        super(GalleryItem);
    }
}
}
