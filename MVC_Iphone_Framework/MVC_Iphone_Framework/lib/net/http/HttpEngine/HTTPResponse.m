//
//  HTTPResponse.m
//  MVC_Iphone_Framework
//
//  Created by admin on 24/02/14.
//  Copyright (c) 2014 admin. All rights reserved.
//

#import "HTTPResponse.h"


@implementation HTTPResponse

@synthesize resCode;
@synthesize message;
-(id) init {
	if(self = [super init]) {
		message=@"";
	}
	return self;
}

-(void) dealloc
{
	if(message){
		[message release];
		message=nil;
	}
	[super dealloc];
}

-(void) getErrorCode
{
	
}

@end
