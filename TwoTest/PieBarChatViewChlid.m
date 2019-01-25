//
//  PieBarChatViewChlid.m
//  TwoTest
//
//  Created by ren on 2018/6/2.
//  Copyright © 2018年 ren. All rights reserved.
//

#import "PieBarChatViewChlid.h"

@interface PieBarChatViewChlid ()<UIGestureRecognizerDelegate>
{
    NSArray *data;
    double _psace;
    float radius;
    float tapNumber;
    
}
@end
@implementation PieBarChatViewChlid

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
        _psace = 4;
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = CGRectGetHeight(frame) > CGRectGetWidth(frame)?CGRectGetWidth(frame)/2:CGRectGetHeight(frame)/2;
        radius = CGRectGetHeight(frame) > CGRectGetWidth(frame)?CGRectGetWidth(frame)/2:CGRectGetHeight(frame)/2/5*4;
        tapNumber = -1;
        
        data = [[NSArray alloc]init];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(pressed:)];
        tap.delegate = self;
        [self addGestureRecognizer:tap];
        
        UIRotationGestureRecognizer *rotation = [[UIRotationGestureRecognizer alloc]initWithTarget:self action:@selector(rotation:)];
        rotation.delegate = self;
        [self addGestureRecognizer:rotation];
        
        
        
        
        
    }
    return self;
}

-(void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    
    CGPoint point = CGPointMake(CGRectGetMaxX(self.bounds)/2, CGRectGetMaxX(self.bounds)/2);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    [self.backgroundColor setStroke];
    CGContextSetLineWidth(context, 2);
    
    for(int i = 0 ; i < data.count ; i++)
    {
        NSArray *arr = [data objectAtIndex:i];
        [[arr objectAtIndex:2] setFill];
        CGContextMoveToPoint(context, point.x, point.y);
        float radius_test = radius;
        if(tapNumber > [[arr objectAtIndex:0] floatValue] && tapNumber < [[arr objectAtIndex:1] floatValue])
            radius_test += 10;
        CGContextAddArc(context, point.x, point.y, radius_test, [[arr objectAtIndex:0] floatValue] , [[arr objectAtIndex:1] floatValue], 0);
        CGContextClosePath(context);
        CGContextDrawPath(context, kCGPathFillStroke); //绘制路径
    }

}


-(NSArray*)data
{
    NSMutableArray *dataArr = [[NSMutableArray alloc]init];
    double allCount = 0;
    for (info *data in _infos) {
        allCount += data.number;
    }
    
    float star_angle = 0;
    float end_angle = 0;
    
    for(int i = 0 ; i < _infos.count ; i++)
    {
        info *data = [_infos objectAtIndex:i];
        float scle = data.number / allCount;
        end_angle = scle * M_PI * 2 + end_angle;
        
        float height = CGRectGetMaxX(self.bounds)/2 + radius;
        float width = CGRectGetMaxX(self.bounds)/2;
        
        UIColor *color = [UIColor colorWithRed:arc4random()%256 / 255.0 green:arc4random()%256 / 255.0 blue:arc4random()%256 / 255.0 alpha:1.0];
        
        NSArray *arr = @[@(star_angle),@(end_angle),color];
        [dataArr addObject:arr];
        star_angle = end_angle;
        
        
        
    }
    
    return dataArr;
}

-(void)setInfos:(NSArray<info *> *)infos
{
    _infos = infos;
    data = [self data];
    [self setNeedsDisplay];
}

-(void)setBackgroundColor:(UIColor *)backgroundColor
{
    [super setBackgroundColor:backgroundColor];
    [self setNeedsDisplay];
}


-(float)judge:(CGPoint)point Bool:(BOOL)jedge
{
    
    float angle;
    float lenght = sqrt(pow(fabs(point.x - CGRectGetWidth(self.bounds)/2), 2) + pow(fabs(CGRectGetHeight(self.bounds)/2 - point.y), 2));
    if(lenght > radius && jedge == YES)
    {
        angle = -1;
    }
    else
    {
        
        float angle_one = asin(fabs(CGRectGetHeight(self.bounds)/2 - point.y)/lenght);
        if(point.x > CGRectGetWidth(self.bounds)/2 && point.y < CGRectGetHeight(self.bounds)/2)//第一象限
        {
            angle = M_PI*2 - angle_one;
        }
        else if (point.x > CGRectGetWidth(self.bounds)/2 && point.y > CGRectGetHeight(self.bounds)/2)//第二象限
        {
            angle = angle_one;
        }
        else if (point.x < CGRectGetWidth(self.bounds)/2 && point.y > CGRectGetHeight(self.bounds)/2)//第三象限
        {
            angle = M_PI - angle_one;
        }
        else//第四象限
        {
            
            angle = M_PI + angle_one;
        }
    }
    return angle;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    CGPoint point = [touch locationInView:self];
    tapNumber = [self judge:point Bool:YES];

    return YES;
}

-(void)pressed:(UITapGestureRecognizer*)tap
{
    [self setNeedsDisplay];
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




@end
