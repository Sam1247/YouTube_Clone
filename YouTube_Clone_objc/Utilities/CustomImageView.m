//
//  CustomImageView.m
//  YouTube_Clone_objc
//
//  Created by Abdalla Elsaman on 11/28/19.
//  Copyright © 2019 Dumbies. All rights reserved.
//

#import "CustomImageView.h"
#import "Cache.h"

@implementation CustomImageView {
    NSString *imageUrlString;
}

- (void)loadImageWithUr:(NSString *)urlString
{
    imageUrlString = urlString;
    self.image = nil;
    NSURL *url = [NSURL URLWithString:urlString];
    NSCache *imageCache = Cache.sharedInstance.cache;
    
    NSData *imageData = [imageCache objectForKey: url];
    if (imageData) {
        self.image = [UIImage imageWithData:imageData];
        return;
    }
    
    [[NSURLSession.sharedSession dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"%@", error);
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            UIImage *image = [UIImage imageWithData:data];
            [imageCache setObject:data forKey:url];
            if ([urlString isEqualToString:self->imageUrlString]) {
                dispatch_async(dispatch_get_main_queue(), ^{
                   self.image = image;
                });
            }
        });
    }] resume];
}


@end
