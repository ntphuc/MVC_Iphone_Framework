//
//  AbstractModelService.h
//  MVC_Iphone_Framework
//
//  Created by admin on 24/02/14.
//  Copyright (c) 2014 admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HTTPObserver.h"
#import "ActionEvent.h"

@interface AbstractModel : NSObject <HTTPObserver> {

}

-(void) sendHttpRequest: (NSString*) method : (ActionEvent*) actionEvent;

@end
