//
//  ElevenViewController.m
//  TwoTest
//
//  Created by ren on 2017/9/15.
//  Copyright © 2017年 ren. All rights reserved.
//

#import "ElevenViewController.h"

@interface ElevenViewController ()<UIScrollViewDelegate>
{
    UIScrollView * scrollview;
}

@end

@implementation ElevenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenColor];
    scrollview = [[UIScrollView alloc]initWithFrame:CGRectMake(10, 10, self.view.bounds.size.width-20, self.view.bounds.size.height-20)];
    [self.view addSubview:scrollview];
    scrollview.contentSize = CGSizeMake(self.view.bounds.size.width*3, 0);
    scrollview.pagingEnabled = YES;
//    scrollview.minimumZoomScale = 0.5;
//    scrollview.maximumZoomScale = 2;
    scrollview.backgroundColor = [UIColor lightGrayColor];
    
    
    UIScrollView *scrollview1 = [[UIScrollView alloc]initWithFrame:CGRectMake(10, 10, self.view.bounds.size.width-40, self.view.bounds.size.height-40)];
    scrollview1.backgroundColor = [UIColor yellowColor];
    scrollview1.minimumZoomScale = 0.5;
    scrollview1.maximumZoomScale = 2;
    [scrollview addSubview:scrollview1];
//    UIImageView *image1 = [[UIImageView alloc]initWithFrame:scrollview1.bounds];
//    image1.backgroundColor = [UIColor yellowColor];
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(20, 30, 100, 50)];
    label.text = @"三十晚上滑雪大冒险邪地如有兴趣剧哩";
    [scrollview1 addSubview:label];
    
    UIScrollView *scrollview2 = [[UIScrollView alloc]initWithFrame:CGRectMake(self.view.bounds.size.width-10, 10, self.view.bounds.size.width-40, self.view.bounds.size.height-40)];
    scrollview2.backgroundColor = [UIColor yellowColor];
    scrollview2.minimumZoomScale = 0.5;
    scrollview2.maximumZoomScale = 2;
    [scrollview addSubview:scrollview2];
    UIImageView *image2 = [[UIImageView alloc]initWithFrame:scrollview2.bounds];
    image2.backgroundColor = [UIColor yellowColor];
    [scrollview2 addSubview:image2];
    
    UIScrollView *scrollview3 = [[UIScrollView alloc]initWithFrame:CGRectMake((self.view.bounds.size.width-20)*2+10, 10, self.view.bounds.size.width-40, self.view.bounds.size.height-40)];
    scrollview3.backgroundColor = [UIColor yellowColor];
    scrollview3.minimumZoomScale = 0.5;
    scrollview3.maximumZoomScale = 2;
    [scrollview addSubview:scrollview3];
    UIImageView *image3 = [[UIImageView alloc]initWithFrame:scrollview3.bounds];
    image3.backgroundColor = [UIColor yellowColor];
    [scrollview3 addSubview:image3];
    
//    UIImageView *image2 = [[UIImageView alloc]initWithFrame:CGRectMake(self.view.bounds.size.width-10, 10, self.view.bounds.size.width-40, self.view.bounds.size.height-40)];
//    image2.backgroundColor = [UIColor purpleColor];
//    [scrollview addSubview:image2];
//    
//    UIImageView *image3 = [[UIImageView alloc]initWithFrame:CGRectMake((self.view.bounds.size.width-20)*2+10, 10, self.view.bounds.size.width-40, self.view.bounds.size.height-40)];
//    image3.backgroundColor = [UIColor orangeColor];
//    [scrollview addSubview:image3];
    scrollview1.delegate = self;
    scrollview2.delegate = self;
    scrollview3.delegate = self;
    //image1.image = [UIImage imageNamed:@"1"];
    image2.image = [UIImage imageNamed:@"2"];
    image3.image = [UIImage imageNamed:@"3"];
}

//缩放过程中的图像
-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    for (UIView *view in scrollView.subviews) {
        return view;
    }
    return nil;
}

//缩放结束
-(void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(CGFloat)scale{
    NSLog(@"缩放的比例:%f",scale);
    //scrollview.contentSize = CGSizeMake(self.view.bounds.size.width*3, 0);
    NSLog(@"---%@---",NSStringFromCGSize(scrollview.contentSize));
    for (UIView *view in scrollView.subviews) {
        if([view isKindOfClass:[UIImageView class]])
        {
            
        }
    }
}

//缩放中
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSLog(@"缩放中");
}

@end
