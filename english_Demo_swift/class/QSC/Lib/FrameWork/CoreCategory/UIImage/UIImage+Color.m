//
//  UIImage+Color.m
//  qingsongchou
//
//  Created by CaoPing on 11/20/14.
//  Copyright (c) 2014 joysae. All rights reserved.
//

#import "UIImage+Color.h"

@implementation UIImage (Color)

+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size
{
    CGRect rect = (CGRect){CGPointZero,size};
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, [UIScreen mainScreen].scale);
    [color setFill];
    UIRectFill(rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size opaque:(BOOL)opaque
{
    CGRect rect = (CGRect){CGPointZero,size};
    UIGraphicsBeginImageContextWithOptions(rect.size, opaque, [UIScreen mainScreen].scale);
    [color setFill];
    UIRectFill(rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end
