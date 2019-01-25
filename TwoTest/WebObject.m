//
//  WebObject.m
//  TwoTest
//
//  Created by ren on 2017/3/9.
//  Copyright © 2017年 ren. All rights reserved.
//

#import "WebObject.h"

@implementation WebObject

-(void)TestNOParameter
{
    NSLog(@"this is ios TestNOParameter");
}
-(void)TestOneParameter:(NSString *)message
{
    NSLog(@"this is ios TestOneParameter=%@",message);
}
-(void)TestTowParameter:(NSString *)message1 SecondParameter:(NSString *)message2
{
    NSLog(@"this is ios TestTowParameter=%@  Second=%@",message1,message2);
}

@end
