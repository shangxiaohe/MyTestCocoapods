//
//  Antilnjection.m
//  TestProject
//
//  Created by lixianliang on 2019/1/16.
//  Copyright © 2019年 lixianliang. All rights reserved.
//

#import <Foundation/Foundation.h>

static void _beforeMain(void) __attribute__((constructor));

void _beforeMain() {
    NSLog(@"[test] 前");
    dispatch_async(dispatch_get_main_queue(), ^{
        NSLog(@"[test]");
    });
}
