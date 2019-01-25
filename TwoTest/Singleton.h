//
//  Singleton.h
//  TwoTest
//
//  Created by ren on 2018/6/15.
//  Copyright © 2018年 ren. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Singleton : NSObject
@property (nonatomic,strong) NSString *name;
+(instancetype)shareSingleton;
@end
