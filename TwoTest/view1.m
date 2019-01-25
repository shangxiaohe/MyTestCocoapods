//
//  view1.m
//  TwoTest
//
//  Created by ren on 2016/12/8.
//  Copyright © 2016年 ren. All rights reserved.
//

#import "view1.h"

@implementation view1


- (id)initWithFrame:(CGRect)frame
{
    self= [super initWithFrame:frame];
    if(self) {
        // Initialization code
    }
    
    return self;
}


-(void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    //设置虚线颜色
    CGContextSetStrokeColorWithColor(currentContext, [UIColor grayColor].CGColor);
    //设置虚线宽度
    CGContextSetLineWidth(currentContext, 1);
    //设置虚线绘制起点
    CGContextMoveToPoint(currentContext, 0, 100);
    //设置虚线绘制终点
    CGContextAddLineToPoint(currentContext, self.frame.origin.x + self.frame.size.width, 100);
    //设置虚线排列的宽度间隔:下面的arr中的数字表示先绘制3个点再绘制1个点
    CGFloat arr[] = {3,1};
    //下面最后一个参数“2”代表排列的个数。
    CGContextSetLineDash(currentContext, 0, arr, 2);
    CGContextDrawPath(currentContext, kCGPathStroke);
}

@end
