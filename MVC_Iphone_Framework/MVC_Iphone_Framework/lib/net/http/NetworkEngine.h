//
//  NetworkEngine.h
//  MVC_Iphone_Framework
//
//  Created by admin on 26/02/14.
//  Copyright (c) 2014 admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HTTPClient.h"

@interface NetworkEngine : NSObject {

}
+ (HTTPClient *) getHttpClient;
@end
