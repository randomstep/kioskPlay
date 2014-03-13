//
//  BWSMasterViewController.h
//  kioskPlay
//
//  Created by Stephen Christopher on 3/13/14.
//  Copyright (c) 2014 Big World Studios. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BWSDetailViewController;

@interface BWSMasterViewController : UITableViewController

@property (strong, nonatomic) BWSDetailViewController *detailViewController;

@end
