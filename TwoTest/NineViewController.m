//
//  NineViewController.m
//  TwoTest
//
//  Created by ren on 2017/4/6.
//  Copyright © 2017年 ren. All rights reserved.
//

#import "NineViewController.h"
#import "TenViewController.h"
#import "GTMBase64.h"

@interface NineViewController ()<TenViewControllerDelegate>
{
    UIView *mainView;
    CAShapeLayer *layer;
    CGFloat angle;
    UILabel *label;
    TenViewController *tenVC;
    NSArray *arr;
}

@end

@implementation NineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if ([[[UIDevice currentDevice]systemVersion] floatValue] >=7.0)
    { //判断是否是IOS7
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:NO];
    }
    
    UIButton *button1 = [[UIButton alloc]initWithFrame:CGRectMake(10, 10, 60, 60)];
    button1.backgroundColor = [UIColor blackColor];
    [self.view addSubview:button1];
    button1.tag = 2;
    [button1 addTarget:self action:@selector(buttonPressed1:) forControlEvents:UIControlEventTouchUpInside];
    
    
    mainView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 60, 60)];
    [self.view addSubview:mainView];
    mainView.backgroundColor = [UIColor clearColor];
    mainView.center = self.view.center;
    [self animated1:CGRectMake(45, -15, 30, 30)];
    [self animated1:CGRectMake(-15, -15, 30, 30)];
    [self animated1:CGRectMake(-15, 45, 30, 30)];
    [self animated1:CGRectMake(45, 45, 30, 30)];
    
//    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(hanPan:)];
//    [self.view addGestureRecognizer:pan];
    
    
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(20, 100, 50, 50)];
    //button.backgroundColor = [UIColor redColor];
    button.layer.masksToBounds = YES;
    button.layer.cornerRadius = 25;
    //button.layer.borderWidth = 4;
    button.layer.borderColor = [UIColor clearColor].CGColor;
    [self.view addSubview:button];
    [button addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    angle = 0.5;
    layer = [CAShapeLayer layer];
    //layer.borderColor = [UIColor redColor].CGColor;
    //layer.borderWidth = 6;
    layer.strokeColor = [UIColor redColor].CGColor;
    layer.fillColor = [UIColor clearColor].CGColor;
    layer.path = [self aa:M_PI*angle].CGPath;
    [button.layer addSublayer:layer];
    
    
    
    label = [[UILabel alloc]initWithFrame:CGRectMake(10, 450, 350, 40)];
    [self.view addSubview:label];
    NSArray *arr = @[@"代理传值",@"代码块传值",@"通知传值",@"kvo传值"];
    for(int i = 0; i <4;i++)
    {
        UIButton *button2 = [[UIButton alloc]initWithFrame:CGRectMake(i*90, 500, 85, 40)];
        [button2 setTitle:arr[i] forState:UIControlStateNormal];
        [button2 setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
        button2.titleLabel.font = [UIFont systemFontOfSize:14];
        [self.view addSubview:button2];
        button2.tag = i+1;
        [button2 addTarget:self action:@selector(buttonPressed1:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(100, 250, 60, 60)];
    view.backgroundColor = [UIColor greenColor];
    [self.view addSubview:view];
    view.layer.masksToBounds = YES;
    view.layer.cornerRadius = 21;
    
    
    NSString *str = [GTMBase64 decodeBase64String:@"JXU1NkRFJXU1OTBEJXVGRjBDJXU1RTk0JXU4QkU1JXU2Q0ExJXU5NUVFJXU5ODk4"];
//    NSString *str1 = [str stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
//    NSString *str2 = [str stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
//    
//    NSString *str3 = [@"JXU1NkRFJXU1OTBEJXVGRjBDJXU1RTk0JXU4QkU1JXU2Q0ExJXU5NUVFJXU5ODk4" stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
//    NSString *str4 = [@"JXU1NkRFJXU1OTBEJXVGRjBDJXU1RTk0JXU4QkU1JXU2Q0ExJXU5NUVFJXU5ODk4" stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    UIView *view1 = [[UIView alloc]initWithFrame:CGRectMake(0, 100, self.view.bounds.size.width, 50)];
    view1.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view1];
    
    UISearchBar *search = [[UISearchBar alloc]initWithFrame:CGRectMake(0, 0, 300, 10)];
    search.backgroundColor = [UIColor redColor];
    CGRect fer = search.frame;
    [view1 addSubview:search];
    
    
    
}

-(UIBezierPath*)aa:(CGFloat)angle
{
    UIBezierPath *bzier = [[UIBezierPath alloc]init];
    [bzier addArcWithCenter:CGPointMake(25, 25) radius:23 startAngle:0 endAngle:angle clockwise:YES];
    return bzier;
}

-(void)buttonPressed:(UIButton*)send
{
    angle +=0.5;
    layer.path = [self aa:M_PI*angle].CGPath;
}



-(void)hanPan:(UIPanGestureRecognizer*)pan
{
    NSLog(@"--pan:%@",pan);
    CGPoint point = [pan translationInView:self.view];
    NSLog(@"--paint:%@",NSStringFromCGPoint(point));
}

-(void)animated1:(CGRect)rect1
{
    CAShapeLayer *layer1 = [CAShapeLayer layer];
    layer1.fillColor = [UIColor redColor].CGColor;
    layer1.path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(15, 15, 30, 30) cornerRadius:15].CGPath;
    [mainView.layer addSublayer:layer1];
    [self animated2:layer1 point1:rect1];
    
}

-(void)animated2:(CAShapeLayer*)layer point1:(CGRect)rect1
{
    CABasicAnimation *animate1 = [CABasicAnimation animationWithKeyPath:@"path"];
    animate1.fromValue = (__bridge id _Nullable)(layer.path);
    animate1.toValue = (__bridge id _Nullable)([UIBezierPath bezierPathWithRoundedRect:rect1 cornerRadius:15].CGPath);
    animate1.beginTime = 0.0;
    animate1.duration = 0.3;
    animate1.removedOnCompletion = false;
    animate1.fillMode = kCAFillModeForwards;
    
    CABasicAnimation *animate2 = [CABasicAnimation animationWithKeyPath:@"path"];
    animate2.fromValue = animate1.toValue;
    animate2.toValue = (__bridge id _Nullable)([UIBezierPath bezierPathWithRoundedRect:CGRectMake(15, 15, 30, 30) cornerRadius:15].CGPath);
    animate2.beginTime = 1.3;
    animate2.duration = 0.3;
    animate2.removedOnCompletion = false;
    animate2.fillMode = kCAFillModeForwards;

    CAAnimationGroup *group = [CAAnimationGroup new];
    group.animations = @[animate1,animate2];
    group.duration = 1.6;
    group.repeatCount = 100;
    group.fillMode = kCAFillModeForwards;
    group.removedOnCompletion = false;
    [layer addAnimation:group forKey:nil];
    
    [self performSelector:@selector(animated3) withObject:nil afterDelay:0.3];
}

-(void)aa
{

}

-(void)animated3
{
    CABasicAnimation *stare = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    stare.toValue = [NSNumber numberWithFloat:M_PI*1.5];
    stare.duration = 1;
    stare.removedOnCompletion = false;
    stare.fillMode = kCAFillModeForwards;
    
    CAAnimationGroup *group = [CAAnimationGroup new];
    group.animations = @[stare];
    group.duration = 1.6;
    group.repeatCount = 100;

    [mainView.layer addAnimation:group forKey:nil];
}


-(void)testbloack:(int (^)(int a,int b))myblock parameter1:(NSInteger)one parameter2:(NSInteger)two
{
    int a = myblock(one,two);
    NSLog(@"----%d",a);
    
    
}

-(void)buttonPressed1:(UIButton*)sender
{
    [self testbloack:^int(int a, int b) {
        return a + b;
    } parameter1:sender.tag parameter2:sender.tag];
    tenVC = [[TenViewController alloc]init];
    tenVC.delegate = self;
    switch (sender.tag) {
        case 1:
            tenVC.type = 1;
            break;
        case 2:
        {
            tenVC.type = 2;
            tenVC.MyBlock = ^(NSString *text)
        {
            label.text = text;
        };
        }
            break;
        case 3:
        {
            tenVC.type = 3;
            [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notiTextValue:) name:@"textValue" object:nil];
        }
            break;
        case 4:
        {
            tenVC.type = 4;
            [tenVC addObserver:self forKeyPath:@"text1" options:NSKeyValueObservingOptionOld|NSKeyValueObservingOptionNew context:nil];
        }
            break;
        default:
            break;
    }
    [self presentViewController:tenVC animated:YES completion:nil];
}

-(void)textValue:(NSString *)text
{
    label.text = text;
}

//通知回调
-(void)notiTextValue:(NSNotification*)noti
{
    NSDictionary *dic = noti.userInfo;
    label.text = [dic objectForKey:@"key"];
}

//kvo（观察者模式回调
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    NSLog(@"assssdfghjk");
    if([keyPath isEqualToString:@"text1"])
    {
        label.text = [change objectForKey:NSKeyValueChangeNewKey];
        [object removeObserver:self forKeyPath:@"text1"];
    }
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter ] removeObserver:@"textValue"];
}

@end
