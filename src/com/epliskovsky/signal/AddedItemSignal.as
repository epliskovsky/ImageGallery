/**
 * Created by Eugene on 7/21/2015.
 */
package com.epliskovsky.signal {

import com.epliskovsky.model.GalleryItem;

import org.osflash.signals.Signal;

	public class AddedItemSignal extends Signal {

		public function AddedItemSignal() {
			super(GalleryItem);
		}
	}
}
