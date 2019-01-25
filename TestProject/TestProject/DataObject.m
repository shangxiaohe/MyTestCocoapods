//
//  DataObject.m
//  TestProject
//
//  Created by lixianliang on 2019/1/23.
//  Copyright © 2019年 lixianliang. All rights reserved.
//

#import "DataObject.h"

@interface DataObject ()

@property (nonatomic, copy) dataObjectBlock selfBlock;
@end

@implementation DataObject

- (void)messageSend:(dataObjectBlock)messageBlock {
    self.selfBlock = messageBlock;
    
    self.selfBlock(@"frist");
}

- (void)blockAction {
    self.selfBlock(@"second");
}

@end
