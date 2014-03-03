//
//  ModelEvent.h
//  MVC_Iphone_Framework
//
//  Created by admin on 24/02/14.
//  Copyright (c) 2014 admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ActionEvent.h"






@interface ModelEvent : NSObject {
	ActionEvent *actionEvent;
	id modelData;
	
	int modelCode;
	NSString *modelMessage;
	int bankErrorCode;
}

@property (nonatomic, retain) ActionEvent *actionEvent;
@property (nonatomic, retain) id modelData;
@property (nonatomic, retain) NSString *modelMessage;
@property (nonatomic, assign) int modelCode;
@property (nonatomic, assign) int bankErrorCode;
@end
