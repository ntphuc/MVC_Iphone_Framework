//
//  BaseViewController.h
//  MVC_Iphone_Framework
//
//  Created by admin on 22/02/14.
//  Copyright (c) 2014 admin. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "ModelEvent.h"

@interface BaseViewController : UIViewController {
    NSString* _logoTitle;
    int numOfSmallWaiting;
}

@property (nonatomic, retain) NSString* logoTitle;

- (void) showView: (ActionEvent*) actionEvent withAnimatin:(BOOL) animation;
- (void) closeViewWithAnimation: (BOOL) animation;
- (void) closeView;
//receive data from model
- (void) onReceiveSuccess: (ModelEvent*) modelEvent;
- (void) onReceiveError: (ModelEvent*) modelEvent;

- (void) presentSmallWaiting;
- (void) dismissSmallWaiting;

@end
