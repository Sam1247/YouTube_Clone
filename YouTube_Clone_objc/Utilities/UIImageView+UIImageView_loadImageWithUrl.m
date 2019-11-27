//
//  UIImageView+UIImageView_loadImageWithUrl.m
//  YouTube_Clone_objc
//
//  Created by Abdalla Elsaman on 11/27/19.
//  Copyright © 2019 Dumbies. All rights reserved.
//

#import "UIImageView+UIImageView_loadImageWithUrl.h"


@implementation UIImageView (UIImageView_loadImageWithUrl)

- (void)loadImageWithUr:(NSString *)urlString
{
    NSURL *url = [NSURL URLWithString:urlString];
    [[NSURLSession.sharedSession dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"%@", error);
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            self.image = [UIImage imageWithData:data];
        });
    }] resume];
}

@end
