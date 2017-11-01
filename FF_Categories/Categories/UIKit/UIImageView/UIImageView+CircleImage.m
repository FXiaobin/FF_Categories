//
//  UIImageView+CircleImage.m
//  CircleImageView
//
//  Created by fanxiaobin on 2017/10/31.
//  Copyright © 2017年 fanxiaobin. All rights reserved.
//

#import "UIImageView+CircleImage.h"

@implementation UIImageView (CircleImage)

-(void)drawCircleImageView{
    //通过贝塞尔曲线生成
    CAShapeLayer *mask = [CAShapeLayer new];
    mask.path = [UIBezierPath bezierPathWithOvalInRect:self.bounds].CGPath;
    self.layer.mask = mask;
    
}

- (void)drawCircleImage:(UIImage *)image {
    CGFloat side = MIN(image.size.width, image.size.height);
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(side, side), false, [UIScreen mainScreen].scale);
    CGContextAddPath(UIGraphicsGetCurrentContext(),
                     [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, side, side)].CGPath);
    CGContextClip(UIGraphicsGetCurrentContext());
    CGFloat marginX = -(image.size.width - side) / 2.f;
    CGFloat marginY = -(image.size.height - side) / 2.f;
    [image drawInRect:CGRectMake(marginX, marginY, image.size.width, image.size.height)];
    CGContextDrawPath(UIGraphicsGetCurrentContext(), kCGPathFillStroke);
    UIImage *output = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    self.image = output;
}

@end
