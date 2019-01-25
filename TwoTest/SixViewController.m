//
//  SixViewController.m
//  TwoTest
//
//  Created by ren on 2017/2/22.
//  Copyright © 2017年 ren. All rights reserved.
//

#import "SixViewController.h"

@interface SixViewController ()

@end

@implementation SixViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *firstButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 240, 240)];
    firstButton.center = self.view.center;
    firstButton.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:firstButton];
    CAShapeLayer *layer = [[CAShapeLayer alloc]init];
    layer.path = [UIBezierPath bezierPathWithRoundedRect:firstButton.bounds cornerRadius:120].CGPath;
    layer.lineDashPattern = @[@10,@10];
    layer.strokeColor = [UIColor blackColor].CGColor;
    layer.fillColor = [UIColor clearColor].CGColor;
    layer.lineWidth = 2;
    [firstButton.layer addSublayer:layer];
    
    float radius = 2*M_PI / 40.0;
    float angle;
    for(int i = 1 ; i <= 40 ; i++)
    {
        NSInteger mark;
        angle = radius*i;
        if(0< angle && angle <= M_PI_2)
            mark = 1;
        else if (angle > M_PI_2 && angle <= M_PI)
            mark = 2;
        else if (angle > M_PI && angle <= M_PI * 3.0 / 2.0)
            mark = 3;
        else
            mark = 4;
        UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 10, 10)];
        button.backgroundColor = [UIColor blueColor];
        button.layer.masksToBounds = YES;
        button.layer.cornerRadius = 5;
        [firstButton addSubview:button];
        switch (mark) {
            case 1:
                button.center = CGPointMake(120 + cosf(angle) * 120, 120 - sinf(angle) * 120);
                break;
            case 2:
                angle = M_PI - angle;
                button.center = CGPointMake(120 - cosf(angle) * 120, 120 - sinf(angle) * 120);
                break;
            case 3:
                angle = angle - M_PI;
                button.center = CGPointMake(120 - cosf(angle) * 120, 120 + sinf(angle) * 120);
                break;
            case 4:
                angle = 2*M_PI - angle;
                button.center = CGPointMake(120 + cosf(angle) * 120, 120 + sinf(angle) * 120);
                break;
            default:
                break;
        }
    }
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
