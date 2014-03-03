//
//  AbstractController.m
//  MVC_Iphone_Framework
//
//  Created by admin on 24/02/14.
//  Copyright (c) 2014 admin. All rights reserved.
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
            [view onReceiveSuccess:modelEvent];
            [view dismissSmallWaiting];
}

- (void) onReceiveError:(ModelEvent*) modelEvent {
            BaseViewController* view = (BaseViewController*)modelEvent.actionEvent.sender;
            [view onReceiveError:modelEvent];
            [view dismissSmallWaiting];
    
    
}

@end
