//
//  AbstractController.h
//  MVC_Iphone_Framework
//
//  Created by admin on 24/02/14.
//  Copyright (c) 2014 admin. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "ActionEvent.h"
#import "ModelEvent.h"


@interface AbstractController : NSObject {

}

- (void) sendActionEvent:(ActionEvent *)action;
- (void) handleSwitchView:(ActionEvent *)action;
- (void) onReceiveSuccess:(ModelEvent*) modelEvent;
- (void) onReceiveError:(ModelEvent*) modelEvent;

@end
