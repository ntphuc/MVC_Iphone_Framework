//
//  ViewController.m
//  Demo_MVC_Iphone
//
//  Created by admin on 22/02/14.
//
//

#import "PlaylistDTO.h"



@implementation PlaylistDTO


@synthesize playlistId;
@synthesize title;
@synthesize description;
@synthesize thumbUrl;
@synthesize category;

- (id) init {
    self = [super init];
    if (self != nil) {
        playlistId=@"";
            title = @"";
        description=@"";
        thumbUrl = @"";
        category=@"";
    
		
    }
    return self;
}


+ (NSMutableArray*) parseListPlaylist: (NSDictionary *) response {
    NSMutableArray * result =[[NSMutableArray alloc] init];
        NSArray *arrPlaylist = [response objectForKey:@"items"];
        for (NSDictionary *dic in arrPlaylist) {
            PlaylistDTO *obj = [[PlaylistDTO alloc] init];
            obj.playlistId= [[dic objectForKey:@"id"] objectForKey:@"playlistId" ];
            obj.title= [[dic objectForKey:@"snippet"] objectForKey:@"title" ];
            [result addObject:obj];
            [obj release];
        }
    return result;
}

- (void) dealloc {
    
    if (playlistId != nil) {
        [playlistId release];
        playlistId = nil;
    }
    
    if (title != nil) {
        [title release];
        title = nil;
    }
    
    if (description != nil) {
        [description release];
        description = nil;
    }
    
    if (thumbUrl != nil) {
        [thumbUrl release];
        thumbUrl = nil;
    }
    if (category != nil) {
        [category release];
        category = nil;
    }
    [super dealloc];
}

@end
