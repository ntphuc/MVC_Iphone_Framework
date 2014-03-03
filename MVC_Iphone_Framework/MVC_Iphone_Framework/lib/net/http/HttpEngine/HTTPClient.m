//
//  HTTPClient.m
//  MVC_Iphone_Framework
//
//  Created by admin on 26/02/14.
//  Copyright (c) 2014 admin. All rights reserved.
//

#import "HTTPClient.h"
#import "HttpLoader.h"

@implementation HTTPClient
@synthesize userAgent;

-(id) initWithNThread: (int) nConcurentThreads AndUserAgent:(NSString*)strUserAgent
{
	if (self = [super init])
	{
		requestID = 0;
	}
	return self;
}

-(id) init {
	return [self initWithNThread: 2 AndUserAgent:@""];
}

-(int)request:(HTTPRequest*) httpRequest
{
	httpRequest.identifier = requestID;
	
	requestID += 1;
	
	HttpLoader *loader = [[HttpLoader alloc] initWithRequest: httpRequest];
	[loader release];
	
	return httpRequest.identifier;
}

-(void) dealloc
{

	[super dealloc];
}


@end
