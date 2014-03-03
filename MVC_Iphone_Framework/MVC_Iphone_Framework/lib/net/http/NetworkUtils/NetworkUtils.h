//
//  NetworkUtils.h
//  MVC_Iphone_Framework
//
//  Created by admin on 24/02/14.
//  Copyright (c) 2014 admin. All rights reserved.
//

#import <Foundation/Foundation.h>

#define BOUNDARY  @"----------V2ymHFg03ehbqgZCaKO6jy"
#define CONTENTTYPE_TEXT @"text"
#define CONTENTTYPE_BINARY @"binary"
#define CONTENTTYPE_JSON @"application/json"
#define CONTENTTYPE_MUTIPART @"multipart/form-data; boundary=----------V2ymHFg03ehbqgZCaKO6jy"
#define RPC_PATH @"%@rpc"

@interface NetworkUtils : NSObject {

}

+ (NSString *) getJsonContentType;
+ (NSString *) getTextContentType;
+ (NSString *) getBinaryContentType;
+ (NSString *) getBoundaryString;

+ (NSMutableData *) getJsonMutableDataWithObject: (NSMutableDictionary*) object;
+ (NSString *) getJsonStringDataWithObject: (NSMutableDictionary*) object;
+ (NSString *) createStringUrl: (NSString*)method : (NSMutableDictionary*) params ;
@end
