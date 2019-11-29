//
//  Settings.m
//  YouTube_Clone_objc
//
//  Created by Abdalla Elsaman on 11/28/19.
//  Copyright © 2019 Dumbies. All rights reserved.
//

#import "Setting.h"

@implementation Setting



- (instancetype)initWithName:(NSString *)name withImageName:(NSString *)imageName
{
    self = [super init];
    if (self) {
        self.name = name;
        self.imageName = imageName;
    }
    return self;
}

@end
