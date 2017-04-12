//
//  NSDate+ConvertToString.h
//  qingsongchou
//
//  Created by CaoPing on 15/3/9.
//  Copyright (c) 2015年 qschou. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSDate (ConvertToString)

- (NSString *)stringByDateFormat:(NSString *)dateFormat;
- (NSString *)string;
/*! yyyy/mm/dd 形式*/
- (NSString *)stringByInsurance;

- (NSString *)stringBySlashing;

- (NSString *)stringFromNow;

- (NSString *)shortStringByLine;

@end
