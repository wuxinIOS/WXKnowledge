//
//  画虚线圆角.h
//  iOS开发中常用知识点及代码
//
//  Created by apple on 2017/10/25.
//  Copyright © 2017年 apple. All rights reserved.
//

/**  画虚线圆角矩形
 - (void)addBorderToLayer:(UIView *)view withLineColor:(UIColor *)lineColor withLineWidth:(CGFloat)lineWidth
 {
 CAShapeLayer *border = [CAShapeLayer layer];
 //  线条颜色
 border.strokeColor = lineColor.CGColor;
 
 border.fillColor = nil;
 
 border.path = [UIBezierPath bezierPathWithRoundedRect:view.bounds cornerRadius:5].CGPath;
 //[UIBezierPath bezierPathWithRect:view.bounds].CGPath;
 
 border.frame = view.bounds;
 
 // 不要设太大 不然看不出效果
 border.lineWidth = lineWidth;
 
 border.lineCap = @"round";
 
 //  第一个是 线条长度   第二个是间距    nil时为实线
 border.lineDashPattern = @[@1, @2];
 
 [view.layer addSublayer:border];
 }
 
 
 
 
 */
