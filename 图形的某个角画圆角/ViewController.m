//
//  ViewController.m
//  图形的某个角画圆角
//
//  Created by 瓜木 on 16/2/18.
//  Copyright © 2016年 黄飞. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

/**
 
    使用UIBezierPath贝塞尔曲线方法进行某几个角画圆角
 
 */



- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.view.backgroundColor = [UIColor lightGrayColor];
    
    UIView *view1=[[UIView alloc]initWithFrame:CGRectMake(80, 100, 100, 100)];
    view1.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:view1];
    
    /**   指定的位置的圆角
     
     UIRectCornerTopLeft     = 1 << 0,
     UIRectCornerTopRight    = 1 << 1,
     UIRectCornerBottomLeft  = 1 << 2,
     UIRectCornerBottomRight = 1 << 3,
     UIRectCornerAllCorners  = ~0UL
     
     */
    
    
    UIBezierPath *maskPath=[UIBezierPath bezierPathWithRoundedRect:CGRectMake(2, 2, view1.frame.size.width-4, view1.frame.size.height-4) byRoundingCorners:UIRectCornerTopLeft|UIRectCornerTopRight cornerRadii:CGSizeMake(10, 10)];
    [maskPath setLineWidth:2];
    
    CAShapeLayer *maskLayer=[CAShapeLayer layer];
    maskLayer.frame=view1.bounds;
    maskLayer.strokeColor=[UIColor greenColor].CGColor;
    maskLayer.fillColor=[UIColor clearColor].CGColor;
    maskLayer.lineWidth=2;
    
    maskLayer.path=maskPath.CGPath;
    
    
    //下面的两种添加子layer很关键  view1.layer.mask = maskLayer 这种形式的不行
//    [view1.layer insertSublayer:maskLayer atIndex:0];
    [view1.layer addSublayer:maskLayer];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
