//
//  IphoneFrameworkAppDelegate.m
//  MVC_Iphone_Framework
//
//  Created by admin on 20/02/14.
//  Copyright (c) 2014 admin. All rights reserved.
//


#import "IphoneFrameworkAppDelegate.h"



@implementation IphoneFrameworkAppDelegate

@synthesize window;
@synthesize navigationController;


#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
    // Override point for customization after application launch.
    
    // Add the navigation controller's view to the window and display.
    [window addSubview:navigationController.view];
    [window makeKeyAndVisible];

    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

+ (IphoneFrameworkAppDelegate *) getInstance {
	return (IphoneFrameworkAppDelegate *) [[UIApplication sharedApplication] delegate];
}

- (void) pushView:(BaseViewController *)view callBackPage:(BOOL) back withBackButtonName:(NSString*) nameButton{

	
	if([[navigationController viewControllers] count] >0){
		UIViewController *viewTop = [navigationController.viewControllers objectAtIndex:([navigationController.viewControllers count]  - 1)];
		if([viewTop isKindOfClass:[BaseViewController class]]){
//			[(BaseViewController*)viewTop prepareBeforeHidding];
			
		}
	}
    
	view.navigationItem.hidesBackButton = YES;
	if (nameButton!=nil) {
		UIButton *back = [[UIButton alloc] initWithFrame: CGRectMake(0, 0, 34, 34)];
		
		UIImage *tmp = [UIImage imageNamed: @"ic_back.png"];
		
		[back setBackgroundImage: tmp forState: UIControlStateNormal];
		[back.titleLabel setFont: [UIFont boldSystemFontOfSize: 12]];
		[back addTarget:self action:@selector(returnPreviousPage) forControlEvents:UIControlEventTouchUpInside];
		UIBarButtonItem *button = [[UIBarButtonItem alloc] initWithCustomView:back];
		view.navigationItem.leftBarButtonItem = button;
		[button release];
		[back release];
	}
	if([nameButton isEqualToString:@"NoAnimation"])
		[navigationController pushViewController:view animated:NO];
	else {
		navigationController.navigationBar.tag = 11;		
		[navigationController pushViewController:view animated:YES];
	}
}

- (void)returnPreviousPage{
	int count = [navigationController.viewControllers count] - 1;
	if(count > 0)
	{
		UIViewController *view = [navigationController.viewControllers objectAtIndex:(count - 1)];
		view.navigationItem.hidesBackButton = YES;
	} else {
		navigationController.navigationBarHidden = NO;
	}
	[navigationController popViewControllerAnimated:YES];
	[self updateTitle];
    
}

- (void) pushViewNoAnimation:(BaseViewController *)view callBackPage:(BOOL) back withBackButtonName:(NSString*) nameButton{
//	[self setTitle: @"DemoFrameWork" onView: view];
	if([navigationController.viewControllers count] >0){
		UIViewController *viewTop = [navigationController.viewControllers objectAtIndex:([navigationController.viewControllers count]  - 1)];
		if([viewTop isKindOfClass:[BaseViewController class]]){
//			[(BaseViewController*)viewTop prepareBeforeHidding];
			
		}
	}
	
	view.navigationItem.hidesBackButton = YES;
	view.navigationItem.backBarButtonItem = nil;
	if (nameButton!=nil) {
		UIButton *back = [[UIButton alloc] initWithFrame: CGRectMake(0, 0, 80.0, 34)];
		
		UIImage *tmp = [UIImage imageNamed: @"ic_back.png"];
		[back setBackgroundImage: tmp forState: UIControlStateNormal];
		[back addTarget:self action:@selector(returnPreviousPage) forControlEvents:UIControlEventTouchUpInside];
		UIBarButtonItem *button = [[UIBarButtonItem alloc] initWithCustomView:back];
		view.navigationItem.leftBarButtonItem = button;
		[button release];
		[back release];
	}
	if([nameButton isEqualToString:@"NoAnimation"])
		[navigationController pushViewController:view animated:NO];
	else {
		[navigationController pushViewController:view animated:NO];
	}
    
    [self updateTitle];
    
}

-(void) updateTitle {
	[navigationController.navigationBar setNeedsDisplay];
    
	if ([[[UIDevice currentDevice] systemVersion] floatValue] > 4.9) {
		
        if ([navigationController.navigationBar respondsToSelector:@selector(setBackgroundImage:forBarMetrics:)]) { 
			CGSize size = navigationController.navigationBar.bounds.size;
			CGRect bounds = navigationController.navigationBar.bounds;        
			
			UIImage *image = [UIImage imageNamed:@"logo_bg.png"];
            CGImageRef img = [image CGImage];
            
            if (NULL != UIGraphicsBeginImageContextWithOptions)
                UIGraphicsBeginImageContextWithOptions(size, NO, [UIScreen mainScreen].scale);//iphone 4 draw scale 2.0
            else
                UIGraphicsBeginImageContext(size);
            
            CGContextRef context = UIGraphicsGetCurrentContext();
            CGContextDrawImage(context, CGRectMake(0, 0, 320, 44), img);
            
            UILabel *lbl = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
            lbl.textColor = [UIColor whiteColor];
            lbl.textAlignment = UITextAlignmentCenter;
            lbl.font = [UIFont boldSystemFontOfSize:20];
            lbl.shadowColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:.35];
            lbl.shadowOffset = CGSizeMake(-1, 1.0);
            lbl.text = [self getTitleForView];
            [lbl drawTextInRect:bounds];
            
            [lbl release];
            lbl = nil;
            
            UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
            UIGraphicsEndImageContext();
            
            [navigationController.navigationBar setBackgroundImage: newImage forBarMetrics: 0];
        }
    }
    
    
}

-(NSString*) getTitleForView{
	if([[navigationController viewControllers] count] >0){
		UIViewController *viewTop = [navigationController.viewControllers objectAtIndex:([navigationController.viewControllers count]  - 1)];
		if([viewTop isKindOfClass:[BaseViewController class]]){
			if (((BaseViewController*) viewTop).logoTitle) {
				return ((BaseViewController*) viewTop).logoTitle;
			} else {
				return @"DemoIphoneFrameWork";
			}
		}
	}	
	return @"DemoIphoneFrameWork";
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, called instead of applicationWillTerminate: when the user quits.
     */
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    /*
     Called as part of  transition from the background to the inactive state: here you can undo many of the changes made on entering the background.
     */
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}


- (void)applicationWillTerminate:(UIApplication *)application {
    /*
     Called when the application is about to terminate.
     See also applicationDidEnterBackground:.
     */
}


#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    /*
     Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
     */
}


- (void)dealloc {
	[navigationController release];
	[window release];
	[super dealloc];
}


@end

