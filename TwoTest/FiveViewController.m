//
//  FiveViewController.m
//  TwoTest
//
//  Created by ren on 2017/2/8.
//  Copyright © 2017年 ren. All rights reserved.
//

#import "FiveViewController.h"

@interface FiveViewController ()

@end

@implementation FiveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
//    imageView.backgroundColor = [UIColor redColor];
//    imageView.center = CGPointMake(200, 300);
//    
//    UIImage *anotherImage = [UIImage imageNamed:@"1.jpg"];
//    
//    UIGraphicsBeginImageContextWithOptions(_imageview.bounds.size, NO, 1.0);
//    
//    [[UIBezierPath bezierPathWithRoundedRect:_imageview.bounds cornerRadius:50] addClip];
//    
//    [anotherImage drawInRect:_imageview.bounds];
//
//    _imageview.image = UIGraphicsGetImageFromCurrentImageContext();
//    
//    UIGraphicsEndImageContext();
    
//    _imageview.layer.masksToBounds = YES;
//    _imageview.layer.cornerRadius = 50;
    
//    [self.view addSubview:imageView];
    
    
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:_imageview.bounds cornerRadius:50];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc]init];
    maskLayer.frame = _imageview.bounds;
    maskLayer.path = maskPath.CGPath;
    _imageview.layer.mask = maskLayer;
}

- (IBAction)buttonpressed:(UIButton *)sender {
    
    if(sender.tag == 1)
        [self gcd];
    else if (sender.tag == 2)
        [self NSThred];
    else if (sender.tag == 0)
        [self clear];
}



-(void)clear
{
    self.imageview1.image = nil;
    self.imageview2.image = nil;
    self.imageview3.image = nil;
    self.imageview4.image = nil;
}

-(void)gcd
{
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        UIImage *image1 = [self downImage:@"https://ss0.bdstatic.com/94oJfD_bAAcT8t7mm9GUKT-xh_/timg?image&quality=100&size=b4000_4000&sec=1486537204&di=29fe4c153b6220ba654bfd5312783fe9&src=http://img5.duitang.com/uploads/item/201207/31/20120731011710_LQscc.jpeg"];
//        UIImage *image2 = [self downImage:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1486547290612&di=2c9a40c207283d8c130ac93e577e2fd1&imgtype=0&src=http%3A%2F%2Fa3.topitme.com%2F0%2Fd7%2F66%2F11277206263a266d70o.jpg"];
//        UIImage *image3 = [self downImage:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1486547290612&di=3041e5bd831235630c5fb36196c5e8eb&imgtype=0&src=http%3A%2F%2Fimg2.duitang.com%2Fuploads%2Fitem%2F201204%2F10%2F20120410205128_QGPNu.jpeg"];
//        UIImage *image4 = [self downImage:@"http://img.zcool.cn/community/0142135541fe180000019ae9b8cf86.jpg@1280w_1l_2o_100sh.png"];
//        dispatch_async(dispatch_get_main_queue(), ^{
//            self.imageview1.image = image1;
//            self.imageview2.image = image2;
//            self.imageview3.image = image3;
//            self.imageview4.image = image4;
//        });
//    });
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSLog(@"------------------------0-----");
        UIImage *image1 = [self downImage:@"http://imgsrc.baidu.com/forum/pic/item/94c7e81090ef76c66f37f55a9416fdfaae5167f1.jpg"];
        NSLog(@"------------------------1-----");
        UIImage *image2 = [self downImage:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1486547290612&di=2c9a40c207283d8c130ac93e577e2fd1&imgtype=0&src=http%3A%2F%2Fa3.topitme.com%2F0%2Fd7%2F66%2F11277206263a266d70o.jpg"];
        UIImage *image3 = [self downImage:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1486547290612&di=3041e5bd831235630c5fb36196c5e8eb&imgtype=0&src=http%3A%2F%2Fimg2.duitang.com%2Fuploads%2Fitem%2F201204%2F10%2F20120410205128_QGPNu.jpeg"];
        UIImage *image4 = [self downImage:@"http://img.zcool.cn/community/0142135541fe180000019ae9b8cf86.jpg@1280w_1l_2o_100sh.png"];
        NSLog(@"------------------------2-----");
        dispatch_async(dispatch_get_main_queue(), ^{
            self.imageview1.image = image1;
            self.imageview2.image = image2;
            self.imageview3.image = image3;
            self.imageview4.image = image4;
            NSLog(@"------------------------3-----");
        });
    });
    NSLog(@"------------------------4-----");
//
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        UIImage *image1 = [self downImage:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1486547290612&di=2c9a40c207283d8c130ac93e577e2fd1&imgtype=0&src=http%3A%2F%2Fa3.topitme.com%2F0%2Fd7%2F66%2F11277206263a266d70o.jpg"];
//        dispatch_async(dispatch_get_main_queue(), ^{
//            self.imageview2.image = image1;
//        });
//    });
//
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        UIImage *image1 = [self downImage:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1486547290612&di=3041e5bd831235630c5fb36196c5e8eb&imgtype=0&src=http%3A%2F%2Fimg2.duitang.com%2Fuploads%2Fitem%2F201204%2F10%2F20120410205128_QGPNu.jpeg"];
//        dispatch_async(dispatch_get_main_queue(), ^{
//            self.imageview3.image = image1;
//        });
//    });
//
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        UIImage *image1 = [self downImage:@"http://img.zcool.cn/community/0142135541fe180000019ae9b8cf86.jpg@1280w_1l_2o_100sh.png"];
//        dispatch_async(dispatch_get_main_queue(), ^{
//            self.imageview4.image = image1;
//        });
//    });
}

-(void)NSThred
{
    NSThread *thred1 = [[NSThread alloc]initWithTarget:self selector:@selector(downImageNSThred:) object:[NSDictionary dictionaryWithObjectsAndKeys:@"https://ss0.bdstatic.com/94oJfD_bAAcT8t7mm9GUKT-xh_/timg?image&quality=100&size=b4000_4000&sec=1486537204&di=29fe4c153b6220ba654bfd5312783fe9&src=http://img5.duitang.com/uploads/item/201207/31/20120731011710_LQscc.jpeg",@"url",@"imageview1",@"imageview",nil]];
    [thred1 start];
    
    NSThread *thred2 = [[NSThread alloc]initWithTarget:self selector:@selector(downImageNSThred:) object:[NSDictionary dictionaryWithObjectsAndKeys:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1486547290612&di=2c9a40c207283d8c130ac93e577e2fd1&imgtype=0&src=http%3A%2F%2Fa3.topitme.com%2F0%2Fd7%2F66%2F11277206263a266d70o.jpg",@"url",@"imageview2",@"imageview",nil]]; 
    [thred2 start];
    
    NSThread *thred3 = [[NSThread alloc]initWithTarget:self selector:@selector(downImageNSThred:) object:[NSDictionary dictionaryWithObjectsAndKeys:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1486547290612&di=3041e5bd831235630c5fb36196c5e8eb&imgtype=0&src=http%3A%2F%2Fimg2.duitang.com%2Fuploads%2Fitem%2F201204%2F10%2F20120410205128_QGPNu.jpeg",@"url",@"imageview3",@"imageview",nil]];
    [thred3 start];
    
    NSThread *thred4 = [[NSThread alloc]initWithTarget:self selector:@selector(downImageNSThred:) object:[NSDictionary dictionaryWithObjectsAndKeys:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1486547290612&di=2ddd38253c996cc91d0650ec68016fc3&imgtype=0&src=http%3A%2F%2Fcdn.duitang.com%2Fuploads%2Fitem%2F201509%2F13%2F20150913123656_8KYzt.thumb.700_0.jpeg",@"url",@"imageview4",@"imageview",nil]];
    [thred4 start];
}

-(UIImage*)downImage:(NSString*)url
{
    NSURL *URL = [NSURL URLWithString:url];
return [UIImage imageWithData:[NSData dataWithContentsOfURL:URL]];
}

-(void)downImageNSThred:(NSDictionary *)dic
{
    NSURL *URL = [NSURL URLWithString:dic[@"url"]];
    UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:URL]];
    [self performSelectorOnMainThread:@selector(updateUI:) withObject:[NSDictionary dictionaryWithObjectsAndKeys:image,@"image",dic[@"imageview"],@"imageview",nil] waitUntilDone:YES];
}

-(void)updateUI:(NSDictionary*)dic
{
    if([dic[@"imageview"] isEqualToString:@"imageview1"])
        self.imageview1.image = dic[@"image"];
    else if ([dic[@"imageview"] isEqualToString:@"imageview2"])
        self.imageview2.image = dic[@"image"];
    else if ([dic[@"imageview"] isEqualToString:@"imageview3"])
        self.imageview3.image = dic[@"image"];
    else
        self.imageview4.image = dic[@"image"];
}

@end
