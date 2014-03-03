//
//  HTTPRequest.m
//  MVC_Iphone_Framework
//
//  Created by admin on 24/02/14.
//  Copyright (c) 2014 admin. All rights reserved.
//

#import "HTTPRequest.h"

@implementation HTTPRequest

@synthesize observer;
@synthesize method;
@synthesize uri;
@synthesize cookie;
@synthesize contentType;

-(id)init
{
    if (self = [super init])
    {
		// Initialization code here
		observer = nil;
		method = 0;
		contentType = @"";
		uri = @"";
		cookie = [[NSString alloc] init];
    }
    return self;
}

-(void) dealloc
{
	[uri release];
	[cookie release];
	[contentType release];
	[super dealloc];
}

- (HTTPResponse*) createHTTPResponse
{
	HTTPResponse* httpResponse = [[HTTPResponse alloc] init];
	httpResponse.action = self.action;
	httpResponse.identifier = self.identifier;
	return httpResponse;
}
@end
