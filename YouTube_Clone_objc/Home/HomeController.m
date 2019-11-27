//
//  ViewController.m
//  YouTube_Clone_objc
//
//  Created by Abdalla Elsaman on 11/27/19.
//  Copyright © 2019 Dumbies. All rights reserved.
//

#import "HomeController.h"
#import "VideoCell.h"
#import "MenuBar.h"

@interface HomeController ()

@end

@implementation HomeController {
    NSString *cellId;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.collectionView setBackgroundColor:UIColor.whiteColor];
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width - 32, self.view.frame.size.height)];
    [titleLabel setText:@"Home"];
    [titleLabel setTextColor:UIColor.whiteColor];
    [titleLabel setFont:[UIFont systemFontOfSize:20]];
    [self.navigationItem setTitleView:titleLabel];
    [self.navigationController.navigationBar setTranslucent:NO];
    cellId = @"cellId";
    [self.collectionView registerClass:VideoCell.class forCellWithReuseIdentifier:cellId];
    [self.collectionView setContentInset:UIEdgeInsetsMake(50, 0, 0, 0)];
    [self.collectionView setVerticalScrollIndicatorInsets:UIEdgeInsetsMake(50, 0, 0, 0)];
    [self setupMenuBar];
}

- (void)setupMenuBar
{
    MenuBar *menyBar = MenuBar.new;
    [menyBar setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view addSubview:menyBar];
    [[menyBar.topAnchor constraintEqualToAnchor:self.view.topAnchor] setActive:YES];
    [[menyBar.leftAnchor constraintEqualToAnchor:self.view.leftAnchor] setActive:YES];
    [[menyBar.rightAnchor constraintEqualToAnchor:self.view.rightAnchor] setActive:YES];
    [[menyBar.heightAnchor constraintEqualToConstant:50] setActive:YES];
    
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
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
    CGFloat height = (self.view.frame.size.width - 16 - 16) * 9/16;
    return CGSizeMake(self.view.frame.size.width, height + 16 + 68);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}


@end
