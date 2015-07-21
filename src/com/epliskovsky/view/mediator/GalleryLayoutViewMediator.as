/**
 * Created by Eugene on 7/20/2015.
 */
package com.epliskovsky.view.mediator {

import com.epliskovsky.model.GalleryItem;
import com.epliskovsky.model.GalleryModel;
import com.epliskovsky.signal.AddNewItemSignal;
import com.epliskovsky.signal.AddedItemSignal;
import com.epliskovsky.signal.RemoveItemSignal;
import com.epliskovsky.view.GalleryLayoutView;

import org.robotlegs.mvcs.Mediator;

public class GalleryLayoutViewMediator extends Mediator {

    [Inject]
    public var galleryLayoutView:GalleryLayoutView;

    [Inject]
    public var model:GalleryModel;

	[Inject]
	public var view:GalleryLayoutView;

	[Inject]
	public var addedItemSignal:AddedItemSignal;

	[Inject]
	public var removeItemSignal:RemoveItemSignal;

	[Inject]
	public var addNewItemSignal:AddNewItemSignal;

    public function GalleryLayoutViewMediator() {
        super();
    }

    override public function onRegister():void {
        super.onRegister();
		addedItemSignal.add(addedItem);
		removeItemSignal.add(removeOldItemAndAddNew);
    }

	private function addedItem(item:GalleryItem):void {
		view.addImage(item);
	}

	private function removeOldItemAndAddNew(item:GalleryItem):void {
		view.removeImage(item);
		addNewItemSignal.dispatch();
	}
}
}
