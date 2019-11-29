//
//  SettingsLauncherCellCollectionViewCell.m
//  YouTube_Clone_objc
//
//  Created by Abdalla Elsaman on 11/28/19.
//  Copyright © 2019 Dumbies. All rights reserved.
//

#import "SettingsLauncherCell.h"

@implementation SettingsLauncherCell {
    UIImageView *iconImageView;
    UILabel *nameLabel;
}

- (void)setHighlighted:(BOOL)highlighted
{
    [self setBackgroundColor:highlighted? UIColor.darkGrayColor: UIColor.whiteColor];
    [nameLabel setTextColor:highlighted? UIColor.whiteColor: UIColor.blackColor];
    [iconImageView setTintColor:highlighted? UIColor.whiteColor: UIColor.darkGrayColor];
}
- (void)setSetting:(Setting *)setting
{
    _setting = setting;
    UIImage *image = [UIImage imageNamed:self.setting.imageName];
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    [iconImageView setTintColor:UIColor.darkGrayColor];
    [iconImageView setImage:image];
    [nameLabel setText:self.setting.name];
}

- (void)setupViews
{
    iconImageView = UIImageView.new;
    //[iconImageView setBackgroundColor:UIColor.redColor];
    [iconImageView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.contentView addSubview:iconImageView];
    
    nameLabel = UILabel.new;
    [nameLabel setText:@"Settings"];
    [nameLabel setFont:[UIFont systemFontOfSize:13]];
    //[nameLabel setBackgroundColor:UIColor.purpleColor];
    [nameLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.contentView addSubview:nameLabel];
    //
    [[iconImageView.leftAnchor constraintEqualToAnchor:self.leftAnchor constant:8] setActive:YES];
    [[iconImageView.widthAnchor constraintEqualToConstant:30] setActive:YES];
    [[iconImageView.heightAnchor constraintEqualToConstant:30] setActive:YES];
    [[iconImageView.centerYAnchor constraintEqualToAnchor:self.centerYAnchor] setActive:YES];
    
    [[nameLabel.leftAnchor constraintEqualToAnchor:iconImageView.rightAnchor constant:8] setActive:YES];
    [[nameLabel.rightAnchor constraintEqualToAnchor:self.rightAnchor] setActive:YES];
    [[nameLabel.centerYAnchor constraintEqualToAnchor:self.centerYAnchor] setActive:YES];
    [[nameLabel.heightAnchor constraintEqualToConstant:30] setActive:YES];
}

@end
