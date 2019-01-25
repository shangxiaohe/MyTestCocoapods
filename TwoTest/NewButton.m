//
//  NewButton.m
//  TwoTest
//
//  Created by ren on 2017/1/3.
//  Copyright © 2017年 ren. All rights reserved.
//

#import "NewButton.h"

@implementation NewButton

-(instancetype)init
{
    self = [super init];
    if(self != nil)
    {
        self.bounds = CGRectMake(0, 0, 50, 50);
        _mark = 0;
        self.layer.borderWidth = 1;
    };
    return self;
}


-(void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 3);
    CGPoint points[4];
    //0为空白，1为大红，2为小红，3为灰色左，4为灰色下，5为圆点  20为大红小红，11为圆与小红，12为圆与灰下，13为圆与灰左，14为圆与小红与灰下，15为圆与小红与灰左，16为圆与大红
    if(_mark == 0)
        return;
    else if (_mark == 1)
    {
        CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
        points[0] = CGPointMake((50-30)/2, (50-30)/2);
        points[1] = CGPointMake((50-30)/2, 50 - (50-30)/2);
        points[2] = CGPointMake(50 - (50-30)/2, 50 - (50-30)/2);
        points[3] = CGPointMake(50 - (50-30)/2, (50-30)/2);
        CGContextAddLines(context, points, 4);
        CGContextDrawPath(context, kCGPathStroke);
        
    }
    else if (_mark == 2)
    {
        CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
        points[0] = CGPointMake((50-20)/2, (50-20)/2);
        points[1] = CGPointMake((50-20)/2, 50 - (50-20)/2);
        points[2] = CGPointMake(50 - (50-20)/2, 50 - (50-20)/2);
        points[3] = CGPointMake(50 - (50-20)/2, (50-20)/2);
        CGContextAddLines(context, points, 4);
        CGContextDrawPath(context, kCGPathStroke);
    }
    else if(_mark == 3)
    {
        CGContextSetStrokeColorWithColor(context, [UIColor grayColor].CGColor);
        points[0] = CGPointMake((50-30)/2, (50-30)/2);
        points[3] = CGPointMake((50-30)/2, 50 - (50-30)/2);
        points[2] = CGPointMake(50 - (50-30)/2, 50 - (50-30)/2);
        points[1] = CGPointMake(50 - (50-30)/2, (50-30)/2);
        CGContextAddLines(context, points, 4);
        CGContextDrawPath(context, kCGPathStroke);
    }
    else if(_mark == 4)
    {
        CGContextSetStrokeColorWithColor(context, [UIColor grayColor].CGColor);
        points[1] = CGPointMake((50-30)/2, (50-30)/2);
        points[0] = CGPointMake((50-30)/2, 50 - (50-30)/2);
        points[3] = CGPointMake(50 - (50-30)/2, 50 - (50-30)/2);
        points[2] = CGPointMake(50 - (50-30)/2, (50-30)/2);
        CGContextAddLines(context, points, 4);
        CGContextDrawPath(context, kCGPathStroke);
    }
    else if(_mark == 5)
    {
        CGContextSetStrokeColorWithColor(context, [UIColor blackColor].CGColor);
        CGContextSetLineWidth(context, 8);
        CGContextAddEllipseInRect(context, CGRectMake(20, 20, 10, 10));
        CGContextFillPath(context);
    }
    else if(_mark == 11)
    {
        CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
        points[0] = CGPointMake((50-20)/2, (50-20)/2);
        points[1] = CGPointMake((50-20)/2, 50 - (50-20)/2);
        points[2] = CGPointMake(50 - (50-20)/2, 50 - (50-20)/2);
        points[3] = CGPointMake(50 - (50-20)/2, (50-20)/2);
        CGContextAddLines(context, points, 4);
        CGContextDrawPath(context, kCGPathStroke);
        
        CGContextSetStrokeColorWithColor(context, [UIColor blackColor].CGColor);
        CGContextSetLineWidth(context, 8);
        CGContextAddEllipseInRect(context, CGRectMake(20, 20, 10, 10));
        CGContextFillPath(context);
  
    }
    else if (_mark == 12)
    {
        CGContextSetStrokeColorWithColor(context, [UIColor grayColor].CGColor);
        points[1] = CGPointMake((50-30)/2, (50-30)/2);
        points[0] = CGPointMake((50-30)/2, 50 - (50-30)/2);
        points[3] = CGPointMake(50 - (50-30)/2, 50 - (50-30)/2);
        points[2] = CGPointMake(50 - (50-30)/2, (50-30)/2);
        CGContextAddLines(context, points, 4);
        CGContextDrawPath(context, kCGPathStroke);
        
        CGContextSetStrokeColorWithColor(context, [UIColor blackColor].CGColor);
        CGContextSetLineWidth(context, 8);
        CGContextAddEllipseInRect(context, CGRectMake(20, 20, 10, 10));
        CGContextFillPath(context);
    }
    else if (_mark == 13)
    {
        CGContextSetStrokeColorWithColor(context, [UIColor grayColor].CGColor);
        points[0] = CGPointMake((50-30)/2, (50-30)/2);
        points[3] = CGPointMake((50-30)/2, 50 - (50-30)/2);
        points[2] = CGPointMake(50 - (50-30)/2, 50 - (50-30)/2);
        points[1] = CGPointMake(50 - (50-30)/2, (50-30)/2);
        CGContextAddLines(context, points, 4);
        CGContextDrawPath(context, kCGPathStroke);
        
        CGContextSetStrokeColorWithColor(context, [UIColor blackColor].CGColor);
        CGContextSetLineWidth(context, 8);
        CGContextAddEllipseInRect(context, CGRectMake(20, 20, 10, 10));
        CGContextFillPath(context);
    }
    else if (_mark == 15)
    {
        CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
        points[0] = CGPointMake((50-20)/2, (50-20)/2);
        points[1] = CGPointMake((50-20)/2, 50 - (50-20)/2);
        points[2] = CGPointMake(50 - (50-20)/2, 50 - (50-20)/2);
        points[3] = CGPointMake(50 - (50-20)/2, (50-20)/2);
        CGContextAddLines(context, points, 4);
        CGContextDrawPath(context, kCGPathStroke);
        
        CGContextSetStrokeColorWithColor(context, [UIColor grayColor].CGColor);
        points[0] = CGPointMake((50-30)/2, (50-30)/2);
        points[3] = CGPointMake((50-30)/2, 50 - (50-30)/2);
        points[2] = CGPointMake(50 - (50-30)/2, 50 - (50-30)/2);
        points[1] = CGPointMake(50 - (50-30)/2, (50-30)/2);
        CGContextAddLines(context, points, 4);
        CGContextDrawPath(context, kCGPathStroke);
        
        CGContextSetStrokeColorWithColor(context, [UIColor blackColor].CGColor);
        CGContextSetLineWidth(context, 8);
        CGContextAddEllipseInRect(context, CGRectMake(20, 20, 10, 10));
        CGContextFillPath(context);
    }
    
    else if (_mark == 14)
    {
        CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
        points[0] = CGPointMake((50-20)/2, (50-20)/2);
        points[1] = CGPointMake((50-20)/2, 50 - (50-20)/2);
        points[2] = CGPointMake(50 - (50-20)/2, 50 - (50-20)/2);
        points[3] = CGPointMake(50 - (50-20)/2, (50-20)/2);
        CGContextAddLines(context, points, 4);
        CGContextDrawPath(context, kCGPathStroke);
        
        CGContextSetStrokeColorWithColor(context, [UIColor grayColor].CGColor);
        points[1] = CGPointMake((50-30)/2, (50-30)/2);
        points[0] = CGPointMake((50-30)/2, 50 - (50-30)/2);
        points[3] = CGPointMake(50 - (50-30)/2, 50 - (50-30)/2);
        points[2] = CGPointMake(50 - (50-30)/2, (50-30)/2);
        CGContextAddLines(context, points, 4);
        CGContextDrawPath(context, kCGPathStroke);
        
        CGContextSetStrokeColorWithColor(context, [UIColor blackColor].CGColor);
        CGContextSetLineWidth(context, 8);
        CGContextAddEllipseInRect(context, CGRectMake(20, 20, 10, 10));
        CGContextFillPath(context);
    }
    else if (_mark == 16)
    {
        CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
        points[0] = CGPointMake((50-30)/2, (50-30)/2);
        points[1] = CGPointMake((50-30)/2, 50 - (50-30)/2);
        points[2] = CGPointMake(50 - (50-30)/2, 50 - (50-30)/2);
        points[3] = CGPointMake(50 - (50-30)/2, (50-30)/2);
        CGContextAddLines(context, points, 4);
        CGContextDrawPath(context, kCGPathStroke);
        
        CGContextSetStrokeColorWithColor(context, [UIColor blackColor].CGColor);
        CGContextSetLineWidth(context, 8);
        CGContextAddEllipseInRect(context, CGRectMake(20, 20, 10, 10));
        CGContextFillPath(context);
    }
    else
    {
        CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
        points[0] = CGPointMake((50-20)/2, (50-20)/2);
        points[1] = CGPointMake((50-20)/2, 50 - (50-20)/2);
        points[2] = CGPointMake(50 - (50-20)/2, 50 - (50-20)/2);
        points[3] = CGPointMake(50 - (50-20)/2, (50-20)/2);
        CGContextAddLines(context, points, 4);
        CGContextDrawPath(context, kCGPathStroke);
        
        CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
        points[0] = CGPointMake((50-30)/2, (50-30)/2);
        points[1] = CGPointMake((50-30)/2, 50 - (50-30)/2);
        points[2] = CGPointMake(50 - (50-30)/2, 50 - (50-30)/2);
        points[3] = CGPointMake(50 - (50-30)/2, (50-30)/2);
        CGContextAddLines(context, points, 4);
        CGContextDrawPath(context, kCGPathStroke);
        
    }
    
}

@end
