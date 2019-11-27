//
//  MenuBarCell.m
//  YouTube_Clone_objc
//
//  Created by Abdalla Elsaman on 11/27/19.
//  Copyright © 2019 Dumbies. All rights reserved.
//

#import "MenuBarCell.h"

@implementation MenuBarCell

- (void)setupViews
{
    self.imageView = UIImageView.new;
    [self.imageView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self addSubview:self.imageView];
    
    [[self.imageView.heightAnchor constraintEqualToConstant:28] setActive:YES];
    [[self.imageView.widthAnchor constraintEqualToConstant:28] setActive:YES];
    [[[self.imageView centerYAnchor] constraintEqualToAnchor:self.centerYAnchor] setActive:YES];
    [[[self.imageView centerXAnchor] constraintEqualToAnchor:self.centerXAnchor] setActive:YES];
    
}

- (void)setHighlighted:(BOOL)highlighted
{
    self.imageView.tintColor = highlighted? UIColor.whiteColor: [UIColor colorWithRed:91/255.0 green:14/255.0 blue:13/255.0 alpha:1];
}

- (void)setSelected:(BOOL)selected
{
    self.imageView.tintColor = selected? UIColor.whiteColor: [UIColor colorWithRed:91/255.0 green:14/255.0 blue:13/255.0 alpha:1];
}

@end
