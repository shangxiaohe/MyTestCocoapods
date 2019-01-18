//
//  UIImage+safe.m
//  TestProject
//
//  Created by lixianliang on 2018/10/10.
//  Copyright © 2018年 lixianliang. All rights reserved.
//

#import "UIImage+safe.h"
#import <objc/runtime.h>

@implementation UIImage (safe)

+ (void)load {
    // 获取替换后的类方法
    Method otherMethod = class_getClassMethod([UIImage class], @selector(imageNameNextWith:));
    // 获取替换前的类方法
    Method method = class_getClassMethod([UIImage class], @selector(imageNamed:));
    // 然后交换类方法
    method_exchangeImplementations(otherMethod, method);
}

// 把系统的方法替换成我们自己写的方法
+ (UIImage *)imageNameNextWith:(NSString *)nameString {
    UIImage *image = nil;
    image = [UIImage imageNameNextWith:[nameString stringByAppendingString:@"tupian.jpg"]];
    NSLog(@"1111-----");
    return image;
}


@end
