//
//  ViewController.m
//  TestProject
//
//  Created by lixianliang on 2018/9/4.
//  Copyright © 2018年 lixianliang. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>
#import "CALayer+Cgcolor.h"
#import "ModelOne.h"
#import "UIImageView+WebCache.h"

#import "OneViewController.h"
#import "TwoViewController.h"

@interface ViewController ()
{
    double time;
    UIButton *_button[16];
    NSArray *arr;
}
@property (nonatomic, strong) UIView *mainView;
@property (nonatomic, strong) UIView *subView;
@property (nonatomic, strong) UIButton *subButton;
@property (nonatomic, strong) UILabel *label;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _ID = @"bbbbb";
    
    [self layoutSubViews];
    
    
    
    NSMutableDictionary *dictionary = @{@"aa":@"bb",@"cc":@"dd"}.mutableCopy;
    
    
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithDictionary:[dictionary objectForKey:@"gg"]];
    NSArray *arrr = [dic allKeys];
    
    if ([arrr containsObject:@"aa"]) {
        NSLog(@"ddd");
    }
    
    
    NSLog(@"ddd");
    
    
}

#pragma mark UI

- (void)layoutSubViews
{
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.mainView];
    [self.mainView addSubview:self.subView];
    [self.view addSubview:self.subButton];
    
    
    UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
    [self.view addSubview:image];
    [image sd_setImageWithURL:[NSURL URLWithString:@"http://img.jiayun123.com/Public/data/uploads/cardimg/75174_201809271456181538031378.jpg"] placeholderImage:nil options:0 progress:^(NSInteger receivedSize, NSInteger expectedSize, NSURL * _Nullable targetURL) {

    } completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        if (error != nil) {
        }else {
            
            if (image) {
            }
        }
    }];
    
    NSMutableString *string = [NSMutableString stringWithString:@"qwertyui"];
    NSLog(@"*****:%@",string);
    string = [NSMutableString string];
    NSLog(@"----:%@",string);
    string = nil;
    NSLog(@"----:%@",string);
}


#pragma mark private method

- (void)animation
{
    time = 0;
    
    CABasicAnimation *animation1 = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    animation1.toValue = [NSNumber numberWithFloat:10];
    animation1.beginTime = time;
    animation1.duration = 2.0;
    animation1.removedOnCompletion = NO;
    animation1.fillMode = kCAFillModeForwards;
    
    time += animation1.duration;
    
    [self.subView.layer addAnimation:animation1 forKey:nil];
    
    [self performSelector:@selector(animationone) withObject:nil afterDelay:time];
}

- (void)triangle
{
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(50, 0)];
    [path addLineToPoint:CGPointMake(50 - 50 * cos(M_PI * 2 / 12), 50 + 50 * sin(M_PI * 2 / 12))];
    [path addLineToPoint:CGPointMake(50 + 50 * cos(M_PI * 2 / 12), 50 + 50 * sin(M_PI * 2 / 12))];
    [path addLineToPoint:CGPointMake(50, 0)];
    
    CAShapeLayer *triangleLayer = [[CAShapeLayer alloc]init];
    triangleLayer.frame = CGRectMake(0, 0, 100, 100);
    triangleLayer.position = self.view.center;
    triangleLayer.fillColor = [UIColor blackColor].CGColor;
    triangleLayer.path = path.CGPath;
    [self.mainView.layer addSublayer:triangleLayer];
    
}

- (void)animationone
{
    [self triangle];
    
    CABasicAnimation *animation2 = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    animation2.toValue = [NSNumber numberWithFloat:M_PI * 2 * 5];
    animation2.beginTime = 0;
    animation2.duration = 2.0;
    animation2.removedOnCompletion = NO;
    animation2.fillMode = kCAFillModeForwards;
    
    [self.mainView.layer addAnimation:animation2 forKey:nil];
    
    CABasicAnimation *animation3 = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    animation3.toValue = [NSNumber numberWithFloat:1];
    animation3.beginTime = 0;
    animation3.duration = 2.0;
    animation3.removedOnCompletion = NO;
    animation3.fillMode = kCAFillModeForwards;
    
    [self.subView.layer addAnimation:animation3 forKey:nil];
    
    time = animation3.duration;
    
    [self performSelector:@selector(animationtwo) withObject:nil afterDelay:time];
}

- (void)animationtwo
{
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(0, 100)];
    [path addLineToPoint:CGPointMake(0, 0)];
    [path addLineToPoint:CGPointMake(100, 0)];
    [path addLineToPoint:CGPointMake(100, 100)];
    [path addLineToPoint:CGPointMake(0, 100)];
    
    CAShapeLayer *triangleLayer = [[CAShapeLayer alloc]init];
    triangleLayer.frame = CGRectMake(0, 0, 100, 100);
    triangleLayer.position = self.view.center;
    triangleLayer.strokeColor = [UIColor redColor].CGColor;
    triangleLayer.fillColor = [UIColor clearColor].CGColor;
    triangleLayer.lineWidth = 5;
    triangleLayer.path = path.CGPath;
    triangleLayer.strokeStart = 0;
    triangleLayer.strokeEnd = 0;
    triangleLayer.lineCap = kCALineCapRound;
    triangleLayer.lineJoin = kCALineJoinRound;
    [self.mainView.layer addSublayer:triangleLayer];
    
    CABasicAnimation *animation4 = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation4.duration = 2;
    animation4.removedOnCompletion = NO;
    animation4.fillMode = kCAFillModeForwards;
    animation4.fromValue = (0);
    animation4.toValue = @(1);
    
    UIBezierPath *path11 = [UIBezierPath bezierPath];
    [path11 moveToPoint:CGPointMake(0, 100)];
    [path11 addLineToPoint:CGPointMake(0, 99)];
    [path11 addLineToPoint:CGPointMake(100, 99)];
    [path11 addLineToPoint:CGPointMake(100, 100)];
    [path11 addLineToPoint:CGPointMake(0, 100)];
    
    UIBezierPath *path12 = [UIBezierPath bezierPath];
    [path12 moveToPoint:CGPointMake(0, 100)];
    [path12 addLineToPoint:CGPointMake(0, 80)];
    [path12 addCurveToPoint:CGPointMake(100, 80) controlPoint1:CGPointMake(30, 85) controlPoint2:CGPointMake(70, 75)];
    [path12 addLineToPoint:CGPointMake(100, 100)];
    [path12 addLineToPoint:CGPointMake(0, 100)];
    
    UIBezierPath *path13 = [UIBezierPath bezierPath];
    [path13 moveToPoint:CGPointMake(0, 100)];
    [path13 addLineToPoint:CGPointMake(0, 60)];
    [path13 addCurveToPoint:CGPointMake(100, 60) controlPoint1:CGPointMake(30, 65) controlPoint2:CGPointMake(70, 55)];
    [path13 addLineToPoint:CGPointMake(100, 100)];
    [path13 addLineToPoint:CGPointMake(0, 100)];
    
    UIBezierPath *path14 = [UIBezierPath bezierPath];
    [path14 moveToPoint:CGPointMake(0, 100)];
    [path14 addLineToPoint:CGPointMake(0, 40)];
    [path14 addCurveToPoint:CGPointMake(100, 40) controlPoint1:CGPointMake(30, 45) controlPoint2:CGPointMake(70, 35)];
    [path14 addLineToPoint:CGPointMake(100, 100)];
    [path14 addLineToPoint:CGPointMake(0, 100)];
    
    UIBezierPath *path15 = [UIBezierPath bezierPath];
    [path15 moveToPoint:CGPointMake(0, 100)];
    [path15 addLineToPoint:CGPointMake(0, 40)];
    [path15 addCurveToPoint:CGPointMake(100, 40) controlPoint1:CGPointMake(30, 45) controlPoint2:CGPointMake(70, 35)];
    [path15 addLineToPoint:CGPointMake(100, 100)];
    [path15 addLineToPoint:CGPointMake(0, 100)];

    [triangleLayer addAnimation:animation4 forKey:nil];
}


#pragma mark Event

- (void)buttonPressed:(UIButton *)sender
{
    TwoViewController *oneVC = [[TwoViewController alloc]init];
    [self presentViewController:oneVC animated:YES completion:nil];
//    [self animation];
}


#pragma mark getter

-(UIView *)mainView
{
    if(!_mainView) {
        _mainView = [[UIView alloc]initWithFrame:self.view.bounds];
        _mainView.backgroundColor = [UIColor clearColor];
    }
    return _mainView;
}

- (UIView *)subView
{
    if(!_subView) {
        _subView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 10, 10)];
        _subView.center = self.view.center;
        _subView.backgroundColor = [UIColor blackColor];
        _subView.layer.cornerRadius = 5;
        _subView.layer.masksToBounds = YES;
    }
    return _subView;
}

- (UIButton *)subButton
{
    if(!_subButton) {
        _subButton = [[UIButton alloc]initWithFrame:CGRectMake(self.view.bounds.size.width / 2 - 40, self.view.bounds.size.height - 60, 80, 40)];
        _subButton.backgroundColor = [UIColor purpleColor];
        [_subButton addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _subButton;
}

- (UILabel *)label
{
    if(!_label) {
        _label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 40)];
        _label.center = self.view.center;
        _label.backgroundColor = [UIColor redColor];
    }
    return _label;
}


@end
