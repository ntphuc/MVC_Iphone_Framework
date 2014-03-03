//
//  YoutubeView.m
//  Demo_MVC_Iphone
//
//  Created by admin on 03/03/14.
//
//


#import "YoutubeView.h"
#import "YoutubeController.h"
#import <MVC_Iphone_Framework/ActionEvent.h>
#import "PlaylistDTO.h"
@interface YoutubeView ()

@end

@implementation YoutubeView
@synthesize tableView;
@synthesize listCategory;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void) requestListCategory
{
    
    ActionEvent* actionEvent=[[ActionEvent alloc] init];
    actionEvent.action = GET_LIST_CATEGORY;
    actionEvent.sender= self;
    [[YoutubeController getController] sendActionEvent:actionEvent];
    [actionEvent release];
}

- (void) onReceiveSuccess:(ModelEvent *)modelEvent {
    ActionEvent* action= modelEvent.actionEvent;
    switch (action.action) {
            
        case GET_LIST_CATEGORY: {
            //handle strane view.
            //[self displayData:modelEvent];
            listCategory = modelEvent.modelData;
            
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
    self.logoTitle = @"Categories";
    // [self requestListCategory];
    
    /* listCategory=[NSMutableArray arrayWithObjects:@"IELTS",@"TOEIC",@"TOEFL",@"SPEAKING",@"LISTENING",@"READING",
     @"WRITING",@"GRAMMAR",@"VOCABULARY",@"ENGLISH BUSINESS",@"VOA LEARN ENGLISH",@"BBC LEARN ENGLISH",@"LEARNING ENGLISH BY FILMS",@"LEARNING ENGLISH BY SONGS",nil];*/
    listCategory =[[NSMutableArray alloc] init];
    [self populateColorsArray];
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

- (void) populateColorsArray
{
	[listCategory addObject:@"IELTS"];
	[listCategory addObject:@"TOEIC"];
    [listCategory addObject:@"TOEFL"];
    [listCategory addObject:@"SPEAKING"];
    [listCategory addObject:@"LISTENING"];
    [listCategory addObject:@"READING"];
    [listCategory addObject:@"WRITING"];
    [listCategory addObject:@"GRAMMAR"];
    [listCategory addObject:@"VOCABULARY"];
    [listCategory addObject:@"ENGLISH BUSINESS"];
    [listCategory addObject:@"VOA LEARN ENGLISH"];
    [listCategory addObject:@"BBC LEARN ENGLISH"];
    [listCategory addObject:@"LEARNING ENGLISH BY FILMS"];
    [listCategory addObject:@"LEARNING ENGLISH BY SONGS"];
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
    return listCategory.count;
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
    NSString * item = [listCategory objectAtIndex:indexPath.row] ;
    cell.textLabel.text = item;
    
    return cell;
}

#pragma mark - UITableViewDelegate
// when user tap the row, what action you want to perform
- (void)tableView:(UITableView *)theTableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"selected %d row", indexPath.row);
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    NSString * item = [listCategory objectAtIndex:indexPath.row] ;
    [dic setObject:item forKey:@"category"];
    ActionEvent* action = [[ActionEvent alloc] init];
    action.action = GO_TO_PLAYLIST;
    action.sender = self;
    action.viewData = dic;
    [[YoutubeController getController] handleSwitchView:action];
    [action release];
    
}


- (void)viewDidUnload
{
    tableView=nil;
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
