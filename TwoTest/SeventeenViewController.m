//
//  SeventeenViewController.m
//  TwoTest
//
//  Created by ren on 2018/6/1.
//  Copyright © 2018年 ren. All rights reserved.
//

#import "SeventeenViewController.h"
#import "PieBarChartView.h"
#import "info.h"

@interface SeventeenViewController ()
{
    NSMutableArray *dataArr;
}

@end

@implementation SeventeenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    dataArr = [[NSMutableArray alloc]init];
    for(int i = 0 ; i < 5 ; i++)
    {
        info *data = [[info alloc]init];
        data.number = 20 + i*20;
        data.name = @"aaa";
        [dataArr addObject:data];
  
    }
        
    
    PieBarChartView *pieView = [[PieBarChartView alloc]initWithFrame:CGRectMake(0, 100, self.view.bounds.size.width, self.view.bounds.size.width)];
    [self.view addSubview:pieView];
    pieView.infos = dataArr;
    
    
    
}



@end
