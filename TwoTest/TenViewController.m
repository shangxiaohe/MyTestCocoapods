//
//  TenViewController.m
//  TwoTest
//
//  Created by ren on 2017/6/1.
//  Copyright © 2017年 ren. All rights reserved.
//

#import "TenViewController.h"

@interface TenViewController ()<UIScrollViewDelegate>
{
    UITextField *textfiled;
    UIScrollView *scrollView1;
    UIView *view1;

}

@end

@implementation TenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    textfiled = [[UITextField alloc]initWithFrame:CGRectMake(10, 40, 350, 40)];
    [self.view addSubview:textfiled];
    textfiled.backgroundColor = [UIColor lightGrayColor];
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(130, 90, 80, 40)];
    [button setTitle:@"确定" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:button];
    [button addTarget:self action:@selector(buttonpressed:) forControlEvents:UIControlEventTouchUpInside];
    
    scrollView1 = [[UIScrollView alloc]initWithFrame:self.view.frame];
    scrollView1.delegate =  self;
    [self.view addSubview:scrollView1];
    scrollView1.contentSize = CGSizeMake(2000, 0);
    scrollView1.backgroundColor = [UIColor lightGrayColor];
    
    view1 = [[UIView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    view1.backgroundColor = [UIColor greenColor];
    [scrollView1 addSubview:view1];
    
    
}

-(void)buttonpressed:(UIButton*)sender
{
    switch (_type) {
        case 1:
            if(self.delegate && [self.delegate respondsToSelector:@selector(textValue:)])
                [self.delegate textValue:textfiled.text];
            break;
        case 2:
            if(self.MyBlock != nil)
                self.MyBlock(textfiled.text);
            break;
        case 3:
        {
            NSNotification *noti = [NSNotification notificationWithName:@"textValue" object:nil userInfo:@{@"key":textfiled.text}];
            [[NSNotificationCenter defaultCenter] postNotification:noti];
        }
            break;
        case 4:
            self.text1 = textfiled.text;
            break;
        default:
            break;
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGRect view1frame = view1.frame;
    
    view1frame.origin.x = scrollView.contentOffset.x+100;
    view1.frame = view1frame;
    
    [scrollView1 bringSubviewToFront:view1];
}

@end
