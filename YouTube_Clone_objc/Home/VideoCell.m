//
//  VideoCell.m
//  YouTube_Clone_objc
//
//  Created by Abdalla Elsaman on 11/27/19.
//  Copyright © 2019 Dumbies. All rights reserved.
//

#import "VideoCell.h"

@implementation VideoCell

- (void)setupViews
{
    // initializing views
    UIImageView *thumbnailImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    [thumbnailImageView setImage:[UIImage imageNamed:@"thumbnail"]];
    [thumbnailImageView setContentMode:UIViewContentModeScaleAspectFill];
    [thumbnailImageView setClipsToBounds:YES];
    [thumbnailImageView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.contentView addSubview:thumbnailImageView];
    [thumbnailImageView setBackgroundColor:UIColor.blueColor];
    
    UIImageView *userProfileImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    [userProfileImageView setImage:[UIImage imageNamed:@"bigGigLogo"]];
    [userProfileImageView.layer setCornerRadius:22];
    [userProfileImageView.layer setMasksToBounds:YES];
    [userProfileImageView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.contentView addSubview:userProfileImageView];
    [userProfileImageView setBackgroundColor:UIColor.greenColor];
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    [titleLabel setText:@"Big Gigantic - The Little Things"];
    [titleLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.contentView addSubview:titleLabel];
    //[titleLabel setBackgroundColor:UIColor.purpleColor];
    
    UITextView *subtitleTextView = [[UITextView alloc] initWithFrame:CGRectZero];
    [subtitleTextView setText:@"1,746,738 views•Mar 2, 2016"];
    [subtitleTextView setTextContainerInset:UIEdgeInsetsMake(0, -4, 0, 0)];
    [subtitleTextView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.contentView addSubview:subtitleTextView];
    [subtitleTextView setTextColor:UIColor.lightGrayColor];
    //[subtitleTextView setBackgroundColor:UIColor.redColor];
    
    UIView *separatorLine = [[UIView alloc] initWithFrame:CGRectZero];
    [separatorLine setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.contentView addSubview:separatorLine];
    [separatorLine setBackgroundColor:[UIColor colorWithRed:230/255 green:230/255 blue:230/255 alpha:.1]];
    
    // setup constraints
    
    [[thumbnailImageView.topAnchor constraintEqualToAnchor:self.topAnchor constant:16] setActive:YES];
    [[thumbnailImageView.bottomAnchor constraintEqualToAnchor:userProfileImageView.topAnchor constant:-8] setActive:YES];
    [[thumbnailImageView.leftAnchor constraintEqualToAnchor:self.leftAnchor constant:16] setActive:YES];
    [[thumbnailImageView.rightAnchor constraintEqualToAnchor:self.rightAnchor constant:-16] setActive:YES];
    
    [[userProfileImageView.leftAnchor constraintEqualToAnchor:thumbnailImageView.leftAnchor] setActive:YES];
    [[userProfileImageView.bottomAnchor constraintEqualToAnchor:separatorLine.topAnchor constant:-16] setActive:YES];
    [[userProfileImageView.widthAnchor constraintEqualToConstant:44] setActive:YES];
    [[userProfileImageView.heightAnchor constraintEqualToConstant:44] setActive:YES];
    
    [[titleLabel.topAnchor constraintEqualToAnchor:userProfileImageView.topAnchor] setActive:YES];
    [[titleLabel.leftAnchor constraintEqualToAnchor:userProfileImageView.rightAnchor constant:8] setActive:YES];
    [[titleLabel.rightAnchor constraintEqualToAnchor:thumbnailImageView.rightAnchor] setActive:YES];
    [[titleLabel.heightAnchor constraintEqualToConstant:20] setActive:YES];
    
    [[subtitleTextView.leftAnchor constraintEqualToAnchor:titleLabel.leftAnchor] setActive:YES];
    [[subtitleTextView.rightAnchor constraintEqualToAnchor:titleLabel.rightAnchor] setActive:YES];
    [[subtitleTextView.bottomAnchor constraintEqualToAnchor:separatorLine.topAnchor] setActive:YES];
    [[subtitleTextView.heightAnchor constraintEqualToConstant:35] setActive:YES];
    
    [[separatorLine.bottomAnchor constraintEqualToAnchor:self.bottomAnchor] setActive:YES];
    [[separatorLine.leftAnchor constraintEqualToAnchor:self.leftAnchor] setActive:YES];
    [[separatorLine.rightAnchor constraintEqualToAnchor:self.rightAnchor] setActive:YES];
    [[separatorLine.heightAnchor constraintEqualToConstant:1.0] setActive:YES];
}

@end
