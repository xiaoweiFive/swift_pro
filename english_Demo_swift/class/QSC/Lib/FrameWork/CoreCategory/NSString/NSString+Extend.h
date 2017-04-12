//
//  NSString+Extend.h
//  CoreCategory
//
//  Created by 成林 on 15/4/6.
//  Copyright (c) 2015年 沐汐. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Extend)


/*
 *  时间戳对应的NSDate
 */
@property (nonatomic,strong,readonly) NSDate *date;

- (NSInteger)getAgeWithCardNum:(NSString *)idCardNum; // 根据身份证获取年龄

- (NSTimeInterval)ageForUserCardNum:(NSString *)idCardNum; //白血病保险根据身份证来获取年龄

-  (int)stringConvertToInt:(NSString*)strtemp;   //获取字符串长度（中英文）

+ (NSString *)md5HexDigest:(NSString*)input; //获取字符串MD5

-(NSString *)convertToJsonData:(NSDictionary *)dict;




@end
