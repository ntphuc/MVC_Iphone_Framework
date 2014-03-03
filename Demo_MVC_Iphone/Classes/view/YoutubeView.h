//
//  YoutubeView.h
//  Demo_MVC_Iphone
//
//  Created by admin on 03/03/14.
//
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <MVC_Iphone_Framework/BaseViewController.h>

@interface YoutubeView : BaseViewController{
    NSMutableArray*listCategory;
}
@property (retain, nonatomic) IBOutlet UITableView *tableView;
@property (retain, nonatomic) NSMutableArray * listCategory;
@end

