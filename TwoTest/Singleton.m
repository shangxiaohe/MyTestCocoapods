//
//  Singleton.m
//  TwoTest
//
//  Created by ren on 2018/6/15.
//  Copyright © 2018年 ren. All rights reserved.
//

#import "Singleton.h"

@implementation Singleton
static Singleton *single = nil;
+(instancetype)shareSingleton
{
    
    @synchronized(self)
    {
        if(single == nil)
            single = [[Singleton alloc]init];
    }
    return single;
}


+(instancetype)allocWithZone:(struct _NSZone *)zone
{
    @synchronized(self)
    {
        if(single == nil)
            single = [super allocWithZone:zone];
    }
    return single;
}

@end
