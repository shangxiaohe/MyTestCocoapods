//
//  FourteenViewController.m
//  TwoTest
//
//  Created by ren on 2018/2/1.
//  Copyright © 2018年 ren. All rights reserved.
//

#import "FourteenViewController.h"
#import "FourteenTableViewCell.h"
#import "FifteenViewController.h"
#import "WebViewController.h"
#import "SixteenViewController.h"
#import "Singleton.h"
#import "FiveViewController.h"

@interface FourteenViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UIButton *button;
}

@end

@implementation FourteenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //获取文件路径
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"area1" ofType:@"json"];
    
    //根据文件路径读取数据
    
    NSString *parseJason = [[NSString alloc] initWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];

    //根据文件路径读取数据
    NSData *jdata = [[NSData alloc]initWithContentsOfFile:filePath];
    
    NSArray * array = [NSJSONSerialization JSONObjectWithData:jdata options:kNilOptions error:nil];
    NSLog(@"----:%@",array);
    
    
//    button = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
//    button.backgroundColor = [UIColor greenColor];
//    [self.tableview addSubview:button];
//    
//    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(aaa)];
//    [_tableview addGestureRecognizer:tap];
    
    
    Singleton *single = [Singleton shareSingleton];
    NSLog(@"single 2: %@ ----",single.name);

    
}


-(void)aaa
{
    UIView *firstView = [[UIView alloc ]initWithFrame:CGRectMake(10, 100, 200, 20)];
    firstView.layer.borderWidth = 1;
    firstView.layer.borderColor = [UIColor grayColor].CGColor;
    firstView.layer.cornerRadius = 10;
    firstView.backgroundColor = [UIColor darkGrayColor];
    [_tableview addSubview:firstView];
    
    UIView *secondView = [[UIView alloc ]initWithFrame:CGRectMake(0, 1, 100, 18)];
    secondView.layer.borderWidth = 0;
    secondView.layer.cornerRadius = 10;
    secondView.backgroundColor = [UIColor blueColor];
    //渐变
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.colors = @[(__bridge id)[UIColor greenColor].CGColor,(__bridge id)[UIColor blueColor].CGColor];
//    gradientLayer.locations = @[@0,@0,@0];
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(1.0, 0);
    [secondView.layer addSublayer:gradientLayer];
    CGRect rect = secondView.bounds;
    rect.size.width -= 10;
    gradientLayer.frame = rect;
    
    [firstView addSubview:secondView];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 300;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellId = @"FourteenTableViewCell";
    FourteenTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if(!cell)
        cell = [[FourteenTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    cell.labelone.text = [NSString stringWithFormat:@"%ld",indexPath.row];
    cell.labeltwo.text = [NSString stringWithFormat:@"%ld",indexPath.row];
    cell.labelthree.text = [NSString stringWithFormat:@"%ld",indexPath.row];
    
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
//    [[NSNotificationCenter defaultCenter] postNotification:[NSNotification notificationWithName:@"viewcontroller" object:nil userInfo:nil]];
//
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(back) name:@"viewcontroller1" object:nil];
    
//    WebViewController *fiftennVC = [[WebViewController alloc]init];
//    [self.navigationController pushViewController:fiftennVC animated:YES];
//    [self presentViewController:fiftennVC animated:YES completion:nil];
    
    UIStoryboard *board = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    FiveViewController *viewVC = [board instantiateViewControllerWithIdentifier:@"FiveViewController"];
    [self presentViewController:viewVC animated:YES completion:nil];
}


-(void)back
{
    NSLog(@"222222");
}

@end
