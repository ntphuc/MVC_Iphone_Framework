//
//  YoutubeModel.m
//  Demo_MVC_Iphone
//
//  Created by admin on 28/02/14.
//
//

#import "YoutubeModel.h"
#import "YoutubeController.h"
#import "PlaylistDTO.h"
#import <MVC_Iphone_Framework/SBJSON.h>

@implementation YoutubeModel

YoutubeModel* instance = nil;

+ (YoutubeModel*) getService {
    if (instance == nil) {
        instance = [[YoutubeModel alloc] init];
    }
    return instance;
}

- (void) onReceiveSuccess:(HTTPResponse *)httpResponse {
    ModelEvent *modelEvent = [[ModelEvent alloc] init];
    modelEvent.actionEvent = (ActionEvent*) httpResponse.userData;
    
    NSString *json = [[NSString alloc] initWithData:httpResponse.data encoding:NSUTF8StringEncoding];
   // NSDictionary *jsonValue = [json JSONValue];
    SBJSON * parser = [[SBJSON alloc] init];
    NSDictionary *jsonValue = (NSDictionary *) [parser objectWithString:json error:nil];
    [json release];
    NSDictionary* error = [jsonValue objectForKey:@"error"];
  
        //success
        switch (modelEvent.actionEvent.action) {

            case GET_LIST_CATEGORY:
                if (error == nil) {
                    //parse data
                    NSMutableArray*list=[NSMutableArray arrayWithObjects:@"IELTS",nil];
                        modelEvent.modelData = list;
                    [[YoutubeController getController] onReceiveSuccess:modelEvent];
                }
                else{
                    [[YoutubeController getController] onReceiveError:modelEvent];
                }
                break;
            case GET_LIST_PLAYLIST:
                if (error == nil) {
                    //parse data
                    NSMutableArray*list=[PlaylistDTO parseListPlaylist:jsonValue];
                    modelEvent.modelData = list;
                    [[YoutubeController getController] onReceiveSuccess:modelEvent];
                }
                else{
                    [[YoutubeController getController] onReceiveError:modelEvent];
                }
                break;

            default:
                break;
        }
    [modelEvent release];
}

- (void) onReceiveError:(HTTPResponse *)httpResponse :(NSString *)error {
    
}

@end
