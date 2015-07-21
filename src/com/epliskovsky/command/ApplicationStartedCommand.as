/**
 * Created by Eugene on 7/20/2015.
 */
package com.epliskovsky.command {

import com.epliskovsky.service.IImageLoader;

import org.robotlegs.mvcs.Command;

public class ApplicationStartedCommand extends Command {

    [Inject]
    public var service:IImageLoader;

    override public function execute():void {
        service.loadImagesGallery();
    }
}
}
