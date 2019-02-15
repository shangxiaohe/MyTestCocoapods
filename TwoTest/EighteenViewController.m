//
//  EighteenViewController.m
//  TwoTest
//
//  Created by lixianliang on 2019/1/29.
//  Copyright © 2019年 ren. All rights reserved.
//

#import "EighteenViewController.h"
#import "ObjectView.h"





@interface EighteenViewController ()<ObjectViewDelegate>
{
    CGFloat _x;
    CGFloat _y;
    CGRect _currenRect;
    CGPoint _currenCenter;
    CGPoint _beforePoint;
}

@property (nonatomic, strong)UIView *mainView;
@property (nonatomic, copy)NSDictionary *info;
@property (nonatomic, strong)NSMutableDictionary *postionInfo;
@property (nonatomic, copy) NSArray *centerInfo;

@end

@implementation EighteenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = BACKCOLOR(170, 255, 170);
    [self setUI];

}

- (void)setUI {
    [self.view addSubview:self.mainView];
    
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 100, 50)];
    button.center = CGPointMake(self.view.center.x, self.view.center.y - 200);
    [button setTitle:@"复原" forState:UIControlStateNormal];
    [self.view addSubview:button];
    [button addTarget:self action:@selector(action) forControlEvents:UIControlEventTouchUpInside];
    
    
    [self setObjectUI];
    

}

- (void)action {
    [[self.mainView subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [self setObjectUI];
}

- (void)setObjectUI {
    
    UIView *zeroView = [[UIView alloc]initWithFrame:CGRectMake(self.view.center.x+148, self.view.center.y - 50, 2, 50)];
    zeroView.backgroundColor = BACKCOLOR(170, 255, 170);
    [self.view addSubview:zeroView];
    
    self.postionInfo = [NSMutableDictionary dictionary];
    int i = 0;
    for (NSNumber *number in self.info.allKeys) {
        NSArray *array = [self.info objectForKey:number];
        ObjectView *objectOne = [[ObjectView alloc]initWithFrame:[array[0] CGRectValue] Type:[array[3] integerValue] Color:array[1] Controller:self];
        objectOne.center = [array[2] CGPointValue];
        objectOne.mark = number.integerValue;
        [self.mainView addSubview:objectOne];
        [self.postionInfo setObject:[NSValue valueWithCGRect:objectOne.frame] forKey:number];
        i++;
    }
}



#pragma mark ------------ ObjectViewDelegate  -------
-(void)ObjectView:(ObjectView *)object Gesture:(UIPanGestureRecognizer *)pan {
    
    CGPoint point = [pan translationInView:self.mainView];
    NSLog(@"[point]:%@",NSStringFromCGPoint(point));
    
    
    if (pan.state == UIGestureRecognizerStateBegan) {
        _currenRect = object.frame;
        _currenCenter = object.center;
        _beforePoint = [pan locationInView:object];
        NSArray *array;
        if (object.type == ObjectViewTypeHorizontal) {
            array = [self horizontal:object.mark];
            
        } else {
            array = [self vertical:object.mark];
        }
        
        _x = [array[0] floatValue];
        _y = [array[1] floatValue];
        _x = (_x == 0 ? 2 : _x + 2);
        _y = (_y == 0 ? 300 - 2 : _y - 2);
        
    } else if (pan.state == UIGestureRecognizerStateChanged) {
        
        if (object.type == ObjectViewTypeHorizontal) {
            
            if (object.frame.origin.x + point.x <= _x) {
                object.center = CGPointMake(_x + object.frame.size.width/2, object.center.y);
            } else if (object.frame.origin.x + object.frame.size.width + point.x >= (_y == 0 ? 300 - 2 : _y - 2)) {
                if ((_y == 298 && object.mark == 4)) {
                    object.center = CGPointMake(object.center.x + point.x, object.center.y);
                } else {
                    object.center = CGPointMake(_y - object.frame.size.width / 2, object.center.y);
                }
                
            } else {
                object.center = CGPointMake(object.center.x + point.x, object.center.y);
            }

        } else {
            
            if (object.frame.origin.y + point.y <= _x) {
                object.center = CGPointMake(object.center.x, _x + object.frame.size.height / 2);
            } else if (object.frame.origin.y + object.frame.size.height + point.y >= (_y == 0 ? 300 - 2 : _y - 2)) {
                object.center = CGPointMake(object.center.x, _y - object.frame.size.height / 2);
            } else {
                object.center = CGPointMake(object.center.x, object.center.y + point.y);
            }
        }
        [pan setTranslation:CGPointMake(0, 0) inView:self.mainView];
        
    } else if (pan.state == UIGestureRecognizerStateEnded) {
        
        [self.postionInfo setObject:[NSValue valueWithCGRect:object.frame] forKey:@(object.mark)];
    }
    
}

//左右
- (NSArray *)horizontal:(NSInteger)mark {
    CGRect rect = [[self.postionInfo objectForKey:@(mark)] CGRectValue];
    [self.postionInfo removeObjectForKey:@(mark)];
    
    CGRect leftRect = CGRectMake(0, 0, 0, 0);
    CGRect rightRect = CGRectMake(0, 0, 0, 0);
    for (NSValue *value in self.postionInfo.allValues) {
        CGRect tempRect = value.CGRectValue;
        
        //在左右移动时有交集
        if (tempRect.origin.y <= rect.origin.y + rect.size.height && tempRect.origin.y + tempRect.size.height >= rect.origin.y) {
            
            if (tempRect.origin.x < rect.origin.x) {
                //左
                if (leftRect.origin.x == 0) {
                    leftRect = tempRect;
                } else {
                    if (leftRect.origin.x < tempRect.origin.x) {
                        leftRect = tempRect;
                    }
                }
            } else {
                //右
                if (rightRect.origin.x == 0) {
                    rightRect = tempRect;
                } else {
                    if (rightRect.origin.x > tempRect.origin.x) {
                        rightRect = tempRect;
                    }
                }
            }
            
            
        }
    }
    
    return @[@(leftRect.origin.x + leftRect.size.width),@(rightRect.origin.x)];
}

//上下
- (NSArray *)vertical:(NSInteger)mark {
    CGRect rect = [[self.postionInfo objectForKey:@(mark)] CGRectValue];
    [self.postionInfo removeObjectForKey:@(mark)];
    
    CGRect upRect = CGRectMake(0, 0, 0, 0);
    CGRect downRect = CGRectMake(0, 0, 0, 0);
    for (NSValue *value in self.postionInfo.allValues) {
        CGRect tempRect = value.CGRectValue;
        
        if (tempRect.origin.x <= rect.origin.x + rect.size.width && tempRect.origin.x + tempRect.size.width >= rect.origin.x) {
            
            if (tempRect.origin.y < rect.origin.y) {
                //上
                if (upRect.origin.y == 0) {
                    upRect = tempRect;
                } else {
                    if (upRect.origin.y < tempRect.origin.y) {
                        upRect = tempRect;
                    }
                }
            } else {
                //下
                if (downRect.origin.y == 0) {
                    downRect = tempRect;
                } else {
                    if (downRect.origin.y > tempRect.origin.y) {
                        downRect = tempRect;
                    }
                }
            }
        }
    }
    
    return @[@(upRect.origin.y + upRect.size.height),@(downRect.origin.y)];
}




- (UIView *)mainView {
    if (!_mainView) {
        _mainView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 300, 300)];
        _mainView.center = self.view.center;
        _mainView.backgroundColor = [UIColor colorWithRed:170/255.0 green:255.0 blue:170/255.0 alpha:1.0];
        _mainView.layer.borderWidth = 2;
        _mainView.clipsToBounds = NO;
        _mainView.layer.borderColor = [UIColor whiteColor].CGColor;
    }
    return _mainView;
}

- (NSDictionary *)info {
    if (!_info) {
        _info = @{
                  @(0):value(FRAMGE(0, 0, 46, 146), BACKCOLOR(5, 78, 180), POINT(25, 75),   ObjectViewTypeVertical),
                  @(1):value(FRAMGE(0, 0, 46, 96),  BACKCOLOR(144, 83, 4), POINT(75, 50),   ObjectViewTypeVertical),
                  @(2):value(FRAMGE(0, 0, 146, 46), BACKCOLOR(5, 78, 180), POINT(175, 25),  ObjectViewTypeHorizontal),
                  @(3):value(FRAMGE(0, 0, 46, 96),  BACKCOLOR(144, 83, 4), POINT(275, 50),  ObjectViewTypeVertical),
                  @(4):value(FRAMGE(0, 0, 96, 46),  BACKCOLOR(209, 84, 80),POINT(100, 125), ObjectViewTypeHorizontal),
                  @(5):value(FRAMGE(0, 0, 46, 96),  BACKCOLOR(144, 83, 4), POINT(175, 100), ObjectViewTypeVertical),
                  @(6):value(FRAMGE(0, 0, 46, 146), BACKCOLOR(5, 78, 180), POINT(225, 125), ObjectViewTypeVertical),
                  @(7):value(FRAMGE(0, 0, 96, 46),  BACKCOLOR(144, 83, 4), POINT(50, 175),  ObjectViewTypeHorizontal),
                  @(8):value(FRAMGE(0, 0, 46, 96),  BACKCOLOR(144, 83, 4), POINT(125, 200), ObjectViewTypeVertical),
                  @(9):value(FRAMGE(0, 0, 96, 46),  BACKCOLOR(144, 83, 4), POINT(200, 225), ObjectViewTypeHorizontal),
                  @(10):value(FRAMGE(0, 0, 96, 46), BACKCOLOR(144, 83, 4), POINT(100, 275), ObjectViewTypeHorizontal),
                  @(11):value(FRAMGE(0, 0, 96, 46), BACKCOLOR(144, 83, 4), POINT(200, 275), ObjectViewTypeHorizontal),
                  };
    }
    return _info;
}


//-(NSArray *)centerInfo {
//    if (!_centerInfo) {
//        _centerInfo = @[@(50.0),@(75.0),@(100.0),@(125),@(150),@(175)];
//    }
//}


@end
