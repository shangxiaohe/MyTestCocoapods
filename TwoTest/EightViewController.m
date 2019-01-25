//
//  EightViewController.m
//  TwoTest
//
//  Created by ren on 2017/3/30.
//  Copyright © 2017年 ren. All rights reserved.
//

#import "EightViewController.h"

#define WIDTH [UIScreen mainScreen].bounds.size.width
#define BUTTONWIDTH (([UIScreen mainScreen].bounds.size.width - 40) / 3)

@interface EightViewController ()
{
    UIScrollView *scrollview;
    NSArray *arr;
}

@end

@implementation EightViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    arr = @[@1,@2,@3,@4,@1,@2,@3,@4,@1,@2,@3,@4,@1,@2,@3,@4,@1,@2,@3,@3];
    scrollview = [[UIScrollView alloc]initWithFrame:self.view.frame];
    [self.view addSubview:scrollview];
    scrollview.pagingEnabled = YES;
    scrollview.backgroundColor = [UIColor yellowColor];
    [self mainView];
    
}


-(void)mainView
{
    if(arr.count%6)
        scrollview.contentSize = CGSizeMake((arr.count/6+1)*WIDTH, 0);
    else
        scrollview.contentSize = CGSizeMake((arr.count/6)*WIDTH, 0);
    for(int i = 0 ; i < arr.count ; i++)
    {
        UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(((i%3)*BUTTONWIDTH+10*(i%3+1))+((i/6)*WIDTH), ((i-6*(i/6))/3)*BUTTONWIDTH+10*((i-6*(i/6))/3 + 1), BUTTONWIDTH, BUTTONWIDTH)];

        button.backgroundColor = [UIColor greenColor];
        [button setTitle:[NSString stringWithFormat:@"%d",i+1] forState:UIControlStateNormal];
        [scrollview addSubview:button];
    }
}


@end
