//
//  NetworkUtils.h
//  MVC_Iphone_Framework
//
//  Created by admin on 24/02/14.
//  Copyright (c) 2014 admin. All rights reserved.
//

#import "NetworkUtils.h"
#import "JSON.h"

@implementation NetworkUtils

+ (NSString *) getJsonContentType {
	return CONTENTTYPE_JSON;
}

+ (NSString *) getTextContentType {
	return CONTENTTYPE_TEXT;
}
+ (NSString *) getBinaryContentType {
	return CONTENTTYPE_BINARY;
}

+ (NSString *) getBoundaryString {
	return BOUNDARY;
}

+ (NSMutableData *) getJsonMutableDataWithObject: (NSMutableDictionary*) object {
	SBJsonWriter *writer = [[SBJsonWriter alloc] init];
	NSString *json = [writer stringWithObject:object];
	[writer release];
	NSData* nsData = [json dataUsingEncoding:NSUTF8StringEncoding];
	NSMutableData *data = [[NSMutableData alloc] init];
	[data appendData:nsData];
	return data;
}

+ (NSString *) getJsonStringDataWithObject: (NSMutableDictionary*) object {
	SBJsonWriter *writer = [[SBJsonWriter alloc] init];
	NSString *json = [writer stringWithObject:object];
	[writer release];
	return json;
}

+ (NSString *) createStringUrl: (NSString*)method : (NSMutableDictionary*) params {
	
	NSMutableString *url = [[NSMutableString alloc] init];
    [url appendString:method];
    [url appendString:@"?"];
    
    if (params!=nil && params.count>0) {
        for (NSString *key in params) {
            NSString* value = [params objectForKey:key];
            [url appendString:key];
            [url appendString:@"="];
            [url appendString:value];
            [url appendString:@"&"];
        }
        return [url substringWithRange:NSMakeRange(0, url.length-1)];
    }
	return [NSString stringWithString:url];
}

@end
