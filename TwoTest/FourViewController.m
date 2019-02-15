//
//  FourViewController.m
//  TwoTest
//
//  Created by ren on 2017/1/3.
//  Copyright © 2017年 ren. All rights reserved.
//

#import "FourViewController.h"
#import "NewButton.h"
#import "FiveViewController.h"
#import "EighteenViewController.h"

@interface FourViewController ()
{
    NSInteger buttonTag;//记录点击的button；
}

@end

@implementation FourViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    buttonTag = 5;
    [self setMainView];
}

-(void)setMainView
{
    for(NSInteger i = 0 ; i < 20; i+=10)
    {
        for(NSInteger j = 1 ; j < 6 ; j++)
        {
            NewButton *button = [[NewButton alloc]init];
            if(i == 0)
                button.frame = CGRectMake((self.view.bounds.size.width - 50*5)/2.0 + (j -1 )*49, (self.view.bounds.size.height - 50*2)/2.0, 50, 50);
            else
                button.frame = CGRectMake((self.view.bounds.size.width - 50*5)/2.0 + (j -1 )*49, (self.view.bounds.size.height - 50*2)/2.0 + 49, 50, 50);
            [self.view addSubview:button];
            [button addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
            if(j+i == 4)
                button.mark = 4;
            else if(j+i == 12)
                button.mark = 1;
            else if(j+i == 13)
                button.mark = 3;
            else if(j+i == 15)
                button.mark = 2;
            else if (j+i == 14)
                button.mark = 5;
            else
                button.mark = 0;
            button.tag = button.mark;
            [button setNeedsDisplay];
        }
    }
}
- (IBAction)buttonp:(UIButton *)sender {
    if(sender.tag == 10010)
    {
        EighteenViewController *fourVC = [[EighteenViewController alloc]init];//[self.storyboard instantiateViewControllerWithIdentifier:@"FiveViewController"];
        [self presentViewController:fourVC animated:YES completion:nil];
    }
    [self.view.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [self setMainView];
    buttonTag = 5;
    
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(20, 30, 50, 60)];
//    button.center = CGPointMake(self.view.center.x, self.view.center.y + 200);
    [self.view addSubview:button];
    button.backgroundColor = [UIColor greenColor];
    [button setTitle:@"复原" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonp:) forControlEvents:UIControlEventTouchUpInside];
}
//0为空白，1为大红，2为小红，3为灰色左，4为灰色下，5为圆点  20为大红小红，11为圆与小红，12为圆与灰下，13为圆与灰左，14为圆与小红与灰下，15为圆与小红与灰左，16为圆与大红
-(void)buttonPressed:(NewButton*)sender
{
    if(sender.mark == 5 || sender.mark == 16 || sender.mark == 12 || sender.mark == 13 || sender.mark == 15 || sender.mark == 11 || sender.mark == 14)
    {
        buttonTag = sender.mark;
        return;
    }
    else
    {
        if([self judge:sender])
        {
            [self setButton:sender];
        }
    }

}

-(BOOL)judge:(NewButton*)sender
{
    NewButton *button = [self.view viewWithTag:buttonTag];
    if(sender.mark == 4)//如果是灰下，则判断它下面的button是不是圆点戓圆点与小红或圆点与大红
    {
        if(buttonTag == 5 || buttonTag == 11 || buttonTag == 16)
        {
            if(button.center.x == sender.center.x)
                return YES;
            else
                return NO;
        }
        else
            return NO;
    }
    else if(sender.mark == 0)//如果点击的是空白的，则判断上下左右是否是圆点或圆点与灰左，圆点与灰下，圆点与小红，圆点与小红与灰左，圆点与大红
    {
        if(buttonTag == 5 || buttonTag == 13 || buttonTag == 12 || buttonTag == 15 || buttonTag == 11 || buttonTag == 16)
        {
            if(button.center.x == sender.center.x || (button.center.y == sender.center.y && fabs(button.center.x - sender.center.x) == 49))
                return YES;
            else
                return NO;
        }
        else
            return NO;
    }
    else if(sender.mark == 2)//点击的是小红，则判断小红上面的是不是圆
    {
        if(buttonTag == 5 || buttonTag == 12)
        {
            if(button.center.x == sender.center.x)
                return YES;
            else
                return NO;
        }
        else
            return NO;
    }
    else if(sender.mark == 3)//点击的是灰左，则判断灰左左面的是不是圆
    {
        if(buttonTag == 5 || buttonTag == 11)
        {
            if(button.center.y == sender.center.y && sender.center.x - button.center.x == 49)
                return YES;
            else
                return NO;
        }
        else
            return NO;
    }
    else if(sender.mark == 1)//点击的是大红，则判断大红上面的是不是圆
    {
        if(buttonTag == 5 || buttonTag == 12 || buttonTag == 11)
        {
            if(button.center.x == sender.center.x)
                return YES;
            else
                return NO;
        }
        else
            return NO;
    }
    else
        return NO;
}


//合并
-(void)setButton:(NewButton*)sender
{
    NewButton *button = [self.view viewWithTag:buttonTag];
    if(sender.mark == 4)//点击的是灰色下
    {
        sender.mark = 12;
        sender.tag = 12;
        [sender setNeedsDisplay];
        if(buttonTag == 5)
        {
            button.mark = 0;
            button.tag = 0;
            [button setNeedsDisplay];
        }
        else if (buttonTag == 11)
        {
            button.mark = 2;
            button.tag = 2;
            [button setNeedsDisplay];
        }
        else
        {
            button.mark = 1;
            button.tag = 1;
            [button setNeedsDisplay];
        }
        buttonTag = 12;
    }
    else if (sender.mark == 0)//点击的是空白的
    {
        if(buttonTag == 5)//前一个是圆点，只需要交换位置即可
        {
            CGPoint point = button.center;
            button.center = sender.center;
            sender.center = point;
        }
        else if (buttonTag == 11)//前一个是小红与圆，则判断位置关系
        {
            if(button.center.y - sender.center.y == 49)//前一个是在点击的下面，则要分离
            {
                buttonTag = 5;
                sender.tag = 5;
                sender.mark = 5;
                [sender setNeedsDisplay];
                
                button.mark = 2;
                button.tag = 2;
                [button setNeedsDisplay];
            }
            else
            {
                CGPoint point = button.center;
                button.center = sender.center;
                sender.center = point;
            }
        }
        else if (buttonTag == 12)//前一个是圆与灰下， 判断位置，如果是上下关系则分离，否则交换
        {
            if(button.center.x == sender.center.x)
            {
                buttonTag = 5;
                sender.tag = 5;
                sender.mark = 5;
                [sender setNeedsDisplay];
                
                button.mark = 4;
                button.tag = 4;
                [button setNeedsDisplay];
            }
            else
            {
                CGPoint point = button.center;
                button.center = sender.center;
                sender.center = point;
            }
        }
        else if (buttonTag == 13)//前一个是灰左与圆，判断位置，如果点击的是左，则分离，其它交换
        {
            if(button.center.x - sender.center.x == 49)
            {
                buttonTag = 5;
                sender.tag = 5;
                sender.mark = 5;
                [sender setNeedsDisplay];
                
                button.mark = 3;
                button.tag = 3;
                [button setNeedsDisplay];
            }
            else
            {
                CGPoint point = button.center;
                button.center = sender.center;
                sender.center = point;
            }
        }
        else if (buttonTag == 15)//前一个是灰左与圆与小红，判断位置，如果点击的是左，则分离，其它交换
        {
            if(button.center.x - sender.center.x == 49)
            {
                buttonTag = 11;
                sender.tag = 11;
                sender.mark = 11;
                [sender setNeedsDisplay];
                
                button.mark = 3;
                button.tag = 3;
                [button setNeedsDisplay];
            }
            else
            {
                CGPoint point = button.center;
                button.center = sender.center;
                sender.center = point;
            }
        }
        else if (buttonTag == 16)//前一个是圆与大红，判断位置，如果点击的是上，则分离，其它交换
        {
            if(button.center.y - sender.center.y == 49)
            {
                buttonTag = 5;
                sender.tag = 5;
                sender.mark = 5;
                [sender setNeedsDisplay];
                
                button.mark = 1;
                button.tag = 1;
                [button setNeedsDisplay];
            }
            else
            {
                CGPoint point = button.center;
                button.center = sender.center;
                sender.center = point;
            }
        }
        
    }
    else if (sender.mark == 2)//点击的是小红
    {
        if(buttonTag == 5)
        {
            button.mark = 0;
            button.tag = 0;
            [button setNeedsDisplay];
            
            sender.mark = 11;
            sender.tag = 11;
            [sender setNeedsDisplay];
            buttonTag = 11;
        }
        else
        {
            button.mark = 4;
            button.tag = 4;
            [button setNeedsDisplay];
            
            sender.mark = 11;
            sender.tag = 11;
            [sender setNeedsDisplay];
            buttonTag = 11;
        }
    }
    else if (sender.mark == 3)//点击的是灰左
    {
        if(buttonTag == 5)
        {
            button.mark = 0;
            button.tag = 0;
            [button setNeedsDisplay];
            
            sender.mark = 13;
            sender.tag = 13;
            [sender setNeedsDisplay];
            buttonTag = 13;
        }
        else
        {
            button.mark = 0;
            button.tag = 0;
            [button setNeedsDisplay];
            
            sender.mark = 15;
            sender.tag = 15;
            [sender setNeedsDisplay];
            buttonTag = 15;
        }
    }
    else if (sender.mark == 1)//点击的是大红
    {
       if(buttonTag == 5)
       {
           button.mark = 0;
           button.tag = 0;
           [button setNeedsDisplay];
           
           sender.mark = 16;
           sender.tag = 16;
           [sender setNeedsDisplay];
           buttonTag = 16;
       }
        else if (buttonTag == 12)
        {
            button.mark = 4;
            button.tag = 4;
            [button setNeedsDisplay];
            
            sender.mark = 16;
            sender.tag = 16;
            [sender setNeedsDisplay];
            buttonTag = 16;
        }
        else
        {
            button.mark = 0;
            button.tag = 0;
            [button setNeedsDisplay];
            
            sender.mark = 20;
            sender.tag = 20;
            [sender setNeedsDisplay];
            buttonTag = 20;
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提醒" message:@"你赢了" delegate:self cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
            [alert show];
        }
    }
}

@end














