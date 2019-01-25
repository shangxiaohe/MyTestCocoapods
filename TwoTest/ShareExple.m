//
//  ShareExple.m
//  TwoTest
//
//  Created by ren on 2017/3/20.
//  Copyright © 2017年 ren. All rights reserved.
//

#import "ShareExple.h"

static ShareExple *shareSingle;

@implementation ShareExple

+(instancetype)allocWithZone:(struct _NSZone *)zone
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if(!shareSingle)
            shareSingle = [super allocWithZone:zone];
    });
    return shareSingle;
}


+(instancetype)sharedInstance
{
    static dispatch_once_t onceToken;
    NSLog(@"onceToken = %ld",onceToken);
    dispatch_once(&onceToken, ^{
        NSLog(@"onceToken = %ld",onceToken);
        if(!shareSingle)
            shareSingle = [[self alloc]init];
    });
    NSLog(@"onceToken = %ld",onceToken);
    return shareSingle;
}


@end
