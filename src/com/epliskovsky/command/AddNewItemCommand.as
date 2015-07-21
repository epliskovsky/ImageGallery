/**
 * Created by Eugene on 7/21/2015.
 */
package com.epliskovsky.command {

import com.epliskovsky.service.IImageLoader;

import org.robotlegs.mvcs.Command;

public class AddNewItemCommand extends Command {

	[Inject]
	public var service:IImageLoader;

	override public function execute():void {
		service.loadImage();
	}
}
}
