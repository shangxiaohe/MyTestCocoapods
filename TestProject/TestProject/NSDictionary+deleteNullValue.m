//
//  NSDictionary+deleteNullValue.m
//  TestProject
//
//  Created by lixianliang on 2018/10/10.
//  Copyright © 2018年 lixianliang. All rights reserved.
//

#import "NSDictionary+deleteNullValue.h"
#import<objc/runtime.h>

@implementation NSDictionary (deleteNullValue)


//+(void)initialize
//{
////    NSLog(@"agdfdsdfg");
//}


- (void)swizzeMethod:(SEL)origSelector withMethod:(SEL)newSelector

{
    
    Class class = [self class];
    
    Method originalMethod = class_getInstanceMethod(class, origSelector);//Method是运行时库的类
    
    Method swizzledMethod = class_getInstanceMethod(class, newSelector);
    
    BOOL didAddMethod = class_addMethod(class, origSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
    
    if (didAddMethod) {
        
        class_replaceMethod(class, newSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
        
    }else{
        
        method_exchangeImplementations(originalMethod, swizzledMethod);
        
    }
    
}




-(instancetype)my_initWithObjects:(id  _Nonnull const [])objects forKeys:(id<NSCopying>  _Nonnull const [])keys count:(NSUInteger)cnt
{
    return [self initWithObjectsAndKeys:@"a",@"b", nil];
}

//+(void)load
//{
//    static dispatch_once_t onceToken;
//
//    dispatch_once(&onceToken, ^{
//
//        id obj = [[self alloc]init];
//
//        [obj swizzeMethod:@selector(initWithObjects:forKeys:count:) withMethod:@selector(my_initWithObjects:forKeys:count:)];
//
//
//    });
//
//}

@end
