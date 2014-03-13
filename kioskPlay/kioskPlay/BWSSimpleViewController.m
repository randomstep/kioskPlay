//
//  BWSSimpleViewController.m
//  kioskPlay
//
//  Created by Stephen Christopher on 3/13/14.
//  Copyright (c) 2014 Big World Studios. All rights reserved.
//

#import "BWSSimpleViewController.h"

@interface BWSSimpleViewController ()

@end

@implementation BWSSimpleViewController

#pragma mark - Collection View

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 3;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section
{
    return (section + 2) ;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:@"Cell"
                                                                                forIndexPath:indexPath];
    return cell;
}

@end
