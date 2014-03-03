//
//  HTTPMessage.h
//  MVC_Iphone_Framework
//
//  Created by admin on 25/02/14.
//  Copyright (c) 2014 admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ActionEvent.h"

@interface HTTPMessage : NSObject {
	int identifier;
	NSMutableData *data;
	enum ActionEventEnum action;
	int tag;
	id userData;
}

@property (nonatomic, copy) NSMutableData* data;
@property (nonatomic) enum ActionEventEnum action;
@property (nonatomic) int identifier;
@property (nonatomic, assign) int tag;
@property (nonatomic, retain) id userData;

-(BOOL) setDataWithMutableString: (NSString*) strData WithEncoding: (NSStringEncoding) encoding;
-(void) appendData:(UInt8 *) aData withDataSize:(int) length;
-(void) resetData;
-(void) setdata:(NSMutableData*) _data;

@end
