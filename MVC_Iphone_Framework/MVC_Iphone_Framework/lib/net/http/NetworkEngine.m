//
//  NetworkEngine.m
//  MVC_Iphone_Framework
//
//  Created by admin on 26/02/14.
//  Copyright (c) 2014 admin. All rights reserved.
//

#import "NetworkEngine.h"



@implementation NetworkEngine

HTTPClient *httpClient = nil;

+ (HTTPClient *) getHttpClient {
	if (httpClient == nil) {
		httpClient = [[HTTPClient alloc] initWithNThread:5 AndUserAgent:@"Simple client 1.0" ];
	}
	return httpClient;
}
@end
