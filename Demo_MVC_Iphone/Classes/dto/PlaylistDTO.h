//
//  ViewController.h
//  Demo_MVC_Iphone
//
//  Created by admin on 22/02/14.
//
//

#import <Foundation/Foundation.h>

@interface PlaylistDTO : NSObject{
    NSString * playlistId;
	NSString * title;
	NSString * description;
	NSString * thumbUrl;
	NSString * category;
}
@property (nonatomic, copy) NSString *playlistId;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *description;
@property (nonatomic, copy) NSString *thumbUrl;
@property (nonatomic, copy) NSString *category;

+(NSMutableArray*) parseListPlaylist;

@end
