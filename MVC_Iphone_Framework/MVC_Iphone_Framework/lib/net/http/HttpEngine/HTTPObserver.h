//
//  HTTPObserver.h
//  MVC_Iphone_Framework
//
//  Created by admin on 25/02/14.
//  Copyright (c) 2014 admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HTTPResponse.h"


@protocol HTTPObserver

@required
-(void) onReceiveSuccess: (HTTPResponse*) httpResponse;
@optional
-(void) onReceiveError: (HTTPResponse*) httpResponse : (NSString*) error;

@end
