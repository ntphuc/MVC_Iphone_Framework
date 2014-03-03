//
//  AbstractModelService.m
//  MVC_Iphone_Framework
//
//  Created by admin on 24/02/14.
//  Copyright (c) 2014 admin. All rights reserved.
//

#import "AbstractModel.h"
#import "HTTPRequest.h"
#import "NetworkEngine.h"

#import "NetworkUtils.h"
#import "ModelEvent.h"
#import "JSON.h"
@implementation AbstractModel


-(void)onReceiveSuccess:(HTTPResponse*) httpResponse {
	
}

- (void) sendHttpRequest: (NSString*) url : (ActionEvent*) actionEvent{
    
	HTTPRequest *req = [[HTTPRequest alloc] init];
	req.method = GET;
	req.uri = url;
	req.contentType = [NetworkUtils getJsonContentType];
	req.observer = self;
	//req.data = data;
	req.userData = actionEvent;
    [[NetworkEngine getHttpClient] request:req];
    [req release];
    
}
@end
