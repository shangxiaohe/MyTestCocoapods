//
//  TenViewController.h
//  TwoTest
//
//  Created by ren on 2017/6/1.
//  Copyright © 2017年 ren. All rights reserved.
//

#import <UIKit/UIKit.h>

//代理传值
@protocol TenViewControllerDelegate <NSObject>

@required
-(void)textValue:(NSString *)text;

@end

@interface TenViewController : UIViewController
@property(nonatomic,assign)id<TenViewControllerDelegate>delegate;
@property NSInteger type;
@property(nonatomic,strong)void (^MyBlock)(NSString *text);
@property(nonatomic,copy)NSString *text1;

@end
