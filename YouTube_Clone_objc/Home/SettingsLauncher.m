//
//  SettingsLauncher.m
//  YouTube_Clone_objc
//
//  Created by Abdalla Elsaman on 11/28/19.
//  Copyright © 2019 Dumbies. All rights reserved.
//

#import "SettingsLauncher.h"
#import "SettingsLauncherCell.h"
#import "Setting.h"

@implementation SettingsLauncher {
    UICollectionView *collectionView;
    NSString *cellId;
    NSArray<Setting *> *settings;
}


- (instancetype)init
{
    self = [super init];
    if (self) {
        collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:UICollectionViewFlowLayout.new];
        [collectionView setDelegate:self];
        [collectionView setDataSource:self];
        cellId = @"cellId";
        [collectionView registerClass:SettingsLauncherCell.class forCellWithReuseIdentifier:cellId];
        settings = @[[[Setting alloc] initWithName:@"Settings" withImageName:@"settings"],
                     [[Setting alloc] initWithName:@"Terms & privacy policy" withImageName:@"privacy"],
                     [[Setting alloc] initWithName:@"Send Feedback" withImageName:@"feedback"],
                     [[Setting alloc] initWithName:@"Help" withImageName:@"help"],
                     [[Setting alloc] initWithName:@"Switch Account" withImageName:@"switch_account"],
                     [[Setting alloc] initWithName:@"Cancel" withImageName:@"cancel"]
        ];
    }
    return self;
}

- (void)showSettings
{
    UIWindow *mainWindow = UIApplication.sharedApplication.keyWindow;
    self.blackView = UIView.new;
    [self.blackView setBackgroundColor:[UIColor colorWithWhite:0 alpha:0.5]];
    [mainWindow addSubview:self.blackView];
    [self.blackView setFrame:mainWindow.frame];
    [self.blackView setAlpha:0];
    
    [mainWindow addSubview:collectionView];
    [collectionView setBackgroundColor:UIColor.whiteColor];
    CGFloat y = mainWindow.frame.size.height - 5*60;
    [collectionView setFrame:CGRectMake(0, mainWindow.frame.size.height, mainWindow.frame.size.width, 5*60)];
    
    [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:1 initialSpringVelocity:1 options:UIViewAnimationOptionCurveEaseOut animations:^{
        [self.blackView setAlpha:1];
        [self->collectionView setFrame:CGRectMake(0, y, mainWindow.frame.size.width, 5*60)];
    } completion:nil];
    //
    [self.blackView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleDismiss)]];
}

- (void)handleDismiss
{
    UIWindow *mainWindow = UIApplication.sharedApplication.keyWindow;
    [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:1 initialSpringVelocity:1 options:UIViewAnimationOptionCurveEaseOut animations:^{
        [self.blackView setAlpha:0];
        [self->collectionView setFrame:CGRectMake(0, mainWindow.frame.size.height, mainWindow.frame.size.width, 5*60)];
    } completion:nil];
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return settings.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    SettingsLauncherCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
    cell.setting = settings[indexPath.item];
    //[cell setBackgroundColor:UIColor.blueColor];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(self.blackView.frame.size.width, 50);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}

@end
