//
//  ActionEvent.h
//  MVC_Iphone_Framework
//
//  Created by admin on 24/02/14.
//  Copyright (c) 2014 admin. All rights reserved.
//


#import <Foundation/Foundation.h>


enum ActionEventEnum {
	none,
    login,
    showWelcome,
    GET_LIST_CATEGORY,
    GET_LIST_PLAYLIST,
    GET_LIST_PLAYLIST_ITEM,
    GO_TO_PLAYLIST
};

@interface ActionEvent : NSObject {
	NSString *_textSender;
	NSString *_json;
	enum ActionEventEnum action;
	BOOL cancel;
	int tag;
	int request;
	id _viewData;
	id _sender;
	id _userData;
}
@property(nonatomic, retain) NSString *textSender;
@property(nonatomic, retain) NSString *json;
@property(nonatomic, assign) enum ActionEventEnum action;
@property(nonatomic, assign) int tag;
@property(nonatomic, assign) int request;
@property(nonatomic, assign) BOOL cancel;
@property(nonatomic, retain) id viewData;
@property(nonatomic, retain) id sender;
@property(nonatomic, retain) id userData;
@end
