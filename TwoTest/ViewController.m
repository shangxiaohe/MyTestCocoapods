//
//  ViewController.m
//  TwoTest
//
//  Created by ren on 2016/11/16.
//  Copyright © 2016年 ren. All rights reserved.
//



#import <Foundation/Foundation.h>
#import "ViewController.h"
//#import "view1.h"
//#import <AVKit/AVKit.h>
//#import <AVFoundation/AVFoundation.h>
//#import "Masonry.h"
#import "SecondViewController.h"
#import "ShareExple.h"


//#import "TZImagePickerController.h"
//#import <Photos/Photos.h>
//#import "TZImageManager.h"
//#import "TZVideoPlayerController.h"
//#import "TZPhotoPreviewController.h"
//#import "TZGifPhotoPreviewController.h"

#define imagWidth (self.view.bounds.size.width - 80)
#define imagHeight (imagWidth / (self.view.bounds.size.width / 260))

@interface ViewController ()
{
//    AVPlayerViewController *playerController;
//    UITableView *tableView;
//    UIImageView *imageView;
//    
//    UIScrollView *scrollView;
//    NSMutableArray *dataMarr;
//    
//    UIImageView *img1;
//    UIImageView *img2;
//    UIImageView *img3;
//    UIImageView *img4;
//    UIImageView *img5;
    
    NSData *updata;
    NSData *downdata;
    
    UIView *view1;
    BOOL _isSuccess;
    
}
@property (nonatomic, strong) CAEmitterLayer *caELayer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _isSuccess = NO;
//    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(50,50,50,50)];
//    [self.view addSubview:button];
//    
//    button.backgroundColor = [UIColor greenColor];
//    [button addTarget:self action:@selector(buttonPressed) forControlEvents:UIControlEventTouchUpInside];
//    ShareExple *share = [ShareExple sharedInstance];

/*
//    NSString *str = @"\u6309";
//    NSString *str1 = [NSString stringWithCString:[str UTF8String] encoding:NSUnicodeStringEncoding];
//    NSLog(@"str1:%@",str);
    
    // Do any additional setup after loading the view, typically from a nib.
//    UIWebView *web = [[UIWebView alloc]initWithFrame:self.view.frame];
//    [self.view addSubview:web];
//    
//    NSURL *url = [NSURL URLWithString:@"http://code4app.com/requirement/56168e5f594b9082438b4be2"];
//    NSURLRequest *request = [NSURLRequest requestWithURL:url];
//    [web loadRequest:request];
//    [self.view addSubview:web];
    
    
//    self.view.backgroundColor = [UIColor whiteColor];
//    
//    view1 *vi = [[view1 alloc]initWithFrame:self.view.frame];
//    self.view = vi;
//    vi.backgroundColor = [UIColor whiteColor];
//
//    
//    UIButton *bu = [[UIButton alloc]initWithFrame:CGRectMake(200, 200, 60, 60)];
//    [self.view addSubview:bu];
//    bu.backgroundColor = [UIColor greenColor];
    
//    playerController = [[AVPlayerViewController alloc]init];
//    playerController.player = [AVPlayer playerWithURL:[NSURL URLWithString:@"http://flv2.bn.netease.com/videolib3/1604/30/YAimZ0928/SD/YAimZ0928-mobile.mp4"]];
//    playerController.videoGravity = AVLayerVideoGravityResizeAspect;
//    playerController.showsPlaybackControls = true;
//    playerController.view.frame = CGRectMake(0, 0, self.view.bounds.size.width, 200);
//    [self addChildViewController:playerController];
//    [self.view addSubview:playerController.view];
//    
//
//    
//    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(100, 200, 100, 100)];
//    [self.view addSubview:button];
//    button.backgroundColor = [UIColor greenColor];
//    
//    [button addTarget:self action:@selector(buttonPlayer) forControlEvents:UIControlEventTouchUpInside];
//    
//    
//    //[playerController.player addObserver:self forKeyPath:@"currentTime.value" options:NSKeyValueObservingOptionNew context:nil];
//    
//    [playerController.player play];
//    
//    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(buttonPlayer) userInfo:nil repeats:YES];
//    tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 200, self.view.bounds.size.width, 400) style:UITableViewStylePlain];
//    [self.view addSubview:tableView];
//    tableView.delegate = self;
//    tableView.dataSource = self;
//    
////    tableView.tableHeaderView = [self headView];
//    tableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
//    
//    imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 200)];
//    imageView.contentMode = UIViewContentModeScaleToFill;
//    imageView.image = [UIImage imageNamed:@"logo.png"];
//    [self.view addSubview:imageView];
    
//    UILabel *label = [[UILabel alloc]init];
//    [self.view addSubview:label];
//    [label mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.view.mas_top);
//        make.left.equalTo(self.view.mas_left);
//        make.right.equalTo(self.view.mas_right);
//        
//    }];
//    label.backgroundColor = [UIColor redColor];
//    label.text = @"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa";
//    label.numberOfLines = 0;
//    [label layoutIfNeeded];
//    CGRect ba = label.frame;
//    CGRect aa = label.bounds;
//    float gg = CGRectGetMaxY(label.frame);
//    NSString *ff;
//    
//    UILabel *dd = [[UILabel alloc]init];
//    [self.view addSubview:dd];
//    [dd mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(label.mas_left);
//        make.right.equalTo(label.mas_right);
//        make.height.equalTo(@150);
//        
//    }];
//    dd.backgroundColor = [UIColor greenColor];
//    dd.text = @"vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv";
//    dd.numberOfLines = 0;
//    [dd layoutIfNeeded];
//    
//    CGRect ba1 = dd.frame;
//    CGRect aa1 = dd.bounds;
//    float gg1 = CGRectGetMaxY(dd.frame);

//    dataMarr = [NSMutableArray array];
//    for(int i = 1 ; i < 6 ; i++)
//    {
//        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"%d.jpg",i]];
//        [dataMarr addObject:image];
//    }
//    
//    scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 260)];
//    [self.view addSubview:scrollView];
//    scrollView.contentSize = CGSizeMake(self.view.bounds.size.width * 4, 0);
////    scrollView.pagingEnabled = YES;
//    scrollView.backgroundColor = [UIColor colorWithRed:58.0/255 green:136.0/255 blue:255.0/255 alpha:1];
//    scrollView.showsHorizontalScrollIndicator = NO;
//    scrollView.delegate = self;
//    img1 = [[UIImageView alloc]initWithImage:dataMarr[0]];
//    [scrollView addSubview:img1];
//    img1.center = CGPointMake(imagWidth / 2, 260 / 2);
//    CGRect frme1 = CGRectMake(0, 0, imagWidth*0.8, imagHeight*0.8);
//    img1.bounds = frme1;
//    
//    img2 = [[UIImageView alloc]initWithImage:dataMarr[1]];
//    [scrollView addSubview:img2];
//    img2.center = CGPointMake(imagWidth, 260 / 2);
//    CGRect frme2 = CGRectMake(0, 0, imagWidth*0.8, imagHeight*0.8);
//    img2.bounds = frme2;
//    
//    img3 = [[UIImageView alloc]initWithImage:dataMarr[2]];
//    [scrollView addSubview:img3];
//    img3.center = CGPointMake(imagWidth*3/2, 260 / 2);
//    CGRect frme3 = CGRectMake(0, 0, imagWidth, imagHeight);
//    img3.bounds = frme3;
//    
//    img4 = [[UIImageView alloc]initWithImage:dataMarr[3]];
//    img4.center = CGPointMake(imagWidth*4/2, 260 / 2);
//    CGRect frme4 = CGRectMake(0, 0, imagWidth*0.8,imagHeight*0.8);
//    img4.bounds = frme4;
//    
//    img5 = [[UIImageView alloc]initWithImage:dataMarr[4]];
//    [scrollView addSubview:img5];
//    [scrollView addSubview:img4];
//    img5.center = CGPointMake(imagWidth*5/2, 260 / 2);
//    CGRect frme5 = CGRectMake(0, 0, imagWidth*0.8,imagHeight*0.8);
//    img5.bounds = frme5;
//    
//    scrollView.contentOffset = CGPointMake(imagWidth-40, 0);
//    
//    [scrollView bringSubviewToFront:img3];
 */
    UIImage *imagadown = [UIImage imageNamed:@"down.jpg"];
    downdata = UIImageJPEGRepresentation(imagadown, 1);
    UIImage *imageup = [UIImage imageNamed:@"up.jpg"];
    updata = UIImageJPEGRepresentation(imageup, 1);
//    [self animation];
//    [self thread];

}
- (IBAction)buttonPressed:(UIButton *)sender
{
    if(sender.tag == 110)
    {
        if (_isSuccess) {
            SecondViewController *secondVC = [self.storyboard instantiateViewControllerWithIdentifier:@"SecondViewController"];
            [self presentViewController:secondVC animated:YES completion:nil];
            return;
        }
    }
    else if(sender.tag == 100) {
        [self.caELayer removeFromSuperlayer];
        [self restore];
        return;
    }
    else if([self judgeNull:sender.tag] == 0)//点击的是空的就不处理
        return;
    else if([self judgeNull:sender.tag] == 11)//点击的是向上的按钮
    {
        if(sender.tag == 1)//点击的是第一个向上的按钮
            return;
        else if(sender.tag == 2)//点击的是第二个向上的按钮
        {
            if([self judgeNull:1] == 0)//第一个按钮是空白的
            {
                [self setBackgrounImage:1 judge:11];//把第一个按钮设置成向上的
                [self setBackgrounImage:2 judge:0];//把第二个按钮设置成是空白的
            }
            else if ([self judgeNull:1] == 1)//第一个按钮是向下的
                return;
            else
                return;
        }
        else if (sender.tag == 3)//点击的是第三个向上的按钮
        {
            if([self judgeNull:2] == 0)//第二个按钮是空白的
            {
                [self setBackgrounImage:2 judge:11];//把第二个按钮设置成向上的
                [self setBackgrounImage:3 judge:0];//把第三个按钮设置成是空白的
            }
            else if([self judgeNull:2] == 1)//第二个按钮是向下的 判断第一个按钮是不是空白的即可
            {
                if([self judgeNull:1] == 0)//第一个按钮是空白
                {
                    [self setBackgrounImage:1 judge:11];//把第二个按钮设置成向上的
                    [self setBackgrounImage:3 judge:0];//把第三个按钮设置成是空白的
                }
                else
                    return;
            }
            else
            {
                if([self judgeNull:1] == 0)//第一个按钮是空白的
                {
                    [self setBackgrounImage:1 judge:11];//把第一个按钮设置成向上的
                    [self setBackgrounImage:3 judge:0];//把第三个按钮设置成是空白的
                }
                else
                    return;
            }
        }
        else if (sender.tag == 10)//点击的是第四个向上的按钮
        {
            if([self judgeNull:3] == 0)//第三个按钮是空白的
            {
                [self setBackgrounImage:3 judge:11];//把第三个按钮设置成向上的
                [self setBackgrounImage:10 judge:0];//把第四个按钮设置成是空白的
            }
            else if([self judgeNull:3] == 1)//第三个按钮是向下的 则判断第二个按钮是否是空白的即可
            {
                if([self judgeNull:2] == 0)//第2个按钮是空白的
                {
                    [self setBackgrounImage:2 judge:11];//把第一个按钮设置成向上的
                    [self setBackgrounImage:10 judge:0];//把第三个按钮设置成是空白的
                }
                else
                    return;
            }
            else//第三个按钮是向上的 则去判断第二个按钮
            {
                if([self judgeNull:2] == 0)//第二个按钮是空白的
                {
                    [self setBackgrounImage:2 judge:11];//把第二个按钮设置成向上的
                    [self setBackgrounImage:10 judge:0];//把第四个按钮设置成是空白的
                }
                else if([self judgeNull:2] == 1)//第二个按钮是向下的
                    return;
                else//第二个按钮是向上的 则去判断第一个宾馆
                {
                    if([self judgeNull:1] == 0)//第一个按钮是空白的
                    {
                        [self setBackgrounImage:1 judge:11];//把第一个按钮设置成向上的
                        [self setBackgrounImage:10 judge:0];//把第三个按钮设置成是空白的
                    }
                    else
                        return;
                }
            }
            
        }
        else if (sender.tag == 11)//点击的是第五个向上的按钮 只要判断上面二个按钮即可
        {
            if([self judgeNull:10] == 0)//第四个按钮是空白的
            {
                [self setBackgrounImage:10 judge:11];//把第四个按钮设置成向上的
                [self setBackgrounImage:11 judge:0];//把第五个按钮设置成是空白的
            }
            else if([self judgeNull:10] == 1)//第四个按钮是向下的
            {
                if([self judgeNull:3] == 0)//第3个按钮是空白的
                {
                    [self setBackgrounImage:3 judge:11];//把第一个按钮设置成向上的
                    [self setBackgrounImage:11 judge:0];//把第三个按钮设置成是空白的
                }
                else
                    return;
            }
            else//第四个按钮是向上的 则去判断第三个按钮
            {
                if([self judgeNull:3] == 0)//第三个按钮是空白的
                {
                    [self setBackgrounImage:3 judge:11];//把第三个按钮设置成向上的
                    [self setBackgrounImage:11 judge:0];//把第五个按钮设置成是空白的
                }
                else if([self judgeNull:3] == 1)//第三个按钮是向下的
                    return;
                else//第三个按钮是向上的，则只需要判断第二个按钮是不是空即可
                {
                    if([self judgeNull:2] == 0)//第一个按钮是空白的
                    {
                        [self setBackgrounImage:2 judge:11];//把第二个按钮设置成向上的
                        [self setBackgrounImage:11 judge:0];//把第五个按钮设置成是空白的
                    }
                    else
                        return;
                }
                
            }
        }
        else if (sender.tag == 12)//点击的是第六个向上的按钮 只要判断上面二个按钮即可
        {
            if([self judgeNull:11] == 0)//第五个按钮是空白的
            {
                [self setBackgrounImage:11 judge:11];//把第四个按钮设置成向上的
                [self setBackgrounImage:12 judge:0];//把第六个按钮设置成是空白的
            }
            else if([self judgeNull:11] == 1)//第五个按钮是向下的
            {
                if([self judgeNull:10] == 0)//第3个按钮是空白的
                {
                    [self setBackgrounImage:10 judge:11];//把第4个按钮设置成向上的
                    [self setBackgrounImage:12 judge:0];//把第6个按钮设置成是空白的
                }
                else
                    return;
            }
            else//第五个按钮是向上的 则去判断第四个按钮
            {
                if([self judgeNull:10] == 0)//第四个按钮是空白的
                {
                    [self setBackgrounImage:10 judge:11];//把第四个按钮设置成向上的
                    [self setBackgrounImage:12 judge:0];//把第六个按钮设置成是空白的
                }
                else if([self judgeNull:10] == 1)//第四个按钮是向下的
                    return;
                else//第四个按钮是向上的，则只需要判断第二个按钮是不是空即可
                {
                    if([self judgeNull:3] == 0)//第一个按钮是空白的
                    {
                        [self setBackgrounImage:3 judge:11];//把第三个按钮设置成向上的
                        [self setBackgrounImage:12 judge:0];//把第六个按钮设置成是空白的
                    }
                    else
                        return;
                }
                
            }
        }
        else//点击的是第七个向上的按钮 只要判断上面二个按钮即可
        {
            if([self judgeNull:12] == 0)//第六个按钮是空白的
            {
                [self setBackgrounImage:12 judge:11];//把第六个按钮设置成向上的
                [self setBackgrounImage:13 judge:0];//把第七个按钮设置成是空白的
            }
            else if([self judgeNull:12] == 1)//第六个按钮是向下的
            {
                if([self judgeNull:11] == 0)//第5个按钮是空白的
                {
                    [self setBackgrounImage:11 judge:11];//把第5个按钮设置成向上的
                    [self setBackgrounImage:13 judge:0];//把第7个按钮设置成是空白的
                }
                else
                    return;
            }
            else//第六个按钮是向上的 则去判断第五个按钮
            {
                if([self judgeNull:11] == 0)//第五个按钮是空白的
                {
                    [self setBackgrounImage:11 judge:11];//把第五个按钮设置成向上的
                    [self setBackgrounImage:13 judge:0];//把第七个按钮设置成是空白的
                }
                else if([self judgeNull:11] == 1)//第五个按钮是向下的
                    return;
                else//第五个按钮是向上的，则只需要判断第四个按钮是不是空即可
                {
                    if([self judgeNull:10] == 0)//第一个按钮是空白的
                    {
                        [self setBackgrounImage:10 judge:11];//把第四个按钮设置成向上的
                        [self setBackgrounImage:13 judge:0];//把第七个按钮设置成是空白的
                    }
                    else
                        return;
                }
                
            }
        }
    }
    else//点击的是向下的按钮
    {
        if(sender.tag == 1)//点击的第一个向下的按钮 判断下面二个按钮即可
        {
            if([self judgeNull:2] == 0)//第二个是空白的
            {
                [self setBackgrounImage:2 judge:1];//把第2个按钮设置成向下的
                [self setBackgrounImage:1 judge:0];//把第1个按钮设置成是空白的
            }
            else if([self judgeNull:2] == 1)//第二个是向下的 判断第三个
            {
                if([self judgeNull:3] == 0)//第三个按钮是空白的
                {
                    [self setBackgrounImage:3 judge:1];//把第3个按钮设置成向下的
                    [self setBackgrounImage:1 judge:0];//把第1个按钮设置成是空白的
                }
                else if([self judgeNull:3] == 1)//第三个按钮是向下的 则只需要判断第四个是不是空白的即可
                {
                    if([self judgeNull:10] == 0)//第四个按钮是空白的
                    {
                        [self setBackgrounImage:10 judge:1];//把第4个按钮设置成向下的
                        [self setBackgrounImage:1 judge:0];//把第1个按钮设置成是空白的
                    }
                    else
                        return;
                }
                else
                    return;
            }
            else//第二个是向上的 则只需要判断第三个是否是空白即可
            {
                if([self judgeNull:3] == 0)//第3个按钮是空白的
                {
                    [self setBackgrounImage:3 judge:1];//把第4个按钮设置成向下的
                    [self setBackgrounImage:1 judge:0];//把第1个按钮设置成是空白的
                }
                else
                    return;
            }
        }
        else if(sender.tag == 2)//点击的第二个向下的按钮 判断下面二个按钮即可
        {
            if([self judgeNull:3] == 0)//第三个是空白的
            {
                [self setBackgrounImage:3 judge:1];//把第3个按钮设置成向下的
                [self setBackgrounImage:2 judge:0];//把第2个按钮设置成是空白的
            }
            else if([self judgeNull:3] == 1)//第三个是向下的 判断第四个
            {
                if([self judgeNull:10] == 0)//第三个按钮是空白的
                {
                    [self setBackgrounImage:10 judge:1];//把第4个按钮设置成向下的
                    [self setBackgrounImage:2 judge:0];//把第2个按钮设置成是空白的
                }
                else if([self judgeNull:10] == 1)//第三个按钮是向下的 则只需要判断第五个是不是空白的即可
                {
                    if([self judgeNull:11] == 0)//第四个按钮是空白的
                    {
                        [self setBackgrounImage:11 judge:1];//把第5个按钮设置成向下的
                        [self setBackgrounImage:2 judge:0];//把第2个按钮设置成是空白的
                    }
                    else
                        return;
                }
                else
                    return;
            }
            else//第三个是向上的 则只需要判断第四个是否是空白即可
            {
                if([self judgeNull:10] == 0)//第3个按钮是空白的
                {
                    [self setBackgrounImage:10 judge:1];//把第4个按钮设置成向下的
                    [self setBackgrounImage:2 judge:0];//把第1个按钮设置成是空白的
                }
                else
                    return;
            }
        }
        else if(sender.tag == 3)//点击的第3个向下的按钮 判断下面二个按钮即可
        {
            if([self judgeNull:10] == 0)//第4个是空白的
            {
                [self setBackgrounImage:10 judge:1];//把第4个按钮设置成向下的
                [self setBackgrounImage:3 judge:0];//把第3个按钮设置成是空白的
            }
            else if([self judgeNull:10] == 1)//第4个是向下的 判断第5个
            {
                if([self judgeNull:11] == 0)//第5个按钮是空白的
                {
                    [self setBackgrounImage:11 judge:1];//把第5个按钮设置成向下的
                    [self setBackgrounImage:3 judge:0];//把第3个按钮设置成是空白的
                }
                else if([self judgeNull:11] == 1)//第5个按钮是向下的 则只需要判断第6个是不是空白的即可
                {
                    if([self judgeNull:12] == 0)//第四个按钮是空白的
                    {
                        [self setBackgrounImage:12 judge:1];//把第6个按钮设置成向下的
                        [self setBackgrounImage:3 judge:0];//把第3个按钮设置成是空白的
                    }
                    else
                        return;
                }
                else
                    return;
            }
            else//第四个是向上的 则只需要判断第5个是否是空白即可
            {
                if([self judgeNull:11] == 0)//第3个按钮是空白的
                {
                    [self setBackgrounImage:11 judge:1];//把第4个按钮设置成向下的
                    [self setBackgrounImage:3 judge:0];//把第1个按钮设置成是空白的
                }
                else
                    return;
            }
        }
        else if(sender.tag == 10)//点击的第4个向下的按钮 判断下面二个按钮即可
        {
            if([self judgeNull:11] == 0)//第5个是空白的
            {
                [self setBackgrounImage:11 judge:1];//把第4个按钮设置成向下的
                [self setBackgrounImage:10 judge:0];//把第3个按钮设置成是空白的
            }
            else if([self judgeNull:11] == 1)//第5个是向下的 判断第6个
            {
                if([self judgeNull:12] == 0)//第5个按钮是空白的
                {
                    [self setBackgrounImage:12 judge:1];//把第6个按钮设置成向下的
                    [self setBackgrounImage:10 judge:0];//把第4个按钮设置成是空白的
                }
                else if([self judgeNull:12] == 1)//第6个按钮是向下的 则只需要判断第7个是不是空白的即可
                {
                    if([self judgeNull:13] == 0)//第四个按钮是空白的
                    {
                        [self setBackgrounImage:13 judge:1];//把第7个按钮设置成向下的
                        [self setBackgrounImage:10 judge:0];//把第4个按钮设置成是空白的
                    }
                    else
                        return;
                }
                else
                    return;
            }
            else//第5个是向上的 则只需要判断第6个是否是空白即可
            {
                if([self judgeNull:12] == 0)//第3个按钮是空白的
                {
                    [self setBackgrounImage:12 judge:1];//把第6个按钮设置成向下的
                    [self setBackgrounImage:10 judge:0];//把第4个按钮设置成是空白的
                }
                else
                    return;
            }
        }
        else if(sender.tag == 11)//点击第五个向下的按钮
        {
            if([self judgeNull:12] == 0)//第5个是空白的
            {
                [self setBackgrounImage:12 judge:1];//把第6个按钮设置成向下的
                [self setBackgrounImage:11 judge:0];//把第5个按钮设置成是空白的
            }
            else if([self judgeNull:12] == 1)//第6个是向下的
            {
                if([self judgeNull:13] == 0)//第5个按钮是空白的
                {
                    [self setBackgrounImage:13 judge:1];//把第7个按钮设置成向下的
                    [self setBackgrounImage:11 judge:0];//把第5个按钮设置成是空白的
                }
                else
                    return;
            }
            else//第6个是向上的 则只需要判断第7个是否是空白即可
            {
                if([self judgeNull:13] == 0)//第3个按钮是空白的
                {
                    [self setBackgrounImage:13 judge:1];//把第7个按钮设置成向下的
                    [self setBackgrounImage:11 judge:0];//把第5个按钮设置成是空白的
                }
                else
                    return;
            }
        }
        else if (sender.tag == 12)
        {
            if([self judgeNull:13] == 0)//第7个是空白的
            {
                [self setBackgrounImage:13 judge:1];//把第7个按钮设置成向下的
                [self setBackgrounImage:12 judge:0];//把第6个按钮设置成是空白的
            }
            else
                return;
        }
        else
            return;
    }
    
    if (!_isSuccess) {
        if ([self successOrFail]) {
            _isSuccess = YES;
            [self initFireworks];
        }
    }
}

-(NSInteger)judgeNull:(NSInteger)tag
{
    UIButton *button = (UIButton*)[self.view viewWithTag:tag];
    UIImage *image = [button backgroundImageForState:UIControlStateNormal];
    NSData *data = UIImageJPEGRepresentation(image, 1);
    if(image == nil)
        return 0;
    else if([data isEqual:downdata])
        return 1;
    else
        return 11;
}

//判断有没有成功
- (BOOL)successOrFail {

    for (int i = 1 ; i < 4 ; i++) {
        UIButton *button = (UIButton*)[self.view viewWithTag:i];
        UIImage *image = [button backgroundImageForState:UIControlStateNormal];
        NSData *data = UIImageJPEGRepresentation(image, 1);
        if(image == nil) {
            return NO;
        } else if ([data isEqual:downdata]) {
            return NO;
        }
        
        UIButton *buttonxia = (UIButton*)[self.view viewWithTag:i + 10];
        UIImage *imagexia = [buttonxia backgroundImageForState:UIControlStateNormal];
        NSData *dataxia = UIImageJPEGRepresentation(imagexia, 1);
        if(imagexia == nil) {
            return NO;
        } else if ([dataxia isEqual:updata]) {
            return NO;
        }
        
    }
    
    return YES;
}

-(void)setBackgrounImage:(NSInteger)tag judge:(NSInteger)judge
{
    UIButton *button = (UIButton*)[self.view viewWithTag:tag];
    if(judge == 0)
        [button setBackgroundImage:nil forState:UIControlStateNormal];
    else if(judge == 1)
        [button setBackgroundImage:[UIImage imageNamed:@"down.jpg"] forState:UIControlStateNormal];
    else
        [button setBackgroundImage:[UIImage imageNamed:@"up.jpg"] forState:UIControlStateNormal];
}

-(void)restore
{
    UIImage *up = [UIImage imageNamed:@"up.jpg"];
    UIImage *down = [UIImage imageNamed:@"down.jpg"];
    [_btn1 setBackgroundImage:down forState:UIControlStateNormal];
    [_btn2 setBackgroundImage:down forState:UIControlStateNormal];
    [_btn3 setBackgroundImage:down forState:UIControlStateNormal];
    [_button setBackgroundImage:nil forState:UIControlStateNormal];
    [_btn11 setBackgroundImage:up forState:UIControlStateNormal];
    [_btn12 setBackgroundImage:up forState:UIControlStateNormal];
    [_btn13 setBackgroundImage:up forState:UIControlStateNormal];
}


//动画
-(void)animation
{
    view1 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, (CGRectGetMaxX(self.view.bounds)/4*3+10)*2, 348*2)];
    view1.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view1];
    [self.view sendSubviewToBack:view1];
    
    
    CAShapeLayer *graylayer = [CAShapeLayer layer];
    graylayer.strokeColor = [UIColor colorWithRed:229/255.0 green:229/255.0 blue:229/255.0 alpha:1].CGColor;
    graylayer.fillColor = [UIColor clearColor].CGColor;
    graylayer.lineWidth = 3;
    graylayer.path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(CGRectGetMaxX(self.view.bounds)/4,325,50,50) cornerRadius:25].CGPath;
    [self.view.layer addSublayer:graylayer];
    
    CAShapeLayer *graylayer2 = [CAShapeLayer layer];
    graylayer2.strokeColor = [UIColor colorWithRed:229/255.0 green:229/255.0 blue:229/255.0 alpha:1].CGColor;
    graylayer2.fillColor = [UIColor clearColor].CGColor;
    graylayer2.lineWidth = 3;
    graylayer2.path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(CGRectGetMaxX(self.view.bounds)/4+8,325 +8,50-16,50-16) cornerRadius:19].CGPath;
    [self.view.layer addSublayer:graylayer2];
    
    
    
    CAShapeLayer *redlayer = [CAShapeLayer layer];
    redlayer.strokeColor = [UIColor redColor].CGColor;
    redlayer.fillColor = [UIColor clearColor].CGColor;
    redlayer.lineWidth = 3;
    redlayer.path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(CGRectGetMaxX(self.view.bounds)/4,325,50,50) cornerRadius:25].CGPath;
    [self.view.layer addSublayer:redlayer];
    redlayer.lineDashPattern = @[@6,@3];
    
    CAShapeLayer *redlayer2 = [CAShapeLayer layer];
    redlayer2.strokeColor = [UIColor redColor].CGColor;
    redlayer2.fillColor = [UIColor clearColor].CGColor;
    redlayer2.lineWidth = 3;
    redlayer2.path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(CGRectGetMaxX(self.view.bounds)/4+8,325+8,50-16,50-16) cornerRadius:17].CGPath;
    [self.view.layer addSublayer:redlayer2];
    redlayer2.lineDashPattern = @[@6,@3];
    
    CABasicAnimation *startA = [CABasicAnimation animationWithKeyPath:@"strokeStart"];
    startA.fromValue = @(1.0);
    startA.toValue = @(-1.0);
    
    CABasicAnimation *endA = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    endA.fromValue = @(1.0);
    endA.toValue = @(0.0);
    
    CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
    animationGroup.animations = @[startA,endA];
    animationGroup.duration = 1.5;
    animationGroup.repeatCount = CGFLOAT_MAX;
    //animationGroup.fillMode = kCAFillModeBoth;
    animationGroup.removedOnCompletion = NO;
    [redlayer addAnimation:animationGroup forKey:nil];
    
    CABasicAnimation *startc = [CABasicAnimation animationWithKeyPath:@"strokeStart"];
    startc.fromValue = @(-1.0);
    startc.toValue = @(1.0);
    
    CABasicAnimation *endd = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    endd.fromValue = @(0.0);
    endd.toValue = @(1.0);
    
    CAAnimationGroup *animationGroup2 = [CAAnimationGroup animation];
    animationGroup2.animations = @[startc,endd];
    animationGroup2.duration = 5.5;
    animationGroup2.repeatCount = CGFLOAT_MAX;
    //animationGroup.fillMode = kCAFillModeBoth;
    animationGroup2.removedOnCompletion = NO;
    [redlayer2 addAnimation:animationGroup2 forKey:nil];
    [self drawCirc];
}


-(void)drawCirc
{
    
    
    
    
    
    
    
    
    UIBezierPath *_wavePathLow = [[UIBezierPath alloc] init];
    [_wavePathLow moveToPoint:CGPointMake(0.0, 50.0)];
    [_wavePathLow addLineToPoint:CGPointMake(0.0, 100.0)];
    [_wavePathLow addCurveToPoint:CGPointMake(100, 100.0) controlPoint1:CGPointMake(33.0, 80.0) controlPoint2:CGPointMake(66.0, 120.0)];
    [_wavePathLow addLineToPoint:CGPointMake(100, 50.0)];
    [_wavePathLow addLineToPoint:CGPointMake(0.0, 50.0)];
    [_wavePathLow closePath];
    
    UIBezierPath *_wavePathLow2 = [[UIBezierPath alloc] init];
    [_wavePathLow2 moveToPoint:CGPointMake(100.0, 50.0)];
    [_wavePathLow2 addLineToPoint:CGPointMake(100.0, 100.0)];
    [_wavePathLow2 addCurveToPoint:CGPointMake(200, 100.0) controlPoint1:CGPointMake(133.0, 80.0) controlPoint2:CGPointMake(166.0, 120.0)];
    [_wavePathLow2 addLineToPoint:CGPointMake(200, 50.0)];
    [_wavePathLow2 addLineToPoint:CGPointMake(100.0, 50.0)];
    [_wavePathLow2 closePath];
    
    UIBezierPath *_wavePathLow3 = [[UIBezierPath alloc] init];
    [_wavePathLow3 moveToPoint:CGPointMake(0.0, 110.0)];
    [_wavePathLow3 addLineToPoint:CGPointMake(0.0, 105.0)];
    [_wavePathLow3 addCurveToPoint:CGPointMake(100, 105.0) controlPoint1:CGPointMake(33.0, 85.0) controlPoint2:CGPointMake(66.0, 125.0)];
    [_wavePathLow3 addLineToPoint:CGPointMake(100, 110.0)];
    [_wavePathLow3 addCurveToPoint:CGPointMake(0.0, 110.0) controlPoint1:CGPointMake(66.0, 130.0) controlPoint2:CGPointMake(33.0, 90.0)];
    [_wavePathLow3 addLineToPoint:CGPointMake(0.0, 105.0)];
    [_wavePathLow3 closePath];
    
    UIBezierPath *_wavePathLow4 = [[UIBezierPath alloc] init];
    [_wavePathLow4 moveToPoint:CGPointMake(100.0, 110.0)];
    [_wavePathLow4 addLineToPoint:CGPointMake(100.0, 105.0)];
    [_wavePathLow4 addCurveToPoint:CGPointMake(200, 105.0) controlPoint1:CGPointMake(133.0, 85.0) controlPoint2:CGPointMake(166.0, 125.0)];
    [_wavePathLow4 addLineToPoint:CGPointMake(200, 110.0)];
    [_wavePathLow4 addCurveToPoint:CGPointMake(100, 110.0) controlPoint1:CGPointMake(166.0, 130.0) controlPoint2:CGPointMake(133.0, 90.0)];
    [_wavePathLow4 addLineToPoint:CGPointMake(100.0, 105.0)];
    [_wavePathLow4 closePath];
    
    UIBezierPath *_wavePathLow5 = [[UIBezierPath alloc] init];
    [_wavePathLow5 moveToPoint:CGPointMake(0.0, 120.0)];
    [_wavePathLow5 addLineToPoint:CGPointMake(0.0, 115.0)];
    [_wavePathLow5 addCurveToPoint:CGPointMake(100, 115.0) controlPoint1:CGPointMake(33.0, 95.0) controlPoint2:CGPointMake(66.0, 135.0)];
    [_wavePathLow5 addLineToPoint:CGPointMake(100, 120.0)];
    [_wavePathLow5 addCurveToPoint:CGPointMake(0.0, 120.0) controlPoint1:CGPointMake(66.0, 140.0) controlPoint2:CGPointMake(33.0, 100.0)];
    [_wavePathLow3 addLineToPoint:CGPointMake(0.0, 115.0)];
    [_wavePathLow3 closePath];
    
    
    UIBezierPath *_wavePathLow6 = [[UIBezierPath alloc] init];
    [_wavePathLow6 moveToPoint:CGPointMake(100.0, 120.0)];
    [_wavePathLow6 addLineToPoint:CGPointMake(100.0, 115.0)];
    [_wavePathLow6 addCurveToPoint:CGPointMake(200, 115.0) controlPoint1:CGPointMake(133.0, 95.0) controlPoint2:CGPointMake(166.0, 135.0)];
    [_wavePathLow6 addLineToPoint:CGPointMake(200, 120.0)];
    [_wavePathLow6 addCurveToPoint:CGPointMake(100, 120.0) controlPoint1:CGPointMake(166.0, 140.0) controlPoint2:CGPointMake(133.0, 100.0)];
    [_wavePathLow6 addLineToPoint:CGPointMake(100.0, 115.0)];
    [_wavePathLow6 closePath];
    
    
    
    CAShapeLayer *circLayer10 = [CAShapeLayer layer];
    circLayer10.strokeColor = [UIColor purpleColor].CGColor;
    circLayer10.fillColor = [UIColor purpleColor].CGColor;
    circLayer10.lineWidth = 2;
    circLayer10.path = _wavePathLow.CGPath;//[UIBezierPath bezierPathWithOvalInRect:CGRectMake(20,30,90,70)].CGPath;
    [self.view.layer addSublayer:circLayer10];
    
    CAShapeLayer *circLayer11 = [CAShapeLayer layer];
    circLayer11.strokeColor = [UIColor purpleColor].CGColor;
    circLayer11.fillColor = [UIColor purpleColor].CGColor;
    circLayer11.lineWidth = 2;
    circLayer11.path = _wavePathLow2.CGPath;//[UIBezierPath bezierPathWithOvalInRect:CGRectMake(20,30,90,70)].CGPath;
    [self.view.layer addSublayer:circLayer11];
    
    CAShapeLayer *circLayer12 = [CAShapeLayer layer];
    circLayer12.strokeColor = [UIColor purpleColor].CGColor;
    circLayer12.fillColor = [UIColor purpleColor].CGColor;
    circLayer12.lineWidth = 2;
    circLayer12.path = _wavePathLow3.CGPath;//[UIBezierPath bezierPathWithOvalInRect:CGRectMake(20,30,90,70)].CGPath;
    [self.view.layer addSublayer:circLayer12];
    
    CAShapeLayer *circLayer13 = [CAShapeLayer layer];
    circLayer13.strokeColor = [UIColor purpleColor].CGColor;
    circLayer13.fillColor = [UIColor purpleColor].CGColor;
    circLayer13.lineWidth = 2;
    circLayer13.path = _wavePathLow4.CGPath;//[UIBezierPath bezierPathWithOvalInRect:CGRectMake(20,30,90,70)].CGPath;
    [self.view.layer addSublayer:circLayer13];
    
    CAShapeLayer *circLayer14 = [CAShapeLayer layer];
    circLayer14.strokeColor = [UIColor purpleColor].CGColor;
    circLayer14.fillColor = [UIColor purpleColor].CGColor;
    circLayer14.lineWidth = 2;
    circLayer14.path = _wavePathLow5.CGPath;//[UIBezierPath bezierPathWithOvalInRect:CGRectMake(20,30,90,70)].CGPath;
    [self.view.layer addSublayer:circLayer14];
    
    CAShapeLayer *circLayer15 = [CAShapeLayer layer];
    circLayer15.strokeColor = [UIColor purpleColor].CGColor;
    circLayer15.fillColor = [UIColor purpleColor].CGColor;
    circLayer15.lineWidth = 2;
    circLayer15.path = _wavePathLow6.CGPath;//[UIBezierPath bezierPathWithOvalInRect:CGRectMake(20,30,90,70)].CGPath;
    [self.view.layer addSublayer:circLayer15];
//    self.view.layer.anchorPoint = CGPointMake(0.5,0.5);
//    circLayer10.position = CGPointMake(180, 330);
//    CABasicAnimation *stard = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
//    stard.toValue = [NSNumber numberWithFloat:2*M_PI];
//    stard.duration = 10;
//    stard.beginTime = 0;
//    [self.view.layer addAnimation:stard forKey:nil];
    
    
//    CAShapeLayer *circLayer = [CAShapeLayer layer];
//    circLayer.strokeColor = [UIColor purpleColor].CGColor;
//    circLayer.fillColor = [UIColor purpleColor].CGColor;
//    circLayer.lineWidth = 2;
//    circLayer.path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(CGRectGetMaxX(self.view.bounds)/4*3-35,303,90,90) cornerRadius:45].CGPath;
//    [self.view.layer addSublayer:circLayer];
//
    CAShapeLayer *circLayer1 = [CAShapeLayer layer];
    circLayer1.strokeColor = [UIColor greenColor].CGColor;
    circLayer1.fillColor = [UIColor greenColor].CGColor;
    circLayer1.lineWidth = 2;
    circLayer1.path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(CGRectGetMaxX(self.view.bounds)/4*3+10, 348) radius:40 startAngle:0 endAngle:2*M_PI clockwise:YES].CGPath;
    [view1.layer addSublayer:circLayer1];
    
    CABasicAnimation *startA = [CABasicAnimation animationWithKeyPath:@"path"];
    startA.fromValue = (__bridge id _Nullable)[UIBezierPath bezierPathWithArcCenter:CGPointMake(CGRectGetMaxX(self.view.bounds)/4*3+10, 348) radius:-1 startAngle:0 endAngle:2*M_PI clockwise:YES].CGPath;
    startA.toValue = (__bridge id _Nullable)[UIBezierPath bezierPathWithArcCenter:CGPointMake(CGRectGetMaxX(self.view.bounds)/4*3+10, 348) radius:40 startAngle:0 endAngle:2*M_PI clockwise:YES].CGPath;
    startA.duration = 0.5;
    startA.removedOnCompletion = false;
    startA.fillMode = kCAFillModeForwards;
    //startA.repeatCount = CGFLOAT_MAX;
    [circLayer1 addAnimation:startA forKey:nil];
    
    
    [self performSelector:@selector(ddd:) withObject:circLayer1 afterDelay:0.5];
    
    
    
    //变形
    CAShapeLayer *line = [CAShapeLayer layer];
    line.strokeColor = [UIColor orangeColor].CGColor;
    line.fillColor = [UIColor clearColor].CGColor;
    line.lineWidth = 5;
    line.lineCap = kCALineCapRound;
    line.lineJoin = kCALineJoinRound;
    [self.view.layer addSublayer:line];
    UIBezierPath *path = [UIBezierPath new];
    [path moveToPoint:CGPointMake(0, 400)];
    [path addCurveToPoint:CGPointMake(150, 400) controlPoint1:CGPointMake(50, 350) controlPoint2:CGPointMake(100, 450)];
    [path addCurveToPoint:CGPointMake(300, 400) controlPoint1:CGPointMake(200, 350) controlPoint2:CGPointMake(250, 450)];
    [path addCurveToPoint:CGPointMake(300, 250) controlPoint1:CGPointMake(250, 300) controlPoint2:CGPointMake(350, 350)];
    [path addCurveToPoint:CGPointMake(300, 100) controlPoint1:CGPointMake(250, 150) controlPoint2:CGPointMake(350, 200)];
    [path addCurveToPoint:CGPointMake(150, 100) controlPoint1:CGPointMake(200, 50) controlPoint2:CGPointMake(250, 150)];
    [path addCurveToPoint:CGPointMake(0, 100) controlPoint1:CGPointMake(50, 50) controlPoint2:CGPointMake(100, 150)];
    //    [path closePath];
    line.path = path.CGPath;
    
    CABasicAnimation *startc = [CABasicAnimation animationWithKeyPath:@"strokeStart"];
    startc.fromValue = @(-0.16667);
    startc.toValue = @(0.83333);
    
    CABasicAnimation *endd = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    endd.fromValue = @(0.0);
    endd.toValue = @(1.0);
    
    CAAnimationGroup *animationGroup2 = [CAAnimationGroup animation];
    animationGroup2.animations = @[startc,endd];
    animationGroup2.duration = 20;
    animationGroup2.repeatCount = CGFLOAT_MAX;
    //animationGroup.fillMode = kCAFillModeBoth;
    animationGroup2.removedOnCompletion = NO;
    [line addAnimation:animationGroup2 forKey:nil];
    
}

-(void)ddd:(CAShapeLayer*)layer
{
    //从正常到X长Y短
    CABasicAnimation *startB = [CABasicAnimation animationWithKeyPath:@"path"];
    startB.fromValue = (__bridge id _Nullable)[UIBezierPath bezierPathWithArcCenter:CGPointMake(CGRectGetMaxX(self.view.bounds)/4*3+10, 348) radius:40 startAngle:0 endAngle:2*M_PI clockwise:YES].CGPath;
    startB.toValue = (__bridge id _Nullable)([UIBezierPath bezierPathWithOvalInRect:CGRectMake(CGRectGetMaxX(self.view.bounds)/4*3-32.5,310.5,85,75)].CGPath);
    startB.duration = 0.25;
    startB.beginTime = 0;
    //startB.repeatCount = CGFLOAT_MAX;
    
    //从X长Y短到X短Y长
    CABasicAnimation *startC = [CABasicAnimation animationWithKeyPath:@"path"];
    startC.fromValue = (__bridge id _Nullable)([UIBezierPath bezierPathWithOvalInRect:CGRectMake(CGRectGetMaxX(self.view.bounds)/4*3-32.5,310.5,85,75)].CGPath);
    startC.toValue = (__bridge id _Nullable)([UIBezierPath bezierPathWithOvalInRect:CGRectMake(CGRectGetMaxX(self.view.bounds)/4*3-27.5,305.5,75,85)].CGPath);
    startC.duration = 0.5;
    startC.beginTime = 0.25;
    
    //从X短Y长到正常
    CABasicAnimation *startD = [CABasicAnimation animationWithKeyPath:@"path"];
    startD.fromValue = (__bridge id _Nullable)([UIBezierPath bezierPathWithOvalInRect:CGRectMake(CGRectGetMaxX(self.view.bounds)/4*3-27.5,305.5,75,85)].CGPath);
    startD.toValue = (__bridge id _Nullable)[UIBezierPath bezierPathWithArcCenter:CGPointMake(CGRectGetMaxX(self.view.bounds)/4*3+10, 348) radius:40 startAngle:0 endAngle:2*M_PI clockwise:YES].CGPath;
    startD.duration = 0.25;
    startD.beginTime = 0.75;
    
    
//    //从X长Y短到正常
//    CABasicAnimation *startE = [CABasicAnimation animationWithKeyPath:@"path"];
//    startE.fromValue = (__bridge id _Nullable)([UIBezierPath bezierPathWithOvalInRect:CGRectMake(CGRectGetMaxX(self.view.bounds)/4*3-35,313,90,70)].CGPath);
//    startE.toValue = (__bridge id _Nullable)[UIBezierPath bezierPathWithArcCenter:CGPointMake(CGRectGetMaxX(self.view.bounds)/4*3+10, 348) radius:40 startAngle:0 endAngle:2*M_PI clockwise:YES].CGPath;
//    startE.duration = 0.5;
//    startE.beginTime = 2.5;
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.animations = @[startB,startC,startD];
    group.duration = 1;
    group.repeatCount = 2;
    [layer addAnimation:group forKey:nil];
    
    [self performSelector:@selector(aaa:) withObject:layer afterDelay:2];
    
    
}


-(void)aaa:(CAShapeLayer*)layer
{
    CAShapeLayer *square = [CAShapeLayer layer];
    square.fillColor = [UIColor greenColor].CGColor;
    square.strokeColor = [UIColor greenColor].CGColor;
    square.lineWidth = 6;
    UIBezierPath *squarePath = [UIBezierPath new];
    [squarePath moveToPoint:CGPointMake(CGRectGetMaxX(self.view.bounds)/4*3+10, 348-30)];
    [squarePath addLineToPoint:CGPointMake(CGRectGetMaxX(self.view.bounds)/4*3+10 - 25, 348+20)];
    [squarePath addLineToPoint:CGPointMake(CGRectGetMaxX(self.view.bounds)/4*3+10 + 25, 348+20)];
    [squarePath closePath];
    square.lineCap = kCALineCapRound;
    square.lineJoin = kCALineJoinRound;
    square.path = squarePath.CGPath;
    [view1.layer addSublayer:square];
    
    
    CABasicAnimation *stara = [CABasicAnimation animationWithKeyPath:@"path"];
    stara.fromValue = (__bridge id _Nullable)(squarePath.CGPath);
    stara.toValue = (__bridge id _Nullable)([self aq:CGPointMake(CGRectGetMaxX(self.view.bounds)/4*3+10, 348-30) point2:CGPointMake(CGRectGetMaxX(self.view.bounds)/4*3+10 - 43, 348+20) point3:CGPointMake(CGRectGetMaxX(self.view.bounds)/4*3+10 + 25, 348+20)].CGPath);
    stara.duration = 1;
//    stara.removedOnCompletion = NO;
//    stara.fillMode = kCAFillModeForwards;
    
    CABasicAnimation *starb = [CABasicAnimation animationWithKeyPath:@"path"];
    starb.fromValue = stara.toValue;
    starb.toValue = (__bridge id _Nullable)([self aq:CGPointMake(CGRectGetMaxX(self.view.bounds)/4*3+10, 348-30) point2:CGPointMake(CGRectGetMaxX(self.view.bounds)/4*3+10 - 43, 348+20) point3:CGPointMake(CGRectGetMaxX(self.view.bounds)/4*3+10 + 43, 348+20)].CGPath);
    starb.duration = 1;
    starb.beginTime = 1;
//    starb.removedOnCompletion = NO;
//    starb.fillMode = kCAFillModeForwards;
    

    
    CABasicAnimation *starc = [CABasicAnimation animationWithKeyPath:@"path"];
    starc.fromValue = starb.toValue;
    starc.toValue = (__bridge id _Nullable)([self aq:CGPointMake(CGRectGetMaxX(self.view.bounds)/4*3+10, 348-46) point2:CGPointMake(CGRectGetMaxX(self.view.bounds)/4*3+10 - 43, 348+20) point3:CGPointMake(CGRectGetMaxX(self.view.bounds)/4*3+10 + 43, 348+20)].CGPath);
    starc.duration = 1;
    starc.beginTime = 2;
//    starc.removedOnCompletion = NO;
//    starc.fillMode = kCAFillModeForwards;
    
//    square.anchorPoint = CGPointMake(0, 0);
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.animations = @[stara,starb,starc];
    group.duration = 3;
    group.removedOnCompletion = NO;
    group.fillMode = kCAFillModeForwards;
    [square addAnimation:group forKey:nil];
    
    [self performSelector:@selector(bbb:) withObject:layer afterDelay:3];
    
    
    
    
}


-(void)bbb:(CAShapeLayer*)layer
{
    CABasicAnimation *stare = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    stare.toValue = [NSNumber numberWithFloat:2*M_PI];
    stare.duration = 0.45;
    stare.removedOnCompletion = true;
    [view1.layer addAnimation:stare forKey:nil];
    
    CABasicAnimation *startA = [CABasicAnimation animationWithKeyPath:@"path"];
    startA.fromValue = (__bridge id _Nullable)[UIBezierPath bezierPathWithArcCenter:CGPointMake(CGRectGetMaxX(self.view.bounds)/4*3+10, 348) radius:40 startAngle:0 endAngle:2*M_PI clockwise:YES].CGPath;
    startA.toValue = (__bridge id _Nullable)[UIBezierPath bezierPathWithArcCenter:CGPointMake(CGRectGetMaxX(self.view.bounds)/4*3+10, 348) radius:-1 startAngle:0 endAngle:2*M_PI clockwise:YES].CGPath;
    startA.duration = 0.7;
    startA.removedOnCompletion = false;
    startA.fillMode = kCAFillModeForwards;
    //startA.repeatCount = CGFLOAT_MAX;
    [layer addAnimation:startA forKey:nil];
    
    [self performSelector:@selector(ccc:) withObject:layer afterDelay:0.45];
}

-(void)ccc:(CAShapeLayer*)layer
{
    CAShapeLayer *square = [CAShapeLayer layer];
    square.fillColor = [UIColor clearColor].CGColor;
    square.strokeColor = [UIColor purpleColor].CGColor;
    square.lineWidth = 5;
    UIBezierPath *squarePath = [UIBezierPath new];
    [squarePath moveToPoint:CGPointMake(CGRectGetMaxX(self.view.bounds)/4*3+10 - 48, 348+25)];
    [squarePath addLineToPoint:CGPointMake(CGRectGetMaxX(self.view.bounds)/4*3+10 - 48, 348-65)];
    [squarePath addLineToPoint:CGPointMake(CGRectGetMaxX(self.view.bounds)/4*3+10 + 48, 348-65)];
    [squarePath addLineToPoint:CGPointMake(CGRectGetMaxX(self.view.bounds)/4*3+10 + 48, 348+25)];
    [squarePath closePath];
    square.path = squarePath.CGPath;
    [view1.layer addSublayer:square];
    
    CABasicAnimation *stara = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    stara.fromValue = @0;
    stara.toValue = @1;
    stara.duration = 0.5;
    [square addAnimation:stara forKey:nil];
    
    [self performSelector:@selector(ddd) withObject:nil afterDelay:0.45];
}

-(void)ddd
{
    CAShapeLayer *bezier = [CAShapeLayer layer];
    bezier.fillColor = [UIColor purpleColor].CGColor;
    
    
    UIBezierPath *_wavePathPre = [[UIBezierPath alloc] init];
    [_wavePathPre moveToPoint:CGPointMake(CGRectGetMaxX(self.view.bounds)/4*3+10 - 48, 348+25)];
    [_wavePathPre addLineToPoint:CGPointMake(CGRectGetMaxX(self.view.bounds)/4*3+10 - 48, 348+25 - 1)];
    [_wavePathPre addLineToPoint:CGPointMake(CGRectGetMaxX(self.view.bounds)/4*3+10 + 48, 348+25 - 1)];
    [_wavePathPre addLineToPoint:CGPointMake(CGRectGetMaxX(self.view.bounds)/4*3+10 + 48, 348+25)];
    [_wavePathPre addLineToPoint:CGPointMake(CGRectGetMaxX(self.view.bounds)/4*3+10 - 48, 348+25)];
    [_wavePathPre closePath];
    
    bezier.path = _wavePathPre.CGPath;
    [view1.layer addSublayer:bezier];
    
    UIBezierPath *stara = [[UIBezierPath alloc] init];
    [stara moveToPoint:CGPointMake(CGRectGetMaxX(self.view.bounds)/4*3+10 - 48, 348+25)];
    [stara addLineToPoint:CGPointMake(CGRectGetMaxX(self.view.bounds)/4*3+10 - 48, 348+25 - 20)];
    [stara addCurveToPoint:CGPointMake(CGRectGetMaxX(self.view.bounds)/4*3+10 + 48, 348+25 - 20) controlPoint1:CGPointMake(CGRectGetMaxX(self.view.bounds)/4*3+10 - 48 + 33, 348+25 - 10) controlPoint2:CGPointMake(CGRectGetMaxX(self.view.bounds)/4*3+10 - 48 +66, 348+25 - 30)];
    [stara addLineToPoint:CGPointMake(CGRectGetMaxX(self.view.bounds)/4*3+10 + 48, 348+25)];
    [stara addLineToPoint:CGPointMake(CGRectGetMaxX(self.view.bounds)/4*3+10 - 48, 348+25)];
    [stara closePath];
    
    UIBezierPath *starb = [[UIBezierPath alloc] init];
    [starb moveToPoint:CGPointMake(CGRectGetMaxX(self.view.bounds)/4*3+10 - 48, 348+25)];
    [starb addLineToPoint:CGPointMake(CGRectGetMaxX(self.view.bounds)/4*3+10 - 48, 348+25 - 40)];
    [starb addCurveToPoint:CGPointMake(CGRectGetMaxX(self.view.bounds)/4*3+10 + 48, 348+25 - 40) controlPoint1:CGPointMake(CGRectGetMaxX(self.view.bounds)/4*3+10 - 48 + 33, 348+25 - 50) controlPoint2:CGPointMake(CGRectGetMaxX(self.view.bounds)/4*3+10 - 48 +66, 348+25 - 30)];
    [starb addLineToPoint:CGPointMake(CGRectGetMaxX(self.view.bounds)/4*3+10 + 48, 348+25)];
    [starb addLineToPoint:CGPointMake(CGRectGetMaxX(self.view.bounds)/4*3+10 - 48, 348+25)];
    [starb closePath];
    
    UIBezierPath *starc = [[UIBezierPath alloc] init];
    [starc moveToPoint:CGPointMake(CGRectGetMaxX(self.view.bounds)/4*3+10 - 48, 348+25)];
    [starc addLineToPoint:CGPointMake(CGRectGetMaxX(self.view.bounds)/4*3+10 - 48, 348+25 - 60)];
    [starc addCurveToPoint:CGPointMake(CGRectGetMaxX(self.view.bounds)/4*3+10 + 48, 348+25 - 60) controlPoint1:CGPointMake(CGRectGetMaxX(self.view.bounds)/4*3+10 - 48 + 33, 348+25 - 40) controlPoint2:CGPointMake(CGRectGetMaxX(self.view.bounds)/4*3+10 - 48 +66, 348+25 - 70)];
    [starc addLineToPoint:CGPointMake(CGRectGetMaxX(self.view.bounds)/4*3+10 + 48, 348+25)];
    [starc addLineToPoint:CGPointMake(CGRectGetMaxX(self.view.bounds)/4*3+10 - 48, 348+25)];
    [starc closePath];
    
    
    UIBezierPath *stard = [[UIBezierPath alloc] init];
    [stard moveToPoint:CGPointMake(CGRectGetMaxX(self.view.bounds)/4*3+10 - 48, 348+25)];
    [stard addLineToPoint:CGPointMake(CGRectGetMaxX(self.view.bounds)/4*3+10 - 48, 348 - 65)];
    [stard addLineToPoint:CGPointMake(CGRectGetMaxX(self.view.bounds)/4*3+10 + 48, 348 - 65)];
    [stard addLineToPoint:CGPointMake(CGRectGetMaxX(self.view.bounds)/4*3+10 + 48, 348+25)];
    [stard addLineToPoint:CGPointMake(CGRectGetMaxX(self.view.bounds)/4*3+10 - 48, 348+25)];
    [stard closePath];
    
    
    CABasicAnimation *star1 = [CABasicAnimation animationWithKeyPath:@"path"];
    star1.fromValue = (__bridge id _Nullable)(_wavePathPre.CGPath);
    star1.toValue = (__bridge id _Nullable)(stara.CGPath);
    star1.beginTime = 0;
    star1.duration = 0.45;
    
    CABasicAnimation *star2 = [CABasicAnimation animationWithKeyPath:@"path"];
    star2.fromValue = (__bridge id _Nullable)(stara.CGPath);
    star2.toValue = (__bridge id _Nullable)(starb.CGPath);
    star2.beginTime = 0.45;
    star2.duration = 0.45;
    
    CABasicAnimation *star3 = [CABasicAnimation animationWithKeyPath:@"path"];
    star3.fromValue = (__bridge id _Nullable)(starb.CGPath);
    star3.toValue = (__bridge id _Nullable)(starc.CGPath);
    star3.beginTime = 0.9;
    star3.duration = 0.45;
    
    CABasicAnimation *star4 = [CABasicAnimation animationWithKeyPath:@"path"];
    star4.fromValue = (__bridge id _Nullable)(starc.CGPath);
    star4.toValue = (__bridge id _Nullable)(stard.CGPath);
    star4.beginTime = 1.35;
    star4.duration = 0.45;
    
    CABasicAnimation *star5 = [CABasicAnimation animationWithKeyPath:@"path"];
    star5.fromValue = (__bridge id _Nullable)(stard.CGPath);
    star5.toValue = (__bridge id _Nullable)(starc.CGPath);
    star5.beginTime = 1.8;
    star5.duration = 0.45;
    
    CABasicAnimation *star6 = [CABasicAnimation animationWithKeyPath:@"path"];
    star6.fromValue = (__bridge id _Nullable)(starc.CGPath);
    star6.toValue = (__bridge id _Nullable)(starb.CGPath);
    star6.beginTime = 2.25;
    star6.duration = 0.45;
    
    CABasicAnimation *star7 = [CABasicAnimation animationWithKeyPath:@"path"];
    star7.fromValue = (__bridge id _Nullable)(starb.CGPath);
    star7.toValue = (__bridge id _Nullable)(stara.CGPath);
    star7.beginTime = 2.7;
    star7.duration = 0.45;
    
    CABasicAnimation *star8 = [CABasicAnimation animationWithKeyPath:@"path"];
    star8.fromValue = (__bridge id _Nullable)(stara.CGPath);
    star8.toValue = (__bridge id _Nullable)(_wavePathPre.CGPath);
    star8.beginTime = 3.15;
    star8.duration = 0.45;
    
    CAAnimationGroup *group = [CAAnimationGroup new];
    group.animations = @[star1,star2,star3,star4,star5,star6,star7,star8];
    group.duration = 3.6;
    group.fillMode = kCAFillModeForwards;
    group.removedOnCompletion = false;
    group.repeatCount = 50;
    [bezier addAnimation:group forKey:nil];
}


-(UIBezierPath*)aq:(CGPoint)point1 point2:(CGPoint)point2 point3:(CGPoint)point3
{
    UIBezierPath *squarePath = [UIBezierPath new];
    [squarePath moveToPoint:point1];
    [squarePath addLineToPoint:point2];
    [squarePath addLineToPoint:point3];
    [squarePath closePath];
    return squarePath;
}


-(void)thread
{
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_group_t group = dispatch_group_create();
    dispatch_group_async(group, queue, ^{
        [NSThread sleepForTimeInterval:5];
        NSLog(@"group1");
    });
    
    dispatch_group_async(group, queue, ^{
        [NSThread sleepForTimeInterval:3];
        NSLog(@"group2");
    });
    
    dispatch_group_async(group, queue, ^{
        [NSThread sleepForTimeInterval:1];
        NSLog(@"group3");
    });
    
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        NSLog(@"updateUI");
    });
}


//烟花
- (void)initFireworks{
    
    
    self.caELayer                   = [CAEmitterLayer layer];
    // 发射源
    self.caELayer.emitterPosition   = CGPointMake(200, 500);
    // 发射源尺寸大小
    self.caELayer.emitterSize       = CGSizeMake(50, 0);
    // 发射源模式
    self.caELayer.emitterMode       = kCAEmitterLayerOutline;
    // 发射源的形状
    self.caELayer.emitterShape      = kCAEmitterLayerLine;
    // 渲染模式
    self.caELayer.renderMode        = kCAEmitterLayerAdditive;
    // 发射方向
    self.caELayer.velocity          = 1;
    // 随机产生粒子
    self.caELayer.seed              = (arc4random() % 100) + 1;
    
    // cell
    CAEmitterCell *cell             = [CAEmitterCell emitterCell];
    // 速率
    cell.birthRate                  = 1.0;
    // 发射的角度
    cell.emissionRange              = 0.11 * M_PI;
    // 速度
    cell.velocity                   = 300;
    // 范围
    cell.velocityRange              = 150;
    // Y轴 加速度分量
    cell.yAcceleration              = 75;
    // 声明周期
    cell.lifetime                   = 2.04;
    //是个CGImageRef的对象,既粒子要展现的图片
    cell.contents                   = (id)
    [[UIImage imageNamed:@"blue"] CGImage];
    // 缩放比例
    cell.scale                      = 0.2;
    // 粒子的颜色
    cell.color                      = [[UIColor colorWithRed:0.6
                                                       green:0.6
                                                        blue:0.6
                                                       alpha:1.0] CGColor];
    // 一个粒子的颜色green 能改变的范围
    cell.greenRange                 = 1.0;
    // 一个粒子的颜色red 能改变的范围
    cell.redRange                   = 1.0;
    // 一个粒子的颜色blue 能改变的范围
    cell.blueRange                  = 1.0;
    // 子旋转角度范围
    cell.spinRange                  = M_PI;
    
    // 爆炸
    CAEmitterCell *burst            = [CAEmitterCell emitterCell];
    // 粒子产生系数
    burst.birthRate                 = 1.0;
    // 速度
    burst.velocity                  = 0;
    // 缩放比例
    burst.scale                     = 2.5;
    // shifting粒子red在生命周期内的改变速度
    burst.redSpeed                  = -1.5;
    // shifting粒子blue在生命周期内的改变速度
    burst.blueSpeed                 = +1.5;
    // shifting粒子green在生命周期内的改变速度
    burst.greenSpeed                = +1.0;
    //生命周期
    burst.lifetime                  = 0.35;
    
    
    // 火花 and finally, the sparks
    CAEmitterCell *spark            = [CAEmitterCell emitterCell];
    //粒子产生系数，默认为1.0
    spark.birthRate                 = 400;
    //速度
    spark.velocity                  = 125;
    // 360 deg//周围发射角度
    spark.emissionRange             = 2 * M_PI;
    // gravity//y方向上的加速度分量
    spark.yAcceleration             = 75;
    //粒子生命周期
    spark.lifetime                  = 3;
    //是个CGImageRef的对象,既粒子要展现的图片
    spark.contents                  = (id)
    [[UIImage imageNamed:@"blue"] CGImage];
    //缩放比例速度
    spark.scaleSpeed                = -0.2;
    //粒子green在生命周期内的改变速度
    spark.greenSpeed                = -0.1;
    //粒子red在生命周期内的改变速度
    spark.redSpeed                  = 0.4;
    //粒子blue在生命周期内的改变速度
    spark.blueSpeed                 = -0.1;
    //粒子透明度在生命周期内的改变速度
    spark.alphaSpeed                = -0.25;
    //子旋转角度
    spark.spin                      = 2* M_PI;
    //子旋转角度范围
    spark.spinRange                 = 2* M_PI;
    
    
    self.caELayer.emitterCells = [NSArray arrayWithObject:cell];
    cell.emitterCells = [NSArray arrayWithObjects:burst, nil];
    burst.emitterCells = [NSArray arrayWithObject:spark];
    [self.view.layer addSublayer:self.caELayer];
}

/*
//-(void)scrollViewDidScroll:(UIScrollView *)scrollView
//{
//    CGPoint offSet = scrollView.contentOffset;
//    if(offSet.x <= imagWidth/2+40)
//    {
//        dispatch_async(dispatch_get_main_queue(), ^{
//            [scrollView setContentOffset:CGPointMake(imagWidth-40, 0) animated:NO];
//            [self backImag];
//        });
//    }
//    else if(offSet.x >= imagWidth*3/2 -40)
//    {
//        dispatch_async(dispatch_get_main_queue(), ^{
//            [scrollView setContentOffset:CGPointMake(imagWidth-40, 0) animated:NO];
//            [self gotoImag];
//        });
//    }
//    
//}
//-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
//{
//    NSLog(@"-----结束------");
//}
//
//-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
//{
//    
//}
//
//- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
//{
//    if (decelerate)
//    {
//        dispatch_async(dispatch_get_main_queue(), ^{
//            printf("STOP IT!!\n");
//            [scrollView setContentOffset:CGPointMake(imagWidth-40, 0) animated:YES];
//        });
//    }
//    [scrollView setContentOffset:CGPointMake(imagWidth-40, 0) animated:NO];
//}

//-(void)backImag
//{
//    UIImage *image = img1.image;
//    img1.image = img5.image;
//    img5.image = img4.image;
//    img4.image = img3.image;
//    img3.image = img2.image;
//    img2.image = image;
//}
//-(void)gotoImag
//{
//    UIImage *image = img1.image;
//    img1.image = img2.image;
//    img2.image = img3.image;
//    img3.image = img4.image;
//    img4.image = img5.image;
//    img5.image = image;
//}

//-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//    return 5;
//}
//
//-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    static NSString* cellId = @"cellId";
//    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellId];
//    cell.textLabel.text = @"abcdefg";
//    return cell;
//}
//
//-(UIView*)headView
//{
//    imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 200)];
//    imageView.contentMode = UIViewContentModeScaleToFill;
//    imageView.image = [UIImage imageNamed:@"logo.png"];
//    return imageView;
//}
//
//-(void)scrollViewDidScroll:(UIScrollView *)scrollView
//{
//    float height = scrollView.contentOffset.y;
//    NSLog(@"height:     %f",height);
//    CGRect imageFrame = imageView.frame;
////    float a = height - imageFrame.size.height + 200;
////    NSLog(@"a:     %f",a);
//    imageFrame.size.height = 200 - height;
//    imageView.frame = imageFrame;
//    NSLog(@"---%@",NSStringFromCGRect(imageFrame));
//    
//}




//- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
//{
//    if([keyPath isEqualToString:@"currentTime"] && object == playerController.player)
//        NSLog(@"----:%f ,   -------:%f",[change[@"old"] floatValue],[change[@"new"] floatValue]);
//}
//
//-(void)buttonPlayer
//{
//    NSLog(@"-----------:%f",CMTimeGetSeconds(playerController.player.currentTime));
//}
//
//
//
//-(void)viewWillAppear:(BOOL)animated
//{
//    NSLog(@"lllll");
//}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

*/
@end
