//
//  ObjectView.m
//  TwoTest
//
//  Created by lixianliang on 2019/1/29.
//  Copyright © 2019年 ren. All rights reserved.
//

#import "ObjectView.h"

@interface ObjectView ()

@property (nonatomic , weak) UIViewController *controller;

@end

@implementation ObjectView

-(instancetype)initWithFrame:(CGRect)frame Type:(ObjectViewType)type Color:(UIColor *)color Controller:(UIViewController *)controller{
    if (self = [super initWithFrame:frame]) {
        self.type = type;
        self.backgroundColor = color;
        self.delegate = controller;
        [self doSomething];
    }
    return self;
}

- (void)doSomething {
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(action:)];
    [self addGestureRecognizer:pan];
}

- (void)action:(UIPanGestureRecognizer *)pan {
    if ([self.delegate respondsToSelector:@selector(ObjectView:Gesture:)]) {
        [self.delegate ObjectView:self Gesture:pan];
    }
}

@end
