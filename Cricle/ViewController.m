//
//  ViewController.m
//  Cricle
//
//  Created by LOVE on 16/8/10.
//  Copyright © 2016年 LOVE. All rights reserved.
//

#import "ViewController.h"
#import "UIImageView+HHExtension.h"
@interface ViewController ()

@end

@implementation ViewController

#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //方式一：对圆角直接进行裁剪（对性能消耗最大）
//    [self  imageView1];
    
    //方式二：使用CAShapeLayer和UIBezierPath设置圆角
//    [self  imageView2];
    
    //方式三：使用贝塞尔曲线UIBezierPath和Core Graphics框架画圆
//    [self  imageView3];
    
    //方式四：对圆角进行封装
    [self  imageView4];
    
    
    

}
#pragma mark - OBJMethods
//1.对圆角直接进行裁剪（对性能消耗最大）
-(void)imageView1{

    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
     imageView.image = [UIImage imageNamed:@"Snip20160726_2.png"];
    //只需要设置layer层的两个属性
    //设置圆角
    imageView.layer.cornerRadius = imageView.frame.size.width / 2;
    //将多余的部分切掉
    imageView.layer.masksToBounds = YES;
    [self.view addSubview:imageView];
}
//2. 使用CAShapeLayer和UIBezierPath设置圆角
-(void)imageView2{
  
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    imageView.image = [UIImage imageNamed:@"Snip20160726_2"];
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:imageView.bounds byRoundingCorners:UIRectCornerAllCorners cornerRadii:imageView.bounds.size];
    
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc]init];
    //设置大小
    maskLayer.frame = imageView.bounds;
    //设置图形样子
    maskLayer.path = maskPath.CGPath;
    imageView.layer.mask = maskLayer;
    [self.view addSubview:imageView];
}
//3. 使用贝塞尔曲线UIBezierPath和Core Graphics框架画圆
-(void)imageView3{
    
    
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
        imageView.image = [UIImage imageNamed:@"Snip20160726_2.png"];
    
        //开始对imageView进行画图
        UIGraphicsBeginImageContextWithOptions(imageView.bounds.size, NO, 1.0);
        //使用贝塞尔曲线画出一个圆形图
        [[UIBezierPath bezierPathWithRoundedRect:imageView.bounds cornerRadius:imageView.frame.size.width] addClip];
        [imageView drawRect:imageView.bounds];
    
        imageView.image = UIGraphicsGetImageFromCurrentImageContext();
        //结束画图
        UIGraphicsEndImageContext();
        [self.view addSubview:imageView];
}
//4. 对圆角进行封装
-(void)imageView4{
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    [imageView setHeader:@"Snip20160726_2"];
    [self.view addSubview:imageView];

}


@end
