//
//  SixteenViewController.m
//  TwoTest
//
//  Created by ren on 2018/3/23.
//  Copyright © 2018年 ren. All rights reserved.
//

#import "SixteenViewController.h"

@interface SixteenViewController ()<UIScrollViewDelegate>
{
    UIView *viewfirst;
    UIView *viewsecond;
    UIView *viewthree;
    UIScrollView *scrollView;
    UITableView *tableview;
}

@end

@implementation SixteenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setMainView];
}

-(void)setMainView
{
    UIView *testView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 120)];
    testView.backgroundColor = [UIColor colorWithRed:22/255.0 green:159/255.0 blue:255/255.0 alpha:1.0];
    [self.view addSubview:testView];
    viewfirst = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 50)];
    viewfirst.backgroundColor = [UIColor clearColor];
    [self.view addSubview:viewfirst];
    
    UISearchBar *search = [[UISearchBar alloc]initWithFrame:CGRectMake(10, 23, SCREEN_WIDTH-10-SCREEN_WIDTH/4.0, 25)];
    search.searchBarStyle = 2;
    search.placeholder = @"记账本";
    UITextField *textfield = [search valueForKey:@"_searchField"];
    textfield.font = [UIFont systemFontOfSize:14];
    textfield.textColor = [UIColor whiteColor];
    [textfield setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
    UIImage *image = [UIImage imageNamed:@"search"];
    UIImageView *imageview = [[UIImageView alloc]initWithImage:image];
    textfield.leftView = imageview;
    [viewfirst addSubview:search];
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-40, 23, 30, 30)];
    imageView.image = [UIImage imageNamed:@"50"];
    [viewfirst addSubview:imageView];
    
    

    
    
    
    
    
    
    viewsecond = [[UIView alloc]initWithFrame:CGRectMake(0, 50, SCREEN_WIDTH, 70)];
    viewsecond.backgroundColor = [UIColor clearColor];
    [self.view addSubview:viewsecond];
    
    for(int i = 10 ; i <= 40 ; i += 10)
    {
        UIImageView *imageView1 = [[UIImageView alloc]initWithFrame:CGRectMake((SCREEN_WIDTH-4*40)/5.0*(i/10)+ (i/10-1)*40,8, 40, 40)];
        imageView1.image = [UIImage imageNamed:[NSString stringWithFormat:@"%d",i]];
        [viewsecond addSubview:imageView1];
        
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 50, 20)];
        label.center = CGPointMake(imageView1.center.x, imageView1.center.y+30);
        label.text =[NSString stringWithFormat:@"%d",i];
        label.textColor = [UIColor whiteColor];
        label.textAlignment = NSTextAlignmentCenter;
        [viewsecond addSubview:label];
    }
    
    scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 70, SCREEN_WIDTH, SCREEN_HEIGHT-50)];
    scrollView.delegate = self;
    scrollView.bounces = NO;
    scrollView.contentSize = CGSizeMake(0, (SCREEN_HEIGHT-50)*2);
    [self.view addSubview:scrollView];
    scrollView.backgroundColor = [UIColor clearColor];
    
    UIView *view1 = [[UIView alloc]initWithFrame:CGRectMake(0, 50, SCREEN_WIDTH, 200)];
    view1.backgroundColor = [UIColor greenColor];
    [scrollView addSubview:view1];
    
    
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat y = scrollView.contentOffset.y;
    if(y<50)
    {
        viewfirst.alpha = (50-y)/70.0;
        viewsecond.alpha = (50-y)/40.0;
        
        CGRect rect = viewsecond.frame;
        y -= y/2.0;
        rect.origin.y = 50 - y;
        viewsecond.frame = rect;
        
    }
    else
    {
        viewfirst.alpha = 1;
        viewsecond.alpha = 0;
    }
    
    
    NSLog(@"%@",NSStringFromCGPoint(scrollView.contentOffset));
}



-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:scrollView];
    NSLog(@"%@",NSStringFromCGPoint(point));
}

@end
