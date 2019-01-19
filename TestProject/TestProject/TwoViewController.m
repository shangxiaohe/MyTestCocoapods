//
//  TwoViewController.m
//  TestProject
//
//  Created by lixianliang on 2018/11/16.
//  Copyright © 2018年 lixianliang. All rights reserved.
//

#import "TwoViewController.h"
#import "MBProgressHUD.h"

#define STRING_NULL(str) (([str isKindOfClass:[NSNull class]] || str == nil ) ? @"":str)

@interface TwoViewController ()

@property (nonatomic, strong)UIButton *button;
@property (nonatomic, strong)UIView *view1;

@end

@implementation TwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    UIWebView *webview = [[UIWebView alloc]initWithFrame:self.view.frame];
//    [self.view addSubview:webview];
//
//    NSURL *url = [NSURL URLWithString:@"https://openapi.dvr163.com:442/cloudshop/index.html#/orderPayed/:3282"];
//
//    NSURLRequest *request = [NSURLRequest requestWithURL:url];
//
//    [webview loadRequest:request];
//    NSLog(@"[cloud]   0");
//    dispatch_sync(dispatch_get_main_queue(), ^{
//        NSLog(@"[cloud]   1");
//    });
    
    
    dispatch_queue_t queue = dispatch_queue_create("aaa", DISPATCH_QUEUE_SERIAL);
    
    dispatch_async(queue, ^{
        NSLog(@"[cloud] 1  %@",[NSThread currentThread]);
        dispatch_sync(queue, ^{
            sleep(1);
            NSLog(@"[cloud] 2  %@",[NSThread currentThread]);
        });
    });
    
    
    self.view.backgroundColor = [UIColor whiteColor];
    _button = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    _button.backgroundColor = [UIColor greenColor];
    
    UIView *view11 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 375, 500)];
    view11.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:view11];
    
    [view11 addSubview:_button];
    [_button addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    _view1 = [[UIView alloc]initWithFrame:CGRectMake(0, 500, 375, 150)];
    _view1.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_view1];
    
//    UIView *view2 = [[UIView alloc]initWithFrame:CGRectMake(0, 400, 375, 500)];
//    view2.backgroundColor = [UIColor whiteColor];
//    [self.view addSubview:view2];
    NSString *aa = @"aabb";
    NSString *bb = STRING_NULL(aa);
    
    NSLog(@"aa = %@ , bb = %@",aa,bb);
    
    
//    CGFloat b = 1.625;
    

//    NSString *d = [NSString stringWithFormat:@"%.2f",round(b * 100)/100];
    
    
    CGFloat effectOffset = 10.f;
    UIInterpolatingMotionEffect *effectX = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.x" type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
    effectX.maximumRelativeValue = @(effectOffset);
    effectX.minimumRelativeValue = @(-effectOffset);
    
    UIInterpolatingMotionEffect *effectY = [[UIInterpolatingMotionEffect alloc] initWithKeyPath:@"center.y" type:UIInterpolatingMotionEffectTypeTiltAlongVerticalAxis];
    effectY.maximumRelativeValue = @(effectOffset);
    effectY.minimumRelativeValue = @(-effectOffset);
    
    UIMotionEffectGroup *group = [[UIMotionEffectGroup alloc] init];
    group.motionEffects = @[effectX, effectY];
    
    [_button addMotionEffect:group];
    
}

- (void)buttonPressed:(UIButton *)sender {
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view1 animated:YES];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [hud hideAnimated:YES];
    });
    hud.mode = MBProgressHUDModeText;
    hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    hud.bezelView.backgroundColor = UIColor.blackColor;
    hud.label.textColor = UIColor.whiteColor;
    hud.label.text = @"加载中。。。。";
    hud.label.numberOfLines = 0;
}

@end
