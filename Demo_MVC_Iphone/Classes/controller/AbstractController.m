//
//  AppController.m
//  IphoneFramework
//
//  Created by HieuNQ on 3/13/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "AbstractController.h"
#import "BaseViewController.h"

@implementation AbstractController

- (void) sendActionEvent:(ActionEvent *)action {
    
}

- (void) handleSwitchView:(ActionEvent *)action {
    
}


- (void) onReceiveSuccess:(ModelEvent*) modelEvent {
    
            BaseViewController* view = (BaseViewController*)modelEvent.actionEvent.sender;
            [view receiveDataFromModel:modelEvent];
            [view dismissSmallWaiting];
}

- (void) onReceiveError:(ModelEvent*) modelEvent {
               BaseViewController* view = (BaseViewController*)modelEvent.actionEvent.sender;
            [view receiveErrorFromModel:modelEvent];
            [view dismissSmallWaiting];
    
    
}

@end
