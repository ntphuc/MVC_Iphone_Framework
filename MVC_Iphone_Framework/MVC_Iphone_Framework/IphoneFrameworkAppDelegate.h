//
//  IphoneFrameworkAppDelegate.h
//  MVC_Iphone_Framework
//
//  Created by admin on 20/02/14.
//  Copyright (c) 2014 admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@interface IphoneFrameworkAppDelegate : NSObject <UIApplicationDelegate> {
    
    UIWindow *window;
    UINavigationController *navigationController;
    
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;

+ (IphoneFrameworkAppDelegate *) getInstance;
- (void) pushView:(BaseViewController *)view callBackPage:(BOOL) back withBackButtonName:(NSString*) nameButton;
- (void) pushViewNoAnimation:(BaseViewController *)view callBackPage:(BOOL) back withBackButtonName:(NSString*) nameButton;
- (void) updateTitle;

@end

