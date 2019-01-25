//
//  ThirteenViewController.m
//  TwoTest
//
//  Created by ren on 2017/11/27.
//  Copyright © 2017年 ren. All rights reserved.
//

#import "ThirteenViewController.h"
#import <WebKit/WebKit.h>
#import "TZImagePickerController.h"
#import <Photos/Photos.h>
#import "TZImageManager.h"
#import "TZVideoPlayerController.h"
#import "TZPhotoPreviewController.h"
#import "TZGifPhotoPreviewController.h"

@interface ThirteenViewController ()<TZImagePickerControllerDelegate,UICollectionViewDataSource,UICollectionViewDelegate,UIActionSheetDelegate,UIImagePickerControllerDelegate,UIAlertViewDelegate,UINavigationControllerDelegate>
{
    UILabel *label;
}
@end

@implementation ThirteenViewController
- (void)viewDidLoad {
//    self.view.backgroundColor = [UIColor redColor];
//    label = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, 100, 100)];
//    label.backgroundColor = [UIColor greenColor];
//    [self.view addSubview:label];
//
//    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(200, 400, 80, 90)];
//    button.backgroundColor = [UIColor purpleColor];
//    [self.view addSubview:button];
//    [button addTarget:self action:@selector(buttonpressed) forControlEvents:UIControlEventTouchUpInside];
    
//    WKWebView *WkWebView = [[WKWebView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-54)];
//    WkWebView.UIDelegate = self;
//    WkWebView.navigationDelegate = self;
//    [WkWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://61.143.38.10:9035/hcdj/app/index.html"]]];
//    [self.view addSubview:WkWebView];
    
//
//    for(int i = 0 ; i<12; i++)
//    {
//        UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(30*(i%3), 30*(i/3), 50, 50)];
//        [button setTitle:[NSString stringWithFormat:@"%d",i] forState:UIControlStateNormal];
//        [self.view addSubview:button];
//        [button setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
//    }
    
     UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(50,50,50,50)];
    [self.view addSubview:button];
    
    button.backgroundColor = [UIColor greenColor];
    [button addTarget:self action:@selector(buttonPressed) forControlEvents:UIControlEventTouchUpInside];
    
    
}

-(void)buttonPressed
{
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"photoInfo"];
    [self pushTZImagePickerController];
}

#pragma mark - TZImagePickerController

- (void)pushTZImagePickerController {
    TZImagePickerController *imagePickerVc = [[TZImagePickerController alloc] initWithMaxImagesCount:9 columnNumber:1 delegate:self pushPhotoPickerVc:YES];
    // imagePickerVc.navigationBar.translucent = NO;
    
#pragma mark - 五类个性化设置，这些参数都可以不传，此时会走默认设置
    imagePickerVc.isSelectOriginalPhoto = YES;
    
//    if (self.maxCountTF.text.integerValue > 1) {
//        // 1.设置目前已经选中的图片数组
//        imagePickerVc.selectedAssets = [NSMutableArray array]; // 目前已经选中的图片数组
//    }
    imagePickerVc.allowTakePicture = NO; // 在内部显示拍照按钮
    
    // imagePickerVc.photoWidth = 1000;
    
    // 2. Set the appearance
    // 2. 在这里设置imagePickerVc的外观
    // if (iOS7Later) {
    // imagePickerVc.navigationBar.barTintColor = [UIColor greenColor];
    // }
    // imagePickerVc.oKButtonTitleColorDisabled = [UIColor lightGrayColor];
    // imagePickerVc.oKButtonTitleColorNormal = [UIColor greenColor];
    // imagePickerVc.navigationBar.translucent = NO;
    
    // 3. Set allow picking video & photo & originalPhoto or not
    // 3. 设置是否可以选择视频/图片/原图
    imagePickerVc.allowPickingVideo = NO;
    imagePickerVc.allowPickingImage = YES;
    imagePickerVc.allowPickingOriginalPhoto = YES;
    imagePickerVc.allowPickingGif = NO;
//    imagePickerVc.allowPickingMultipleVideo = NO; // 是否可以多选视频
    
    // 4. 照片排列按修改时间升序
    imagePickerVc.sortAscendingByModificationDate = YES;
    
    // imagePickerVc.minImagesCount = 3;
    // imagePickerVc.alwaysEnableDoneBtn = YES;
    
    // imagePickerVc.minPhotoWidthSelectable = 3000;
    // imagePickerVc.minPhotoHeightSelectable = 2000;
    
    /// 5. Single selection mode, valid when maxImagesCount = 1
    /// 5. 单选模式,maxImagesCount为1时才生效
    imagePickerVc.showSelectBtn = NO;
    imagePickerVc.allowCrop = NO;
    imagePickerVc.needCircleCrop = NO;
    // 设置竖屏下的裁剪尺寸
    NSInteger left = 30;
    NSInteger widthHeight = self.view.frame.size.width - 2 * left;
    NSInteger top = (self.view.frame.size.height - widthHeight) / 2;
    imagePickerVc.cropRect = CGRectMake(left, top, widthHeight, widthHeight);
    // 设置横屏下的裁剪尺寸
    // imagePickerVc.cropRectLandscape = CGRectMake((self.view.tz_height - widthHeight) / 2, left, widthHeight, widthHeight);
    /*
     [imagePickerVc setCropViewSettingBlock:^(UIView *cropView) {
     cropView.layer.borderColor = [UIColor redColor].CGColor;
     cropView.layer.borderWidth = 2.0;
     }];*/
    
    //imagePickerVc.allowPreview = NO;
    // 自定义导航栏上的返回按钮
    /*
     [imagePickerVc setNavLeftBarButtonSettingBlock:^(UIButton *leftButton){
     [leftButton setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
     [leftButton setImageEdgeInsets:UIEdgeInsetsMake(0, -10, 0, 20)];
     }];
     imagePickerVc.delegate = self;
     */
    
//    imagePickerVc.isStatusBarDefault = NO;
#pragma mark - 到这里为止
    
    // You can get the photos by block, the same as by delegate.
    // 你可以通过block或者代理，来得到用户选择的照片.
    [imagePickerVc setDidFinishPickingPhotosHandle:^(NSArray<UIImage *> *photos, NSArray *assets, BOOL isSelectOriginalPhoto) {
        
    }];
    
    [self presentViewController:imagePickerVc animated:YES completion:nil];
}

//-(void)buttonpressed
//{
//    [UIView animateWithDuration:1 animations:^{
//        label.frame = CGRectMake(100, 10, 100, 100);
//    }];
//
//    NSDateFormatter  *dateformatter=[[NSDateFormatter alloc] init];
//    dateformatter.dateFormat = @"yyyy-MM-dd HH:mm";
//    NSDate *date = [dateformatter dateFromString:@"1960-1-1 00:00"];
//
//    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
//
//    NSTimeZone *timeZone = [[NSTimeZone alloc] initWithName:@"Asia/Shanghai"];
//
//    [calendar setTimeZone: timeZone];
//
//    NSCalendarUnit calendarUnit = NSCalendarUnitWeekday;
//
//    NSDateComponents *theComponents = [calendar components:calendarUnit fromDate:date];
//
//    NSDate *adate = [date dateByAddingTimeInterval:0];
//    NSString *aa = [dateformatter stringFromDate:adate];
//    NSLog(@"---%ld---",theComponents.weekday);
//
//
//}
@end
