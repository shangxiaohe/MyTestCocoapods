//
//  ThreeViewController.m
//  TwoTest
//
//  Created by ren on 2016/12/30.
//  Copyright © 2016年 ren. All rights reserved.
//

#import "ThreeViewController.h"
#import "FourViewController.h"

@interface ThreeViewController ()
{
    NSInteger labelTag;//记录最后点击了哪个颜色
    CGPoint labelCenter;//记录最后点击的的那个颜色的中心位置
    NSMutableArray *labelCenterArr; //记录所有颜色的中心位置
}

@end

@implementation ThreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UITapGestureRecognizer *tapGest11 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(setLabelTag:)];
    UITapGestureRecognizer *tapGest13 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(setLabelTag:)];
    UITapGestureRecognizer *tapGest41 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(setLabelTag:)];
    UITapGestureRecognizer *tapGest42 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(setLabelTag:)];
    UITapGestureRecognizer *tapGest31 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(setLabelTag:)];
    UITapGestureRecognizer *tapGest34 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(setLabelTag:)];
    UITapGestureRecognizer *tapGest21 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(setLabelTag:)];
    UITapGestureRecognizer *tapGest25 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(setLabelTag:)];
    [_green11 addGestureRecognizer:tapGest11];
    [_green13 addGestureRecognizer:tapGest13];
    [_orange41 addGestureRecognizer:tapGest41];
    [_orange42 addGestureRecognizer:tapGest42];
    [_blue31 addGestureRecognizer:tapGest31];
    [_blue34 addGestureRecognizer:tapGest34];
    [_purple21 addGestureRecognizer:tapGest21];
    [_purple25 addGestureRecognizer:tapGest25];
    
    labelCenterArr = [NSMutableArray array];
    [self labelCenter];
}
- (IBAction)buttonPressed:(UIButton *)sender
{
    if(sender.tag == 110)
    {
        FourViewController *fourVC = [self.storyboard instantiateViewControllerWithIdentifier:@"FourViewController"];
        [self presentViewController:fourVC animated:YES completion:nil];
    }
    //判断点击的button上是否有颜色，有则不作处理
    else if([self judgeButton:sender])
        return;
    else
    {
        if([self judgeButtonLabel:sender])
        {
            [self labelMove:sender];
            [self labelCenter];
        }
        else
            return;
    }
    
}

-(void)setLabelTag:(UITapGestureRecognizer*)sender
{
    labelTag = sender.view.tag;
    labelCenter = sender.view.center;
}

//把所有颜色的中心位置放到一个数组里面
-(void)labelCenter
{
    [labelCenterArr removeAllObjects];
    for(int i = 11; i< 14; i++)
    {
        UILabel *label = (UILabel*)[self.view viewWithTag:i];
        [labelCenterArr addObject:NSStringFromCGPoint(label.center)];
    }
    for(int i = 21; i< 26; i++)
    {
        UILabel *label = (UILabel*)[self.view viewWithTag:i];
        [labelCenterArr addObject:NSStringFromCGPoint(label.center)];
    }
    for(int i = 31; i< 35; i++)
    {
        UILabel *label = (UILabel*)[self.view viewWithTag:i];
        [labelCenterArr addObject:NSStringFromCGPoint(label.center)];
    }
    for(int i = 41; i< 43; i++)
    {
        UILabel *label = (UILabel*)[self.view viewWithTag:i];
        [labelCenterArr addObject:NSStringFromCGPoint(label.center)];
    }
}

//判断点击的button上是否有颜色，有则不作处理
-(BOOL)judgeButton:(UIButton*)sender
{
    if([labelCenterArr containsObject:NSStringFromCGPoint(sender.center)])
        return YES;
    else
        return NO;
}
//判断点击的button上下左右是否有最后记录的颜色
-(BOOL)judgeButtonLabel:(UIButton*)sender
{
    if((fabs(sender.center.x - labelCenter.x) == 41 && fabs(sender.center.y - labelCenter.y)== 0)|| (fabs(sender.center.x - labelCenter.x) == 0 && fabs(sender.center.y - labelCenter.y)== 41))
        return YES;
    else
        return NO;
}

//颜色移动
-(void)labelMove:(UIButton*)sender
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    labelCenter = sender.center;
    CGPoint center = sender.center;
    CGPoint center1;
    switch (labelTag) {
        case 11:
            for(int i = 11 ; i< 14 ; i++)
            {
                UILabel *label = (UILabel*)[self.view viewWithTag:i];
                center1 = label.center;
                label.center = center;
                center = center1;
            }
            break;
        case 13:
            for(int i = 13 ; i> 10 ; i--)
            {
                UILabel *label = (UILabel*)[self.view viewWithTag:i];
                center1 = label.center;
                label.center = center;
                center = center1;
            }
            break;
        case 21:
            for(int i = 21 ; i< 26 ; i++)
            {
                UILabel *label = (UILabel*)[self.view viewWithTag:i];
                center1 = label.center;
                label.center = center;
                center = center1;
            }
            break;
        case 25:
            for(int i = 25 ; i> 20 ; i--)
            {
                UILabel *label = (UILabel*)[self.view viewWithTag:i];
                center1 = label.center;
                label.center = center;
                center = center1;
            }
            break;
        case 31:
            for(int i = 31 ; i< 35 ; i++)
            {
                UILabel *label = (UILabel*)[self.view viewWithTag:i];
                center1 = label.center;
                label.center = center;
                center = center1;
            }
            break;
        case 34:
            for(int i = 34 ; i> 30 ; i--)
            {
                UILabel *label = (UILabel*)[self.view viewWithTag:i];
                center1 = label.center;
                label.center = center;
                center = center1;
            }
            break;
        case 41:
            for(int i = 41 ; i< 43 ; i++)
            {
                UILabel *label = (UILabel*)[self.view viewWithTag:i];
                center1 = label.center;
                label.center = center;
                center = center1;
            }
            break;
        case 42:
            for(int i = 42 ; i> 40 ; i--)
            {
                UILabel *label = (UILabel*)[self.view viewWithTag:i];
                center1 = label.center;
                label.center = center;
                center = center1;
            }
            break;
        default:
            break;
    }
    [UIView commitAnimations];
}

@end
