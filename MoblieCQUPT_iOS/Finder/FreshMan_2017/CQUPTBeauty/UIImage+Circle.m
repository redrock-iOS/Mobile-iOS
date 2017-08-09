//
//  UIImage+Circle.m
//  MoblieCQUPT_iOS
//
//  Created by xiaogou134 on 2017/8/8.
//  Copyright © 2017年 Orange-W. All rights reserved.
//

#import "UIImage+Circle.h"

@implementation UIImage (Cicle)
- (UIImage *)drawACircle{
    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0.0);
    CGContextRef cg = UIGraphicsGetCurrentContext();
    CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
    CGContextAddEllipseInRect(cg, rect);
    CGContextClip(cg);
    [self drawInRect:rect];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}
+ (UIImage *)cutCircleImage:(NSString *)imageName
{
    return [[self imageNamed:imageName] drawACircle];
}

@end
