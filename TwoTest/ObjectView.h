//
//  ObjectView.h
//  TwoTest
//
//  Created by lixianliang on 2019/1/29.
//  Copyright © 2019年 ren. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger , ObjectViewType) {
    ObjectViewTypeHorizontal = 0,
    ObjectViewTypeVertical
};

@class ObjectView;
@protocol ObjectViewDelegate <NSObject>

@required
- (void)ObjectView:(ObjectView *)object Gesture:(UIPanGestureRecognizer *)pan;

@end

@interface ObjectView : UIView
@property (nonatomic, weak) id<ObjectViewDelegate> delegate;
@property (nonatomic, assign) ObjectViewType type;
@property (nonatomic, assign) NSInteger mark;
-(instancetype)initWithFrame:(CGRect)frame Type:(ObjectViewType)type Color:(UIColor *)color Controller:(UIViewController *)controller;
@end
