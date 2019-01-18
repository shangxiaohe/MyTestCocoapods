//
//  CALayer+Cgcolor.m
//  TestProject
//
//  Created by lixianliang on 2018/9/6.
//  Copyright © 2018年 lixianliang. All rights reserved.
//

#import "CALayer+Cgcolor.h"

@implementation CALayer (Cgcolor)
@dynamic newBorderColor;
- (void)setNewBorderColor:(UIColor *)newBorderColor
{
    self.borderColor = newBorderColor.CGColor;
}

@end
