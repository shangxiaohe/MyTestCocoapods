//
//  PieBarChartView.m
//  TwoTest
//
//  Created by ren on 2018/6/1.
//  Copyright © 2018年 ren. All rights reserved.
//

#import "PieBarChartView.h"
#import "PieBarChatViewChlid.h"

@interface PieBarChartView ()
{
    float radius;
    float rotation;
    CGPoint point_star;
    float angle_many;
}
@property(strong,nonatomic) PieBarChatViewChlid* pieView;
@end

@implementation PieBarChartView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
        _pieView = [[PieBarChatViewChlid alloc]initWithFrame:CGRectMake(0, 0, CGRectGetWidth(frame), CGRectGetHeight(frame))];
        [self addSubview:_pieView];
        self.backgroundColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1.0];
        
        radius = CGRectGetHeight(frame) > CGRectGetWidth(frame)?CGRectGetWidth(frame)/2:CGRectGetHeight(frame)/2/5*4;
        UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(pan:)];
        [self addGestureRecognizer:pan];
        
    }
    return self;
}


-(void)setInfos:(NSArray<info *> *)infos
{
    _infos = infos;
    _pieView.infos = infos;
}


-(void)setBackgroundColor:(UIColor *)backgroundColor
{
    [super setBackgroundColor:backgroundColor];
    _pieView.backgroundColor = backgroundColor;
}


-(void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    
}

-(void)rotation:(UIRotationGestureRecognizer*)rotation
{
    
    NSLog(@"rotation  :  ---%f---",rotation.rotation);
    UIView *view = rotation.view;
    if (rotation.state == UIGestureRecognizerStateBegan || rotation.state == UIGestureRecognizerStateChanged) {
        view.transform = CGAffineTransformRotate(view.transform, rotation.rotation);
        [rotation setRotation:0];
    }
    
}


-(void)pan:(UIPanGestureRecognizer*)pan
{
    CGPoint point = [pan locationInView:self];
    
    CGPoint point1 = [pan translationInView:self];
    [pan setTranslation:CGPointZero inView:pan.view];
    
    //NSLog(@"---%@----%@---",NSStringFromCGPoint(point),NSStringFromCGPoint(point1));
    
    
    if(pan.state == UIGestureRecognizerStateBegan)
    {
        //NSLog(@"---%@----%@---",NSStringFromCGPoint(point),NSStringFromCGPoint(point1));
        rotation = [_pieView judge:point Bool:NO];
        point_star = point;
        angle_many = 0;
    }
    else if(pan.state == UIGestureRecognizerStateChanged)
    {
        BOOL direction = [self direction:point_star End:point];
        point_star = point;
        float angle = [self rotation:rotation End:[_pieView judge:point Bool:NO] Direction:direction];
        rotation = [_pieView judge:point Bool:NO];
        angle_many += angle;
        CGAffineTransform transform = CGAffineTransformMakeRotation(angle_many);
        _pieView.transform = transform;
        
        NSLog(@"--- angle_many :%f------",angle_many);

    }
    else if (pan.state == UIGestureRecognizerStateEnded)
    {
        NSLog(@"dfghmgfd");
    }
}

-(BOOL)direction:(CGPoint)point_star End:(CGPoint)point_end
{
    BOOL value;
    if(point_star.x >= radius && point_end.x >= radius)
    {
        if(point_end.y > point_star.y)
            value = YES;
        else
            value = NO;
    }
    else if (point_star.x < radius && point_end.x < radius)
    {
        if(point_end.y > point_star.y)
            value = NO;
        else
            value = YES;
    }
    else if (point_star.y < radius && point_end.y < radius)
    {
        if(point_end.x > point_star.x)
            value = YES;
        else
            value = NO;
    }
    else// if (point_star.y > radius && point_end.y > radius)
    {
        if(point_end.x > point_star.x)
            value = NO;
        else
            value = YES;
    }
    
    return value;
}

-(float)rotation:(float)star_angle End:(float)end_angle Direction:(BOOL)direction
{
    float angle;
    NSInteger value_star = [self angle:star_angle];
    NSInteger value_end = [self angle:end_angle];
    
    if(value_star == value_end)
        angle = end_angle - star_angle;
    else if(direction == YES)
    {
        if (value_star == 1)
        {
            angle = (M_PI * 2 - star_angle) + end_angle;
        }
        else
        {
            angle = end_angle - star_angle;
        }
    }
    else
    {
        if(value_star == 2)
        {
            angle = - (M_PI * 2 - star_angle) - end_angle;
        }
        else
        {
            angle = end_angle - star_angle;
        }
    }
    
    return angle;
}

-(NSInteger)angle:(float)angle
{
    NSInteger value;
    if(angle > 3/2*M_PI)
        value = 1;
    else if (angle <= M_PI/2)
        value = 2;
    else if (angle > M_PI/2 && angle <= M_PI)
        value = 3;
    else
        value = 4;
    
    return value;
}


@end
