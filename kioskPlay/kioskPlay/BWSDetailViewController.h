//
//  BWSDetailViewController.h
//  kioskPlay
//
//  Created by Stephen Christopher on 3/13/14.
//  Copyright (c) 2014 Big World Studios. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BWSDetailViewController : UIViewController <UISplitViewControllerDelegate>

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
