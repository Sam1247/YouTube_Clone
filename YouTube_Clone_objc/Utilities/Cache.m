//
//  Cache.m
//  YouTube_Clone_objc
//
//  Created by Abdalla Elsaman on 11/28/19.
//  Copyright © 2019 Dumbies. All rights reserved.
//

#import "Cache.h"

@implementation Cache

+ (instancetype)sharedInstance {
    static Cache *sharedInstance = nil;
    static dispatch_once_t onceToken; // onceToken = 0
    dispatch_once(&onceToken, ^{
        sharedInstance = [[Cache alloc] init];
        sharedInstance.cache = NSCache.new;
    });
    return sharedInstance;
}

@end
