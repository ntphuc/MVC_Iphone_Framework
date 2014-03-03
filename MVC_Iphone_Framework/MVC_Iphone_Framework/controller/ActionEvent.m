//
//  ActionEvent.m
//  MVC_Iphone_Framework
//
//  Created by admin on 24/02/14.
//  Copyright (c) 2014 admin. All rights reserved.
//

#import "ActionEvent.h"


@implementation ActionEvent
@synthesize textSender = _textSender;
@synthesize action;
@synthesize tag;
@synthesize viewData = _viewData;
@synthesize sender = _sender;
@synthesize userData = _userData;
@synthesize cancel;
@synthesize request;
@synthesize json = _json;

- (id) init {
	self = [super init];
	if (self != nil) {
		action = none;
		tag = 0;
		cancel = FALSE;
		self.sender = nil;
		self.viewData = nil;
		self.userData = nil;
		self.json=nil;
	}
	return self;
}

- (void) dealloc {
	self.textSender = nil;
	self.sender = nil;
	self.viewData = nil;
	self.userData = nil;
	self.json = nil;
	[super dealloc];
}

@end
