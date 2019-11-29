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
#import "SettingsLauncher.h"

@interface HomeController ()

@end

@implementation HomeController {
    NSString *cellId;
    NSMutableArray *videos;
    SettingsLauncher *settingsLauncher;
}

- (void)viewDidLoad
{
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
    settingsLauncher = SettingsLauncher.new;
    [self setupMenuBar];
    [self setupNavBarButtons];
    [self fetchVideos];
}

- (void)fetchVideos
{
    videos = NSMutableArray.new;
    NSURL *url = [NSURL URLWithString:@"https://s3-us-west-2.amazonaws.com/youtubeassets/home.json"];
    [[NSURLSession.sharedSession dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"%@", error);
        }
        NSError *errorSer;
        NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&errorSer];
        if (jsonArray) {
            for (NSDictionary *item in jsonArray) {
                Video *video = Video.new;
                Channel *channel = Channel.new;
                video.title = (NSString *)item[@"title"];
                video.thumbnailImageUrl = (NSString *)item[@"thumbnail_image_name"];
                NSDictionary *channelDic = item[@"channel"];
                channel.name = channelDic[@"name"];
                channel.profileImageUrl = channelDic[@"profile_image_name"];
                video.channel = channel;
                [self->videos addObject:video];
            }
            dispatch_async(dispatch_get_main_queue(), ^{
               [self.collectionView reloadData];
            });
        } else {
            NSLog(@"Error parsing JSON: %@", errorSer);
        }
    }] resume];
}

- (void)setupNavBarButtons
{
    UIImage *searchImage = [[UIImage imageNamed:@"search_icon"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem *searchBarButtonItem = [[UIBarButtonItem alloc] initWithImage:searchImage style:UIBarButtonItemStylePlain target:self action:@selector(handleSearch)];
    
    UIImage *moreImage = [[UIImage imageNamed:@"nav_more_icon"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIBarButtonItem *moreBarButtonItem = [[UIBarButtonItem alloc] initWithImage:moreImage style:UIBarButtonItemStylePlain target:self action:@selector(handleMore)];
    
    [self.navigationItem setRightBarButtonItems:@[moreBarButtonItem, searchBarButtonItem]];
}

- (void)handleSearch
{
    NSLog(@"sSC");
}

- (void)handleMore
{
    [settingsLauncher showSettings];
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
    return videos.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    VideoCell *cell = [self.collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
    cell.video = (Video *)[videos objectAtIndex:indexPath.item];
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
