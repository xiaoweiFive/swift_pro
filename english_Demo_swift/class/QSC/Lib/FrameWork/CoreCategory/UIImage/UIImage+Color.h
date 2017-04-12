//
//  UIImage+Color.h
//  qingsongchou
//
//  Created by CaoPing on 11/20/14.
//  Copyright (c) 2014 joysae. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Color)

+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;

+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size opaque:(BOOL)opaque;

@end
