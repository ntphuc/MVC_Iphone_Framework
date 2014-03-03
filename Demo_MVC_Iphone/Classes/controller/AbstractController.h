//
//  AppController.h
//  IphoneFramework
//
//  Created by HieuNQ on 3/13/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
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
