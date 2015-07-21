/**
 * Created by Eugene on 7/21/2015.
 */
package com.epliskovsky.view.mediator {

import com.epliskovsky.model.GalleryItem;
import com.epliskovsky.signal.ItemClickSignal;
import com.epliskovsky.view.ImageLayoutView;

import org.robotlegs.mvcs.Mediator;

public class ImageLayoutViewMediator extends Mediator {

	[Inject]
	public var view:ImageLayoutView;

	[Inject]
	public var clickSignal:ItemClickSignal;


    public function ImageLayoutViewMediator() {
        super();
    }

	override public function onRegister():void {
		super.onRegister();
		init();
	}

	private function init():void {
		view.itemClickSignal.add(click)
	}

	private function click(item:GalleryItem):void {
		clickSignal.dispatch(item);
	}

}
}
