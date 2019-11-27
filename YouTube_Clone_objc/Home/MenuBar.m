//
//  MenuBar.m
//  YouTube_Clone_objc
//
//  Created by Abdalla Elsaman on 11/27/19.
//  Copyright © 2019 Dumbies. All rights reserved.
//

#import "MenuBar.h"
#import "Constants.h"
#import "MenuBarCell.h"

@implementation MenuBar {
    NSString *cellId;
    NSArray *imageNames;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupViews];
        cellId = @"cellId";
        [self.collectionView registerClass:MenuBarCell.class forCellWithReuseIdentifier:cellId];
        imageNames = @[@"home", @"trending", @"subscriptions", @"account"];
        NSIndexPath *selectedIndexPath = [NSIndexPath indexPathForRow:0 inSection:0];
        [self.collectionView selectItemAtIndexPath:selectedIndexPath animated:NO scrollPosition:UICollectionViewScrollPositionNone];
    }
    return self;
}

- (void)setupViews
{
    UICollectionViewLayout *layout = UICollectionViewFlowLayout.new;
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    [self.collectionView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.collectionView setDataSource:self];
    [self.collectionView setDelegate:self];
    [self.collectionView setBackgroundColor:RED_YOUTUBE];
    [self addSubview:self.collectionView];
    
    [[self.collectionView.topAnchor constraintEqualToAnchor:self.topAnchor] setActive:YES];
    [[self.collectionView.bottomAnchor constraintEqualToAnchor:self.bottomAnchor] setActive:YES];
    [[self.collectionView.leftAnchor constraintEqualToAnchor:self.leftAnchor] setActive:YES];
    [[self.collectionView.rightAnchor constraintEqualToAnchor:self.rightAnchor] setActive:YES];
    
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(self.frame.size.width/4, self.frame.size.height);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 4;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    MenuBarCell *cell = (MenuBarCell *)[self.collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
    NSString *imagename = (NSString *)[imageNames objectAtIndex: indexPath.item];
    UIImage *image = [[UIImage imageNamed:imagename] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    [cell.imageView setImage:image];
    [cell setTintColor:[UIColor colorWithRed:91/255.0 green:14/255.0 blue:13/255.0 alpha:1]];
    return cell;
}


@end
