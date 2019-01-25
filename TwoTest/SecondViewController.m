//
//  SecondViewController.m
//  TwoTest
//
//  Created by ren on 2016/12/29.
//  Copyright © 2016年 ren. All rights reserved.
//

#import "SecondViewController.h"
#import "ThreeViewController.h"
#import "ShareExple.h"

@interface SecondViewController ()
{
    UIImage *colorRed;
    UIImage *colorGreen;
    NSArray *tagArr;
    NSInteger afterTag;//记录最后被设置成绿色的按钮tag;
    NSInteger level;
}

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    level = 0;
    colorRed  = [UIImage imageNamed:@"red.jpg"];
    colorGreen = [UIImage imageNamed:@"green.jpg"];
    tagArr = @[@"11",@"12",@"13",@"14",@"15",@"21",@"22",@"23",@"24",@"25",@"31",@"32",@"33",@"34",@"35",@"41",@"42",@"43",@"44",@"45",@"51",@"52",@"53",@"54",@"55"];
    
    //[self setlabel];
    ShareExple *share = [ShareExple sharedInstance];
}


-(void)setlabel
{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(103, 114, 155, 199)];
    label.backgroundColor = [UIColor redColor];
    [self.view addSubview:label];
    
    //旋转动画
    CABasicAnimation* rotationAnimation =
    [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat:(2 * M_PI) * 3];
    rotationAnimation.duration = 3.0f;
    [label.layer addAnimation:rotationAnimation forKey:@"animationGroup"];
}



- (IBAction)buttonPressed:(UIButton *)sender
{
    if(sender.tag == 10000)
    {
        ThreeViewController *threeVC = [self.storyboard instantiateViewControllerWithIdentifier:@"ThreeViewController"];
        [self presentViewController:threeVC animated:YES completion:nil];
    }
    else if(sender.tag == 100 || sender.tag == 200)
    {
        [self setLevel:sender.tag];
    }
    else if (sender.tag == 1000)
    {
        [self setLevel:level];
    }
    else if([self judge])//说明是第一次点击
    {
        [self setAllButton];//把全部按钮设置为不可触发
        [self setButton:sender.tag];//指定当前按钮，把该按钮设置成不可触发，把该按钮上上左右的按钮中非绿色和红色的设置成可触发
    }
    else if([self backColor:sender.tag] == 1)
        return;
    else
    {
        [self setAllButton];//把全部按钮设置为不可触发
        [self setButtonBackGround:sender.tag];
        [self setButton:afterTag];
    }
}


//返回指定按钮的背景类型，0是空白，1是绿色，2是红色
-(NSInteger)backColor:(NSInteger)tag
{
    UIButton *button = (UIButton*)[self.view viewWithTag:tag];
    UIImage *image = [button backgroundImageForState:UIControlStateNormal];
    if(image == nil)
        return 0;
    else if ([image isEqual:colorRed])
        return 2;
    else
        return 1;
}

//判断全部按钮是否没有绿色
-(BOOL)judge
{
    for(int i = 10; i < 60; i+=10)
    {
        for(int j = 1; j < 6; j++)
        {
            UIButton *button = (UIButton*)[self.view viewWithTag:i+j];
            UIImage *image = [button backgroundImageForState:UIControlStateNormal];
            if([image isEqual:colorGreen])
                return NO;
        }
    }
    return YES;
}


//把全部按钮设置成不可触发
-(void)setAllButton
{
    for(int i = 10; i < 60; i+=10)
    {
        for(int j = 1; j < 6; j++)
        {
            UIButton *button = (UIButton*)[self.view viewWithTag:i+j];
            button.enabled = NO;
        }
    }
}

//指定一个按钮，把该按钮设置成不可触发，背景设置成绿色，把该按钮上上左右的按钮中非绿色和红色的设置成可触发
-(void)setButton:(NSInteger)tag
{
    UIButton *button = (UIButton*)[self.view viewWithTag:tag];
    button.enabled = YES;
    if([self backColor:tag] == 0)
        [button setBackgroundImage:colorGreen forState:UIControlStateNormal];
    afterTag = tag;
    NSString *tagbefore = [NSString stringWithFormat:@"%ld",tag-1];
    NSString *tagafter = [NSString stringWithFormat:@"%ld",tag+1];
    NSString *tagup = [NSString stringWithFormat:@"%ld",tag-10];
    NSString *tagdown = [NSString stringWithFormat:@"%ld",tag+10];
    if([tagArr containsObject:tagafter])
        [self setButtonObject:tag+1];
    if([tagArr containsObject:tagbefore])
        [self setButtonObject:tag-1];
    if([tagArr containsObject:tagup])
        [self setButtonObject:tag-10];
    if([tagArr containsObject:tagdown])
        [self setButtonObject:tag+10];
}

//把指定的按钮且背景是空的设置成可触发的
-(void)setButtonObject:(NSInteger)tag
{
    UIButton *button = (UIButton*)[self.view viewWithTag:tag];
    if([self backColor:tag] == 0)
        button.enabled = YES;
    else
        button.enabled = NO;
}
//先判断最后设置成绿色的按钮的tag,然后作比较
-(void)setButtonBackGround:(NSInteger)tag
{
    [self setButtonObject:afterTag];
    if(tag == afterTag-1)//说明是向左设置绿色
    {
        do {
            UIButton *button = (UIButton*)[self.view viewWithTag:tag];
            [button setBackgroundImage:colorGreen forState:UIControlStateNormal];
            afterTag = tag;
            tag--;
        } while ([tagArr containsObject:[NSString stringWithFormat:@"%ld",tag]] && [self backColor:tag] == 0);
    }
    else if(tag == afterTag+1)//说明是向右设置绿色
    {
        do {
            UIButton *button = (UIButton*)[self.view viewWithTag:tag];
            [button setBackgroundImage:colorGreen forState:UIControlStateNormal];
            afterTag = tag;
            tag++;
        } while ([tagArr containsObject:[NSString stringWithFormat:@"%ld",tag]] && [self backColor:tag] == 0);
    }
    else if(tag == afterTag+10)//说明是向下设置绿色
    {
        do {
            UIButton *button = (UIButton*)[self.view viewWithTag:tag];
            [button setBackgroundImage:colorGreen forState:UIControlStateNormal];
            afterTag = tag;
            tag+=10;
        } while ([tagArr containsObject:[NSString stringWithFormat:@"%ld",tag]] && [self backColor:tag] == 0);
    }
    else//说明是向上设置绿色
    {
        do {
            UIButton *button = (UIButton*)[self.view viewWithTag:tag];
            [button setBackgroundImage:colorGreen forState:UIControlStateNormal];
            afterTag = tag;
            tag-=10;
        } while ([tagArr containsObject:[NSString stringWithFormat:@"%ld",tag]] && [self backColor:tag] == 0);
    }
}

-(void)setLevel:(NSInteger)tag
{
    UIButton *button = (UIButton*)[self.view viewWithTag:tag];
    if(tag == 100)
    {
        button.tag +=100;
        level = 100;
        for(int i = 10; i < 60; i+=10)
        {
            for(int j = 1; j < 6; j++)
            {
                UIButton *button = (UIButton*)[self.view viewWithTag:i+j];
                if(button.tag == 13 || button.tag == 14 || button.tag == 15 || button.tag == 51 || button.tag == 52)
                {
                    [button setBackgroundImage:colorRed forState:UIControlStateNormal];
                    button.enabled = NO;
                }
                else
                {
                    [button setBackgroundImage:nil forState:UIControlStateNormal];
                    button.enabled = YES;
                }

            }
        }
    }
    else if(tag == 200)
    {
        button.tag +=100;
        level = 200;
        for(int i = 10; i < 60; i+=10)
        {
            for(int j = 1; j < 6; j++)
            {
                UIButton *button = (UIButton*)[self.view viewWithTag:i+j];
                if(button.tag == 15 || button.tag == 34 || button.tag == 41 || button.tag == 53)
                {
                    [button setBackgroundImage:colorRed forState:UIControlStateNormal];
                    button.enabled = NO;
                }
                else
                {
                    [button setBackgroundImage:nil forState:UIControlStateNormal];
                    button.enabled = YES;
                }
                
            }
        }
    }
    else
    {
        level = 0;
        for(int i = 10; i < 60; i+=10)
        {
            for(int j = 1; j < 6; j++)
            {
                UIButton *button = (UIButton*)[self.view viewWithTag:i+j];
                [button setBackgroundImage:nil forState:UIControlStateNormal];
                button.enabled = YES;
                
            }
        }
    }
}


@end
