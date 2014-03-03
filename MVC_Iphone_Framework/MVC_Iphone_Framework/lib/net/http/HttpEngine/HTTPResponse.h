//
//  HTTPResponse.h
//  MVC_Iphone_Framework
//
//  Created by admin on 24/02/14.
//  Copyright (c) 2014 admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HTTPMessage.h"

@interface HTTPResponse : HTTPMessage {
	int resCode;
	NSString* message;
}

@property (nonatomic, assign) int resCode;
@property (nonatomic, retain) NSString* message;
-(void) getErrorCode;
@end
