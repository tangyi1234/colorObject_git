//
//  TYDrawingPixelsView.m
//  color_Object
//
//  Created by 汤义 on 2018/6/19.
//  Copyright © 2018年 汤义. All rights reserved.
//

#import "TYDrawingPixelsView.h"

@implementation TYDrawingPixelsView
+ (instancetype)addDrawingPixelsView {
    return [[TYDrawingPixelsView alloc] initWithFrame:CGRectMake(0, h - 200, w, 100)];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
//    UIColor *color = [UIColor redColor];
//    [color set]; //设置线条颜色
//
//    UIBezierPath *path = [UIBezierPath bezierPath];
//    [path moveToPoint:CGPointMake(10, 10)];
//    [path addLineToPoint:CGPointMake(200, 80)];
//
//    path.lineWidth = 5.0;
//    path.lineCapStyle = kCGLineCapRound; //线条拐角
//    path.lineJoinStyle = kCGLineJoinRound; //终点处理
//
//    [path stroke];
    
//    //1.获取上下文
//    CGContextRef ctx=UIGraphicsGetCurrentContext();
//    //2.绘制图形
//    CGContextAddEllipseInRect(ctx, CGRectMake(50, 50, 100, 100));
//    //设置属性（颜色）
//    //    [[UIColor yellowColor]set];
//    CGContextSetRGBFillColor(ctx, 0, 0, 1, 1);
//
//    //3.渲染
//    CGContextFillPath(ctx);
//    //在执行渲染操作的时候，本质上它的内部相当于调用了下面的方法
//    [self.layer drawInContext:ctx];
    
    CGContextRef context = UIGraphicsGetCurrentContext();//获得当前view的图形上下文(context)
    CGContextSetLineWidth(context, 1.0);//制定了线的宽度
    
    
    //创建颜色有两种方法，一种很简单，一种可以精细的选择颜色
    
    //（1）
    
    CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB();
    CGFloat components[] = {0.0,0.0,1.0,1.0};//颜色元素
    CGColorRef color = CGColorCreate(colorspace, components);//这两行创建颜色
    CGContextSetStrokeColorWithColor(context, color);//使用刚才创建好的颜色为上下文设置颜色
    //这样创建颜色需要注意的是在使用完毕之后需要释放颜色空间
    CGColorSpaceRelease(colorspace);
    CGColorRelease(color);
    //(2)
    CGContextSetStrokeColorWithColor(context, [UIColor blueColor].CGColor);//也是创建颜色,一句话即可
    //创建一条线段
    CGContextMoveToPoint(context, 0, 0);//设置线段起始
    CGContextAddLineToPoint(context, 300, 300);//设置线段终点
    
    //绘制图形
    CGContextStrokePath(context);//绘制
    //***********注意：如果用第一种方法创建颜色的要把释放颜色空间的两句代码写在这里。

}


@end
