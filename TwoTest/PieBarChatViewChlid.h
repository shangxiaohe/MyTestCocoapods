//
//  PieBarChatViewChlid.h
//  TwoTest
//
//  Created by ren on 2018/6/2.
//  Copyright © 2018年 ren. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "info.h"
@interface PieBarChatViewChlid : UIView
@property(strong ,nonatomic) NSArray<info*> *infos;
-(float)judge:(CGPoint)point Bool:(BOOL)jedge;
@end
