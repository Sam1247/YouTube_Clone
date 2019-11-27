//
//  Cache.h
//  YouTube_Clone_objc
//
//  Created by Abdalla Elsaman on 11/28/19.
//  Copyright © 2019 Dumbies. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Cache : NSObject

@property (strong, nonatomic) NSCache *cache;
+ (instancetype)sharedInstance;

@end

NS_ASSUME_NONNULL_END
