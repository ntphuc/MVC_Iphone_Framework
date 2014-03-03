//
//  HTTPClient.h
//  MVC_Iphone_Framework
//
//  Created by admin on 26/02/14.
//  Copyright (c) 2014 admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HTTPRequest.h"

@interface HTTPClient : NSObject {
	

	NSMutableArray* arrThread;
	UInt32 requestID;
	NSString* userAgent;
}
@property (nonatomic, readonly) NSString* userAgent;

-(id) initWithNThread: (int) nConcurentThreads AndUserAgent:(NSString*)strUserAgent;
-(int)request:(HTTPRequest*) httpRequest;

@end
