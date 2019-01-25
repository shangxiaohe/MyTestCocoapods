//
//  DataObject.h
//  TestProject
//
//  Created by lixianliang on 2019/1/23.
//  Copyright © 2019年 lixianliang. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void(^dataObjectBlock)(NSString *messgae);
@interface DataObject : NSObject
- (void)messageSend:(dataObjectBlock)messageBlock;

- (void)blockAction;
@end
