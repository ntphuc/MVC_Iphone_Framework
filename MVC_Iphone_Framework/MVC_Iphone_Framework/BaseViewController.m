//
//  BaseViewController.m
//  MVC_Iphone_Framework
//
//  Created by admin on 22/02/14.
//  Copyright (c) 2014 admin. All rights reserved.
//


#import "BaseViewController.h"
#import "IphoneFrameworkAppDelegate.h"

@interface BaseViewController ()

@end

@implementation BaseViewController
@synthesize logoTitle = _logoTitle;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    numOfSmallWaiting = 0;
}

- (void) showView: (ActionEvent*) actionEvent withAnimatin:(BOOL) animation {
    IphoneFrameworkAppDelegate* iphoneDelegate = [IphoneFrameworkAppDelegate getInstance];
    [iphoneDelegate pushView:self callBackPage:YES withBackButtonName:@""];
}

- (void) closeViewWithAnimation: (BOOL) animation {
    IphoneFrameworkAppDelegate* iphoneDelegate = [IphoneFrameworkAppDelegate getInstance];
    [iphoneDelegate.navigationController popViewControllerAnimated:animation];
}

- (void) closeView {
    IphoneFrameworkAppDelegate* iphoneDelegate = [IphoneFrameworkAppDelegate getInstance];
    [iphoneDelegate.navigationController popViewControllerAnimated:YES];
}

- (void) onReceiveSuccess: (ModelEvent*) modelEvent {
    
}
- (void) onReceiveError: (ModelEvent*) modelEvent {
    
}

-(void) setLogoTitle:(NSString *) title {
	_logoTitle = [title retain];
	IphoneFrameworkAppDelegate* appDelegate = [IphoneFrameworkAppDelegate getInstance];
	[appDelegate updateTitle];
}

//waiting network
- (void) presentSmallWaiting {
	numOfSmallWaiting ++;
	[UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
}
- (void) dismissSmallWaiting {
	numOfSmallWaiting --;
	if (numOfSmallWaiting < 0) {
		numOfSmallWaiting = 0;
	}
	if (numOfSmallWaiting > 0) {
		[UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
	} else {
		[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
	}
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    self.logoTitle = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
