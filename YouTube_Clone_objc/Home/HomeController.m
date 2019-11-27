//
//  ViewController.m
//  YouTube_Clone_objc
//
//  Created by Abdalla Elsaman on 11/27/19.
//  Copyright © 2019 Dumbies. All rights reserved.
//

#import "HomeController.h"
#import "VideoCell.h"

@interface HomeController ()

@end

@implementation HomeController {
    NSString *cellId;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.collectionView setBackgroundColor:UIColor.whiteColor];
    [self.navigationItem setTitle:@"Home"];
    cellId = @"cellId";
    [self.collectionView registerClass:VideoCell.class forCellWithReuseIdentifier:cellId];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 5;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(self.view.frame.size.width, 200);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}


@end
