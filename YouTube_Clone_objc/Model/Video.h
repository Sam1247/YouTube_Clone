//
//  Video.h
//  YouTube_Clone_objc
//
//  Created by Abdalla Elsaman on 11/27/19.
//  Copyright © 2019 Dumbies. All rights reserved.
//

#import <Foundation/Foundation.h>
#include "Channel.h"

NS_ASSUME_NONNULL_BEGIN

@interface Video : NSObject

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *thumbnailImageUrl;
@property (strong, nonatomic) Channel *channel;


@end

NS_ASSUME_NONNULL_END
