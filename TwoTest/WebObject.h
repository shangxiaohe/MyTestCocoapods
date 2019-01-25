//
//  WebObject.h
//  TwoTest
//
//  Created by ren on 2017/3/9.
//  Copyright © 2017年 ren. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JavaScriptCore/JavaScriptCore.h>
@protocol TestJSObjectProtocol <JSExport>

//此处我们测试几种参数的情况
-(void)TestNOParameter;
-(void)TestOneParameter:(NSString *)message;
-(void)TestTowParameter:(NSString *)message1 SecondParameter:(NSString *)message2;
@end

@interface WebObject : NSObject<TestJSObjectProtocol>


@end
