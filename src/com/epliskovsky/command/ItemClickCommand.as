/**
 * Created by Eugene on 7/21/2015.
 */
package com.epliskovsky.command {

import com.epliskovsky.model.GalleryItem;
import com.epliskovsky.model.GalleryModel;

import org.robotlegs.mvcs.Command;

public class ItemClickCommand extends Command {

	[Inject]
	public var imageGalleryItem:GalleryItem;

	[Inject]
	public var model:GalleryModel;

	override public function execute():void {
		model.removeItem(imageGalleryItem);
	}
}
}
