//
//  BWSDetailViewController.m
//  kioskPlay
//
//  Created by Stephen Christopher on 3/13/14.
//  Copyright (c) 2014 Big World Studios. All rights reserved.
//

#import "BWSDetailViewController.h"

#import "BWSSimpleViewController.h"

@interface BWSDetailViewController ()
@property (strong, nonatomic) UIPopoverController *masterPopoverController;

@property (nonatomic, strong) UIWindow *externalWindow;
@property (nonatomic, strong) UIView *externalView;

@property (weak, nonatomic) IBOutlet UIButton *startButton;

- (IBAction)startShow:(UIButton *)sender;

- (void)configureView;
@end

@implementation BWSDetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }

    if (self.masterPopoverController != nil) {
        [self.masterPopoverController dismissPopoverAnimated:YES];
    }        
}

- (IBAction)startShow:(UIButton *)sender
{
    __unused BOOL setup = [self configureExternalView];

}

- (BOOL)configureExternalView
{
    NSArray *screens = [UIScreen screens];
    if (screens.count < 2) return NO;

    UIScreen *secondScreen = screens[1];

    self.externalWindow = [[UIWindow alloc] initWithFrame:secondScreen.applicationFrame];
    self.externalWindow.screen = secondScreen;

    self.externalWindow.backgroundColor = [UIColor orangeColor];

    UIStoryboard *collectionStoryboard = [UIStoryboard storyboardWithName:@"Collections" bundle:nil];
    BWSSimpleViewController *simpleVC = [collectionStoryboard instantiateInitialViewController];

    [self.externalWindow setRootViewController:simpleVC];

    [self.externalWindow makeKeyAndVisible];

    return YES;
}

- (void)configureView
{
    // Update the user interface for the detail item.

    if (self.detailItem) {
        self.detailDescriptionLabel.text = [self.detailItem description];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Split view

- (void)splitViewController:(UISplitViewController *)splitController willHideViewController:(UIViewController *)viewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)popoverController
{
    barButtonItem.title = NSLocalizedString(@"Master", @"Master");
    [self.navigationItem setLeftBarButtonItem:barButtonItem animated:YES];
    self.masterPopoverController = popoverController;
}

- (void)splitViewController:(UISplitViewController *)splitController willShowViewController:(UIViewController *)viewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    // Called when the view is shown again in the split view, invalidating the button and popover controller.
    [self.navigationItem setLeftBarButtonItem:nil animated:YES];
    self.masterPopoverController = nil;
}

@end
