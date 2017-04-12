//
//  NSString+Extend.m
//  CoreCategory
//
//  Created by 成林 on 15/4/6.
//  Copyright (c) 2015年 沐汐. All rights reserved.
//

#import "NSString+Extend.h"
#import "NSDate+ConvertToString.h"
#import <CommonCrypto/CommonDigest.h>
@implementation NSString (Extend)


/*
 *  时间戳对应的NSDate
 */
-(NSDate *)date{
    
    NSTimeInterval timeInterval=self.floatValue;
    
    return [NSDate dateWithTimeIntervalSince1970:timeInterval];
}


- (NSInteger)getAgeWithCardNum:(NSString *)idCardNum
{
    // 年份
    int strYear = [[idCardNum substringWithRange:NSMakeRange(6, 4)] intValue];
    // 月份
    int strMonth = [[idCardNum substringWithRange:NSMakeRange(10, 2)] intValue];
    // 日
    int strDay = [[idCardNum substringWithRange:NSMakeRange(12, 2)] intValue];
    
    NSTimeZone *localZone = [NSTimeZone localTimeZone];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    [dateFormatter setTimeStyle:NSDateFormatterNoStyle];
    [dateFormatter setTimeZone:localZone];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *date=[dateFormatter dateFromString:[NSString stringWithFormat:@"%d-%d-%d 12:01:01",
                                                strYear, strMonth, strDay]];
    
    NSLog(@"%@",date);
    
    NSInteger age =  [self ageWithDateOfBirth:date];
    return age;
}


- (NSInteger)ageWithDateOfBirth:(NSDate *)date;
{
    // 出生日期转换 年月日
    NSDateComponents *components1 = [[NSCalendar currentCalendar] components:NSDayCalendarUnit | NSMonthCalendarUnit | NSYearCalendarUnit fromDate:date];
    NSInteger brithDateYear  = [components1 year];
    NSInteger brithDateDay   = [components1 day];
    NSInteger brithDateMonth = [components1 month];
    
    // 获取系统当前 年月日
    NSDateComponents *components2 = [[NSCalendar currentCalendar] components:NSDayCalendarUnit | NSMonthCalendarUnit | NSYearCalendarUnit fromDate:[NSDate date]];
    NSInteger currentDateYear  = [components2 year];
    NSInteger currentDateDay   = [components2 day];
    NSInteger currentDateMonth = [components2 month];
    
    // 计算年龄
    NSInteger iAge = currentDateYear - brithDateYear - 1;
    if ((currentDateMonth > brithDateMonth) || (currentDateMonth == brithDateMonth && currentDateDay >= brithDateDay)) {
        iAge++;
    }
    
    return iAge;
}


-  (int)stringConvertToInt:(NSString*)strtemp
{
    int strlength = 0;
    char* p = (char*)[strtemp cStringUsingEncoding:NSUnicodeStringEncoding];
    for (int i=0 ; i<[strtemp lengthOfBytesUsingEncoding:NSUnicodeStringEncoding] ;i++) {
        if (*p) {
            p++;
            strlength++;
        }
        else {
            p++;
        }
    }
    
    return (strlength+1)/2;
}

+ (NSString *)md5HexDigest:(NSString*)input
{
    const char* str = [input UTF8String];
    unsigned char result[CC_MD2_DIGEST_LENGTH];
    CC_MD5(str, (CC_LONG)strlen(str), result);
    NSMutableString *ret = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH*2];//
    for(int i = 0; i<CC_MD2_DIGEST_LENGTH; i++) {
        [ret appendFormat:@"%02x",result[i]];
    }
    return ret;
}


#pragma mark --- 根据身份证号码来获取年龄
- (NSTimeInterval)ageForUserCardNum:(NSString *)idCardNum
{
    // 年份
    NSInteger strYear = [[idCardNum substringWithRange:NSMakeRange(6, 4)] intValue];
    // 月份
    NSInteger strMonth = [[idCardNum substringWithRange:NSMakeRange(10, 2)] intValue];
    // 日
    NSInteger strDay = [[idCardNum substringWithRange:NSMakeRange(12, 2)] intValue];
    
    NSTimeZone *localZone = [NSTimeZone localTimeZone];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    [dateFormatter setTimeStyle:NSDateFormatterNoStyle];
    [dateFormatter setTimeZone:localZone];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *brithDate=[dateFormatter dateFromString:[NSString stringWithFormat:@"%ld-%ld-%ld 12:01:01",
                                                     (long)strYear, (long)strMonth, (long)strDay]];
    
    
    NSDate *now = [NSDate date];
    NSString * nowStr = [now stringByDateFormat:@"yyyy-MM-dd"];
    NSDate *nowDate = [dateFormatter dateFromString:[NSString stringWithFormat:@"%@ 12:01:01",nowStr]];
    
    NSTimeInterval brithSecends = [brithDate timeIntervalSinceDate:nowDate];
    if (brithSecends < 0) {
        brithSecends = brithSecends * (-1);
    }else {
        brithSecends = brithSecends * (1);
    }
    
    return brithSecends;
}



//字典转json
-(NSString *)convertToJsonData:(NSDictionary *)dict

{
    NSError *error;
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:&error];
    
    NSString *jsonString;
    
    if (!jsonData) {
        
        NSLog(@"%@",error);
        
    }else{
        
        jsonString = [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
        
    }
    
    NSMutableString *mutStr = [NSMutableString stringWithString:jsonString];
    
    NSRange range = {0,jsonString.length};
    
    //去掉字符串中的空格
    
    [mutStr replaceOccurrencesOfString:@" " withString:@"" options:NSLiteralSearch range:range];
    
    NSRange range2 = {0,mutStr.length};
    
    //去掉字符串中的换行符
    
    [mutStr replaceOccurrencesOfString:@"\n" withString:@"" options:NSLiteralSearch range:range2];
    
    return mutStr;
    
}


@end
