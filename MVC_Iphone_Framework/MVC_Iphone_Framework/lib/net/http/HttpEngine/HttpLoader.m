//
//  HTTPLoader.m
//  MVC_Iphone_Framework
//
//  Created by admin on 27/02/14.
//  Copyright (c) 2014 admin. All rights reserved.
//

#import "HttpLoader.h"
#import "NetworkUtils.h"
#import "NetworkEngine.h"
#import "IphoneFrameworkAppDelegate.h"
#import "ActionEvent.h"

#define MAX_REQUEST 2
#define TIMEOUT_JSON 120.0

@implementation HttpLoader

@synthesize receivedData;
@synthesize httpConnection;
@synthesize httpRequest;
@synthesize httpResponse;
@synthesize requestCount;

- (id) initWithRequest: (HTTPRequest*) httprequest {
	if (self = [super init]) {
		
		self.httpRequest = httprequest;
		httpResponse = [httpRequest createHTTPResponse];
		httpResponse.tag = httpRequest.tag;
		httpResponse.action = httpRequest.action;
		httpResponse.identifier = httpRequest.identifier;
		httpResponse.userData = httpRequest.userData;
		
		NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
		
		requestCount = 1;
		
		NSString *urlString = httpRequest.uri;
		NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
		[request setURL:[NSURL URLWithString:urlString]];
		//set headers
		[request addValue: httpRequest.contentType forHTTPHeaderField: @"Content-Type"];
		[request addValue: @"Iphone client 1.0" forHTTPHeaderField: @"User-Agent"];
		[request addValue: httpRequest.cookie forHTTPHeaderField: @"Cookie"];
		if (httpRequest.method == GET) {
			[request setHTTPMethod:@"GET"];
		}
		else if (httpRequest.method == POST){
			[request setHTTPMethod:@"POST"];
			[request setHTTPBody: httpRequest.data];
		}
		if ([httpRequest.contentType isEqualToString: [NetworkUtils getJsonContentType]]) {
			[request setTimeoutInterval: TIMEOUT_JSON];
			[self performSelector:@selector(cancelLoading)
					   withObject:nil
					   afterDelay: TIMEOUT_JSON];
		}
	
		httpConnection = [[NSURLConnection alloc] initWithRequest: request delegate: self startImmediately:YES];
		[request release];
		
		[pool release];
	}
	return self;
}

- (void) reRequest {
	[httpConnection release], httpConnection = nil;
	[receivedData release], receivedData = nil;
	
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
	
	requestCount ++;
	
	NSString *urlString = httpRequest.uri;
	NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
	[request setURL:[NSURL URLWithString:urlString]];
	//set headers
	[request addValue: httpRequest.contentType forHTTPHeaderField: @"Content-Type"];
	[request addValue: @"Iphone client 1.0" forHTTPHeaderField: @"User-Agent"];
	[request addValue: httpRequest.cookie forHTTPHeaderField: @"Cookie"];
	if (httpRequest.method == GET) {
		[request setHTTPMethod:@"GET"];
	}
	else if (httpRequest.method == POST){
		[request setHTTPMethod:@"POST"];
		[request setHTTPBody: httpRequest.data];
	}
	if ([httpRequest.contentType isEqualToString: [NetworkUtils getJsonContentType]]) {
		[request setTimeoutInterval: TIMEOUT_JSON];
		[self performSelector:@selector(cancelLoading)
				   withObject:nil
				   afterDelay: TIMEOUT_JSON];
	}
	
	httpConnection = [[NSURLConnection alloc] initWithRequest: request delegate: self startImmediately:YES];
	[request release];
	
	[pool release];
}

- (void)cancelLoading
{
	[httpConnection cancel];
	

		if (requestCount < MAX_REQUEST) {
			[self reRequest];
			return;
		}
	
	
	httpResponse.resCode = -1001;
	if(httpRequest.observer != nil) {
		[self performSelectorOnMainThread:@selector(handleReceiveError) withObject: nil waitUntilDone:NO];
	}
	
	[httpConnection release], httpConnection = nil;
	[receivedData release], receivedData = nil;
	
}

#pragma mark NSURL Loading

- (void) connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *) response
{
	[receivedData release], receivedData = nil;
	receivedData = [[NSMutableData alloc] init];
	NSHTTPURLResponse* urlResponse = (NSHTTPURLResponse *)response;  
	httpResponse.resCode = [urlResponse statusCode];
}

- (void) connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
	[receivedData appendData:data];
}

- (void) connectionDidFinishLoading:(NSURLConnection *)connection
{
	[NSObject cancelPreviousPerformRequestsWithTarget:self
											 selector:@selector(cancelLoading)
											   object:nil];
	httpResponse.data = receivedData;
	if(httpRequest.observer != nil) {
		if (httpResponse != nil) {
			if(httpResponse.resCode != 200)
			{
				
					if (requestCount < MAX_REQUEST) {
						[self reRequest];
						return;
					}
				
				[self performSelectorOnMainThread:@selector(handleReceiveError) withObject: nil waitUntilDone:NO];
			} else {
				[self performSelectorOnMainThread:@selector(handleReceiveData) withObject: nil waitUntilDone:NO];
			}
		}
		else {
			
				if (requestCount < MAX_REQUEST) {
					[self reRequest];
					return;
				}
			
			[self performSelectorOnMainThread:@selector(handleReceiveError) withObject: nil waitUntilDone:NO];
		}
	}
	[httpConnection release], httpConnection = nil;
	if (receivedData)
	{	
		[receivedData release], receivedData = nil;
	}
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *) error
{
	[NSObject cancelPreviousPerformRequestsWithTarget:self
											 selector:@selector(cancelLoading)
											   object:nil];
	

		if (requestCount < MAX_REQUEST) {
			[self reRequest];
			return;
		}
	

	httpResponse.resCode = [error code];
	if(httpRequest.observer != nil) {
		[self performSelectorOnMainThread:@selector(handleReceiveError) withObject: nil waitUntilDone:NO];
	}
	[connection release], connection = nil;
	[receivedData release], receivedData = nil;
	
}


#pragma mark Properties

-(void) handleReceiveData {
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
	@try{
		[httpRequest.observer onReceiveSuccess: httpResponse];
		[httpResponse release];
		[httpRequest release];
		httpRequest = nil;
		httpResponse = nil;
	}@catch (NSException *e) {
	}
	[pool release];
}

- (void) handleReceiveError {
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
	@try{

		[httpRequest.observer onReceiveError: httpResponse: @"Không thể kết nối mạng."];
		[httpResponse release];
		[httpRequest release];
		httpRequest = nil;
		httpResponse = nil;
	}@catch (NSException *e) {
	}
	[pool release];
}


- (void) dealloc
{
	[super dealloc];
}


@end
