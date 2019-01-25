//
//  WebViewController.m
//  TwoTest
//
//  Created by ren on 2018/3/22.
//  Copyright © 2018年 ren. All rights reserved.
//

#import "WebViewController.h"
#import <WebKit/WebKit.h>
#import "Singleton.h"

@interface WebViewController ()
{
    UIWebView * WkWebView;
}
@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    WkWebView = [[UIWebView alloc]initWithFrame:self.view.frame];
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"xx_zwjf/view/home.html" withExtension:nil];
    [WkWebView loadRequest:[[NSURLRequest alloc] initWithURL:url]];
    [self.view addSubview:WkWebView];
    
    Singleton *single = [Singleton shareSingleton];
    single.name = @"aaa";
    NSLog(@"single 2: %@ ----",single.name);
}





@end
