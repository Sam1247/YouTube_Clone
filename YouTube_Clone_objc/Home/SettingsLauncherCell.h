//
//  SettingsLauncherCellCollectionViewCell.h
//  YouTube_Clone_objc
//
//  Created by Abdalla Elsaman on 11/28/19.
//  Copyright © 2019 Dumbies. All rights reserved.
//

#import "BaseCell.h"
#import "Setting.h"

NS_ASSUME_NONNULL_BEGIN

@interface SettingsLauncherCell : BaseCell

@property (strong, nonatomic) Setting *setting;

@end

NS_ASSUME_NONNULL_END
