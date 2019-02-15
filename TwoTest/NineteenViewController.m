//
//  NineteenViewController.m
//  TwoTest
//
//  Created by lixianliang on 2019/1/30.
//  Copyright © 2019年 ren. All rights reserved.
//

#import "NineteenViewController.h"
#import "AppDelegate.h"

#define viewWidth 40

@interface NineteenViewController ()


@end

@implementation NineteenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    AppDelegate * appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    
    appDelegate.allowRotation = YES;
    
    NSNumber *resetOrientationTarget = [NSNumber numberWithInt:UIInterfaceOrientationUnknown];
    
    [[UIDevice currentDevice] setValue:resetOrientationTarget forKey:@"orientation"];
    
    NSNumber *orientationTarget = [NSNumber numberWithInt:UIInterfaceOrientationLandscapeLeft];
    
    [[UIDevice currentDevice] setValue:orientationTarget forKey:@"orientation"];
    
    [self setUI];

}




- (void)setUI {
    
    self.view.backgroundColor = BACKCOLOR(255, 180, 180);
    
    UIView *viewOne = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH - 200, 185)];
    viewOne.center = CGPointMake(SCREEN_WIDTH/2, SCREEN_HEIGHT/2);
    viewOne.backgroundColor = BACKCOLOR(180, 255, 180);
    [self.view addSubview:viewOne];
    
    UIView *viewTwo = [[UIView alloc]initWithFrame:CGRectMake(viewOne.frame.origin.x + viewOne.frame.size.width - 60, viewOne.frame.origin.y - 100, 60, 100)];
    viewTwo.backgroundColor = BACKCOLOR(180, 255, 180);
    [self.view addSubview:viewTwo];
    
    UIView *viewThree = [[UIView alloc]initWithFrame:CGRectMake(viewOne.frame.origin.x, viewOne.frame.origin.y + viewOne.frame.size.height, 60, 100)];
    viewThree.backgroundColor = BACKCOLOR(180, 255, 180);
    [self.view addSubview:viewThree];
    
    UIView *view1 = [[UIView alloc]initWithFrame:CGRectMake(viewOne.frame.origin.x, viewOne.frame.origin.y + 5, viewWidth, viewWidth)];
    view1.backgroundColor = BACKCOLOR(255, 180, 180);
    [self.view addSubview:view1];
    view1.layer.masksToBounds = YES;
    view1.layer.cornerRadius = viewWidth/2;
    
    UIView *view2 = [[UIView alloc]initWithFrame:CGRectMake(viewOne.frame.origin.x + viewOne.frame.size.width - viewWidth, viewOne.frame.origin.y + 10 + viewWidth, viewWidth, viewWidth)];
    view2.backgroundColor = BACKCOLOR(255, 180, 180);
    [self.view addSubview:view2];
    view2.layer.masksToBounds = YES;
    view2.layer.cornerRadius = viewWidth/2;
    
    UIView *view3 = [[UIView alloc]initWithFrame:CGRectMake(viewOne.frame.origin.x, viewOne.frame.origin.y + 15 + viewWidth * 2, viewWidth, viewWidth)];
    view3.backgroundColor = BACKCOLOR(255, 180, 180);
    [self.view addSubview:view3];
    view3.layer.masksToBounds = YES;
    view3.layer.cornerRadius = viewWidth/2;
    
    UIView *view4 = [[UIView alloc]initWithFrame:CGRectMake(viewOne.frame.origin.x + viewOne.frame.size.width - viewWidth, viewOne.frame.origin.y + 20 + viewWidth * 3, viewWidth, viewWidth)];
    view4.backgroundColor = BACKCOLOR(255, 180, 180);
    [self.view addSubview:view4];
    view4.layer.masksToBounds = YES;
    view4.layer.cornerRadius = viewWidth/2;
    
    [UIView beginAnimations:@"testAnimation" context:nil];
    [UIView setAnimationDuration:1];
    [UIView setAnimationRepeatCount:INT_MAX];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    [UIView setAnimationRepeatAutoreverses:YES];
    [UIView setAnimationDelay:0];
    view1.frame = CGRectMake(viewOne.frame.origin.x + viewOne.frame.size.width - viewWidth, viewOne.frame.origin.y + 5, viewWidth, viewWidth);
    
    view2.frame = CGRectMake(viewOne.frame.origin.x, viewOne.frame.origin.y + 10 + viewWidth, viewWidth, viewWidth);
    
    view3.frame = CGRectMake(viewOne.frame.origin.x + viewOne.frame.size.width - viewWidth, viewOne.frame.origin.y + 15 + viewWidth * 2, viewWidth, viewWidth);
    
    view4.frame = CGRectMake(viewOne.frame.origin.x, viewOne.frame.origin.y + 20 + viewWidth * 3, viewWidth, viewWidth);
    
    [UIView commitAnimations];
    
    CGRect rect = view1.layer.presentationLayer.frame;
  
    [self addObserver:self forKeyPath:@"view1.layer.presentationLayer.frame" options:NSKeyValueObservingOptionNew context:nil];
    
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if ([keyPath isEqualToString:@"view1.layer.presentationLayer.frame"]) {
        NSLog(@"名字发生了改变");

    }
}



@end
