//
//  二维码生成.h
//  iOS开发中常用知识点及代码
//
//  Created by apple on 2018/2/27.
//  Copyright © 2018年 apple. All rights reserved.
//

#ifndef ______h
#define ______h

/**
 
 //获取高清二维码
 - (UIImage *)createNonInterpolatedUIImageFormCIImage:(CIImage *)image withSize:(CGFloat) size {
 
 CGRect extent = CGRectIntegral(image.extent);
 CGFloat scale = MIN(size/CGRectGetWidth(extent), size/CGRectGetHeight(extent));
 
 // 1.创建bitmap;
 size_t width = CGRectGetWidth(extent) * scale;
 size_t height = CGRectGetHeight(extent) * scale;
 CGColorSpaceRef cs = CGColorSpaceCreateDeviceGray();
 CGContextRef bitmapRef = CGBitmapContextCreate(nil, width, height, 8, 0, cs, (CGBitmapInfo)kCGImageAlphaNone);
 CIContext *context = [CIContext contextWithOptions:nil];
 CGImageRef bitmapImage = [context createCGImage:image fromRect:extent];
 CGContextSetInterpolationQuality(bitmapRef, kCGInterpolationNone);
 CGContextScaleCTM(bitmapRef, scale, scale);
 CGContextDrawImage(bitmapRef, extent, bitmapImage);
 
 // 2.保存bitmap到图片
 CGImageRef scaledImage = CGBitmapContextCreateImage(bitmapRef);
 CGContextRelease(bitmapRef);
 CGImageRelease(bitmapImage);
 return [UIImage imageWithCGImage:scaledImage];
 }
 
 
 //制作二维码
 - (UIImage *)makeQRCodeWithDataStr:(NSString *)dataStr withWidth:(CGFloat)width{
 // 1. 创建一个二维码滤镜实例(CIFilter)
 CIFilter *filter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
 // 滤镜恢复默认设置
 [filter setDefaults];
 
 // 2. 给滤镜添加数据
 NSString *string = dataStr;
 NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
 // 使用KVC的方式给filter赋值
 [filter setValue:data forKeyPath:@"inputMessage"];
 
 CIImage *imageCI = [filter outputImage];
 
 UIImage *image = [self createNonInterpolatedUIImageFormCIImage:imageCI withSize:width];//[UIImage imageWithCIImage:imageCI]; //
 
 return image;
 
 }
 
 
 
 
 
 
 
 */

#endif /* ______h */
