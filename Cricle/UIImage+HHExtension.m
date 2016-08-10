//
//  UIImage+HHExtension.m
//  百思不得姐
//
//  Created by LOVE on 16/3/29.
//  Copyright © 2016年 LOVE. All rights reserved.
//

#import "UIImage+HHExtension.h"

@implementation UIImage (HHExtension)
-(UIImage *)circleimage{


    //NO代表透明  YES代表四角边上的是黑色的 具体可以自己试下就知道了
    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0.0);
    //获得上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    //添加一个圆
    CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
    CGContextAddEllipseInRect(ctx, rect);
    
    //裁剪
    CGContextClip(ctx);
    
    //将图片画上去
    [self drawInRect:rect];
    //    获取图片

    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return img;
}
@end
