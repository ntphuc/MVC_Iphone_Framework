//
//  YoutubeController.m
//  Demo_MVC_Iphone
//
//  Created by admin on 28/02/14.
//
//

#import "YoutubeController.h"
#import "YoutubeModel.h"
#import <MVC_Iphone_Framework/BaseViewController.h>
#import "PlaylistView.h"
#import "Constants.h"
#import <MVC_Iphone_Framework/NetworkUtils.h>
@implementation YoutubeController

YoutubeController* controller = nil;

+ (YoutubeController*) getController {
    if (controller == nil) {
        controller = [[YoutubeController alloc] init];
    }
    return controller;
}

- (void) sendActionEvent:(ActionEvent *)action {
    switch (action.action) {
           
        case GET_LIST_CATEGORY: {
            //handle strane view.
            BaseViewController* view = (BaseViewController*) action.sender;
            [view presentSmallWaiting];
            
            NSMutableDictionary*parameters=action.viewData;
            NSString* method=@"getListCategory";
            NSString* url = [NetworkUtils createStringUrl:method:parameters];
            [[YoutubeModel getService] sendHttpRequest:url :action];
            
        }
            
            break;
        case GET_LIST_PLAYLIST: {
            //handle strane view.
            BaseViewController* view = (BaseViewController*) action.sender;
            [view presentSmallWaiting];
            
            NSMutableDictionary*parameters=action.viewData;
            NSString* method=@"search";
            NSString* url = [NSString stringWithFormat:@"%@%@", SERVER_PATH , [NetworkUtils createStringUrl:method:parameters]];
            [[YoutubeModel getService] sendHttpRequest:url :action];
            
        }
            break;
            
        default:
            break;
    }
    
}

- (void) handleSwitchView:(ActionEvent *)action {
    switch (action.action) {
       
       case GO_TO_PLAYLIST: {
            PlaylistView* view;
            if (action.tag == 0) {
                view = [[PlaylistView alloc] initWithData:action.viewData];
            }
            action.sender = view;
            [view showView:action withAnimatin:YES];
        }
            break;
            
        default:
            break;
    }
    
}


@end
