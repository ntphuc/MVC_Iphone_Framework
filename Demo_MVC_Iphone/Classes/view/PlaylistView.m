//
//  PlaylistView.m
//  Demo_MVC_Iphone
//
//  Created by admin on 03/03/14.
//
//

#import "PlaylistView.h"
#import "YoutubeController.h"
#import <MVC_Iphone_Framework/ActionEvent.h>
#import "PlaylistDTO.h"
#import "Constants.h"
@interface PlaylistView ()

@end

@implementation PlaylistView
@synthesize tableView;
@synthesize playLists;
@synthesize category;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(id) initWithData: (NSDictionary*) data {
	self = [super initWithNibName:nil bundle:nil];
	if (self != nil) {
        
		NSDictionary* dic = (NSDictionary*) data;
		category = [dic objectForKey:@"category"];
        NSLog(@"init with data");
		
		
	}
	return self;
}

- (void) requestListPlaylist
{
    NSLog(@"requestListPlaylist");
    NSMutableDictionary* dic = [[NSMutableDictionary alloc] init];
    NSString*key =KEY;
    [dic setObject: category forKey: @"q"];
    [dic setObject: key forKey: @"key"];
    [dic setObject: @"snippet" forKey: @"part"];
    [dic setObject: @"playlist" forKey: @"type"];
    [dic setObject: @"20" forKey: @"maxResults"];
    
    ActionEvent* actionEvent=[[ActionEvent alloc] init];
    actionEvent.action = GET_LIST_PLAYLIST;
    actionEvent.sender= self;
    actionEvent.viewData=dic;
    [[YoutubeController getController] sendActionEvent:actionEvent];
    [actionEvent release];
}

- (void) onReceiveSuccess:(ModelEvent *)modelEvent {
    ActionEvent* action= modelEvent.actionEvent;
    switch (action.action) {
            
        case GET_LIST_PLAYLIST: {
            
            playLists = modelEvent.modelData;
            [tableView reloadData];
        }
            break;
            
            
        default:
            break;
    }
    
}




- (void)viewDidLoad
{
    [super viewDidLoad];
    self.logoTitle = @"Playlists";
    [self requestListPlaylist];
    // init table view
    tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    //must set delegate and datasource
    tableView.delegate = self;
    tableView.dataSource = self;
    
    tableView.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view from its nib.
    
    //add to canvas
    [self.view addSubview:tableView];
}

#pragma mark - UITableViewDataSource
// number of section(s), now I assume there is only 1 section
- (NSInteger)numberOfSectionsInTableView:(UITableView *)theTableView
{
    return 1;
}

// number of row in the section, I assume there is only 1 row
- (NSInteger)tableView:(UITableView *)theTableView numberOfRowsInSection:(NSInteger)section
{
    return playLists.count;
}

// the cell will be returned to the tableView
- (UITableViewCell *)tableView:(UITableView *)theTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"HistoryCell";
    
    // Similar to UITableViewCell, but
    UITableViewCell *cell = (UITableViewCell *)[theTableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    // Just want to test, so I hardcode the data
    PlaylistDTO * item = [playLists objectAtIndex:indexPath.row] ;
    cell.textLabel.text = item.title;
    
    return cell;
}

#pragma mark - UITableViewDelegate
// when user tap the row, what action you want to perform
- (void)tableView:(UITableView *)theTableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"selected %d row", indexPath.row);
}


- (void)viewDidUnload
{
    
    [super viewDidUnload];
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)dealloc {
    [tableView release];
    [super dealloc];
}
@end

