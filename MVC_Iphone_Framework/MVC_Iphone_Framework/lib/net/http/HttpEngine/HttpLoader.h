//
//  HTTPLoader.h
//  MVC_Iphone_Framework
//
//  Created by admin on 27/02/14.
//  Copyright (c) 2014 admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HTTPRequest.h"
#import "HTTPResponse.h"

@interface HttpLoader : NSObject {
	NSMutableData *receivedData;
	NSURLConnection *httpConnection;
	HTTPRequest *httpRequest;
	HTTPResponse* httpResponse;
	int requestCount;
}

@property (nonatomic, retain) NSMutableData *receivedData;
@property (nonatomic, retain) NSURLConnection *httpConnection;
@property (nonatomic, retain) HTTPRequest *httpRequest;
@property (nonatomic, retain) HTTPResponse *httpResponse;
@property (nonatomic, assign) int requestCount;

- (id) initWithRequest: (HTTPRequest*) httprequest;


@end
