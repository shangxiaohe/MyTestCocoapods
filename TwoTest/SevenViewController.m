//
//  SevenViewController.m
//  TwoTest
//
//  Created by ren on 2017/3/9.
//  Copyright © 2017年 ren. All rights reserved.
//

#import "SevenViewController.h"
#import "WebObject.h"
#import <JavaScriptCore/JavaScriptCore.h>
#import "ShareExple.h"

@interface SevenViewController ()<UIWebViewDelegate>
{
    UIWebView *webview1;
}

@end

@implementation SevenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    webview1 = [[UIWebView alloc]initWithFrame:self.view.frame];
    webview1.delegate = self;
    [self.view addSubview:webview1];
    NSString *path = [[NSBundle mainBundle] bundlePath];
    NSURL *baseUrl = [NSURL fileURLWithPath:path];
    NSString *htmlPath = [[NSBundle mainBundle] pathForResource:@"fillin_form" ofType:@"html"];
    NSString * htmlCont = [NSString stringWithContentsOfFile:htmlPath
                                                    encoding:NSUTF8StringEncoding
                                                       error:nil];
    [webview1 loadHTMLString:htmlCont baseURL:baseUrl];
    
    ShareExple *share = [ShareExple sharedInstance];
}


-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    //网页加载完成调用此方法
    
    //首先创建JSContext 对象（此处通过当前webView的键获取到jscontext）
    JSContext *context=[webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    
    //第二种情况，js是通过对象调用的，我们假设js里面有一个对象 testobject 在调用方法
    //首先创建我们新建类的对象，将他赋值给js的对象
    
    WebObject *testJO=[WebObject new];
    context[@"testobject"]=testJO;
    
    //同样我们也用刚才的方式模拟一下js调用方法
    NSString *jsStr1=@"testobject.aa()";
    [context evaluateScript:jsStr1];
//    NSString *jsStr2=@"testobject.TestOneParameter('参数1')";
//    [context evaluateScript:jsStr2];
//    NSString *jsStr3=@"testobject.TestTowParameterSecondParameter('参数A','参数B')";
//    [context evaluateScript:jsStr3];
    
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
