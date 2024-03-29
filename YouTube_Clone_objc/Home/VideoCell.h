//
//  VideoCell.h
//  YouTube_Clone_objc
//
//  Created by Abdalla Elsaman on 11/27/19.
//  Copyright © 2019 Dumbies. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseCell.h"
#import "Video.h"

NS_ASSUME_NONNULL_BEGIN

@interface VideoCell : BaseCell

@property (strong, nonatomic) Video *video;

@end

NS_ASSUME_NONNULL_END
