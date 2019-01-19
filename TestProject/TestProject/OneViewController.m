//
//  OneViewController.m
//  TestProject
//
//  Created by lixianliang on 2018/10/9.
//  Copyright © 2018年 lixianliang. All rights reserved.
//

#import "OneViewController.h"
#import "UIImageView+WebCache.h"
#import "NSDictionary+deleteNullValue.h"
#import "UIImage+safe.h"

@interface OneViewController ()
{
    dispatch_group_t group;
}

@property (nonatomic, strong) UIImageView *imageview1;
@property (nonatomic, strong) UIImageView *imageview2;
@property (nonatomic, strong) UIImageView *imageview3;
@property (nonatomic, strong) UIImageView *imageview4;

@end

@implementation OneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self.view addSubview:self.imageview1];
    [self.view addSubview:self.imageview2];
    [self.view addSubview:self.imageview3];
    [self.view addSubview:self.imageview4];
    
    NSString *str = nil;
    
    NSDictionary *dic = @{@"key":@"value",@"a":str};
    
    NSLog(@"dic : %@",dic);
    

    
    //[self.imageview1 sd_setImageWithURL:[NSURL URLWithString:@"http://www.egouz.com/uploadfile/2015/0305/20150305103626911.jpg"]];
    
//    [self getImage:@"http://t2.hddhhn.com/uploads/tu/201801/9999/c63fb8c291.jpg" Black:^(UIImage *image) {
//        self.imageview1.image = image;
//    }];
    
//    [self thread];
    
//    UIImage *image = [UIImage imageNamed:@"111.jpg"];
    
    
}


-(void)thread
{
    NSMutableArray *arr = [NSMutableArray array];
    group = dispatch_group_create();
    

//    dispatch_group_async(group, dispatch_get_global_queue(0, 0), ^{
        [self getImage:@"http://t2.hddhhn.com/uploads/tu/201801/9999/04fd84a337.jpg" Black:^(UIImage *image) {
            [arr addObject:image];
        }];
//        NSLog(@"1");
//    });
//
//    dispatch_group_async(group, dispatch_get_global_queue(0, 0), ^{
        [self getImage:@"http://t2.hddhhn.com/uploads/tu/201801/9999/c63fb8c291.jpg" Black:^(UIImage *image) {
            [arr addObject:image];
        }];
//        NSLog(@"2");
//    });
//
//    dispatch_group_async(group, dispatch_get_global_queue(0, 0), ^{
        [self getImage:@"http://t2.hddhhn.com/uploads/tu/201707/571/106.jpg" Black:^(UIImage *image) {
            [arr addObject:image];
        }];
//        NSLog(@"3");
//    });
//
//    dispatch_group_async(group, dispatch_get_global_queue(0, 0), ^{
        [self getImage:@"http://t2.hddhhn.com/uploads/tu/201801/9999/04fd84a337.jpg" Black:^(UIImage *image) {
            [arr addObject:image];
        }];
//        NSLog(@"4");
//    });
    
    dispatch_group_notify(group, dispatch_get_global_queue(0, 0), ^{
        NSLog(@"arr5: %@",arr);
        dispatch_async(dispatch_get_main_queue(), ^{
            self.imageview1.image = arr[0];
            self.imageview2.image = arr[1];
            self.imageview3.image = arr[2];
            self.imageview4.image = arr[3];
            
            NSLog(@"size one : %@   size two : %@",NSStringFromCGSize(self.imageview1.image.size),NSStringFromCGSize([arr[0] size]));
        });
    });
}


-(void)getImage:(NSString *)urlString Black:(void (^)(UIImage *image))imageBlack
{
    dispatch_group_enter(group);
    __block typeof(group)groupSelf = group;
    dispatch_async(dispatch_get_global_queue(0,0), ^{
        NSURL *url = [NSURL URLWithString:urlString];
        NSData *data = [NSData dataWithContentsOfURL:url];
        UIImage *image = [UIImage imageWithData:data];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            if(imageBlack) {
                imageBlack(image);
                dispatch_group_leave(groupSelf);
            }
        });
    });
    
    
}





-(UIImageView *)imageview1
{
    if (!_imageview1) {
        _imageview1 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 150, 200)];
    }
    return _imageview1;
}


-(UIImageView *)imageview2
{
    if (!_imageview2) {
        _imageview2 = [[UIImageView alloc]initWithFrame:CGRectMake(160, 0, 150, 200)];
    }
    return _imageview2;
}

-(UIImageView *)imageview3
{
    if (!_imageview3) {
        _imageview3 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 210, 150, 200)];
    }
    return _imageview3;
}

-(UIImageView *)imageview4
{
    if (!_imageview4) {
        _imageview4 = [[UIImageView alloc]initWithFrame:CGRectMake(160, 210, 150, 200)];
    }
    return _imageview4;
}

@end
