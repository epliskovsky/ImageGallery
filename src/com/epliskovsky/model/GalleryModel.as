/**
 * Created by Eugene on 7/20/2015.
 */
package com.epliskovsky.model {

import com.epliskovsky.signal.AddedItemSignal;
import com.epliskovsky.signal.RemoveItemSignal;

import org.robotlegs.mvcs.Actor;

public class GalleryModel extends Actor {

	[Inject]
	public var addedItemSignal:AddedItemSignal;

	[Inject]
	public var removeItemSignal:RemoveItemSignal;

	private var _items:Vector.<GalleryItem>;

	public function GalleryModel() {
		_items = new Vector.<GalleryItem>;
    }

	public function addItem(item:GalleryItem):void {
		_items.push(item);
		addedItemSignal.dispatch(item);
	}

	public function removeItem(item:GalleryItem):void {
		var itemIndex:int = _items.indexOf(item);
		if (itemIndex >= 0) {
			_items.splice(itemIndex, 1);
			removeItemSignal.dispatch(item);
		}
	}

}
}
