/**
 * Created by Eugene on 7/20/2015.
 */
package com.epliskovsky.context {

import com.epliskovsky.command.AddNewItemCommand;
import com.epliskovsky.command.ApplicationStartedCommand;
import com.epliskovsky.command.ItemClickCommand;
import com.epliskovsky.command.ItemLoadedCommand;
import com.epliskovsky.model.GalleryModel;
import com.epliskovsky.service.GalleryLoaderService;
import com.epliskovsky.service.IImageLoader;
import com.epliskovsky.signal.AddNewItemSignal;
import com.epliskovsky.signal.AddedItemSignal;
import com.epliskovsky.signal.ApplicationStartedSignal;
import com.epliskovsky.signal.ItemClickSignal;
import com.epliskovsky.signal.ItemLoadedSignal;
import com.epliskovsky.signal.RemoveItemSignal;
import com.epliskovsky.view.GalleryLayoutView;
import com.epliskovsky.view.ImageLayoutView;
import com.epliskovsky.view.mediator.GalleryLayoutViewMediator;
import com.epliskovsky.view.mediator.ImageLayoutViewMediator;

import flash.display.DisplayObjectContainer;

import org.robotlegs.mvcs.SignalContext;

public class GalleryContext extends SignalContext {

    public function GalleryContext(contextView:DisplayObjectContainer = null, autoStartup:Boolean = true) {
        super(contextView, autoStartup);
    }


    override public function startup():void {
        super.startup();

		//map singleton object
		injector.mapSingleton(AddedItemSignal);
		injector.mapSingleton(RemoveItemSignal);

        //map model
        injector.mapSingleton(GalleryModel);

        //map mediator
        mediatorMap.mapView(GalleryLayoutView, GalleryLayoutViewMediator);
        mediatorMap.mapView(ImageLayoutView, ImageLayoutViewMediator);

        //map the services
        injector.mapSingletonOf(IImageLoader, GalleryLoaderService);

        //map signal
        signalCommandMap.mapSignalClass(ItemLoadedSignal, ItemLoadedCommand);
        signalCommandMap.mapSignalClass(ItemClickSignal, ItemClickCommand);
        signalCommandMap.mapSignalClass(AddNewItemSignal, AddNewItemCommand);

        ApplicationStartedSignal(signalCommandMap.mapSignalClass(
                ApplicationStartedSignal, ApplicationStartedCommand, true)).dispatch();
    }
}
}
