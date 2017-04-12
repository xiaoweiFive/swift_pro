//
//  NSDate+ConvertToString.m
//  qingsongchou
//
//  Created by CaoPing on 15/3/9.
//  Copyright (c) 2015年 qschou. All rights reserved.
//

#import "NSDate+ConvertToString.h"

@implementation NSDate (ConvertToString)

- (NSString *)stringByDateFormat:(NSString *)dateFormat
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:dateFormat];
    return [formatter stringFromDate:self];
}

- (NSString *)stringByInsurance
{
    return [self stringByDateFormat:@"yyyy-MM-dd HH:mm"];//@"yyyy-MM-dd HH:mm:ss zzz"
}

- (NSString *)string
{
    //zzz表示时区，zzz可以删除，这样返回的日期字符将不包含时区信息 +0000。
    return [self stringByDateFormat:@"yyyy-MM-dd HH:mm:ss"];//@"yyyy-MM-dd HH:mm:ss zzz"
}

/*! yyyy/mm/dd 形式*/
- (NSString *)stringBySlashing{
    return [self stringByDateFormat:@"yyyy/MM/dd"];//@"yyyy-MM-dd HH:mm:ss zzz"
}
/*! yyyy-mm-dd 形式*/
- (NSString *)shortStringByLine{
    return [self stringByDateFormat:@"yyyy-MM-dd"];//@"yyyy-MM-dd HH:mm:ss zzz"
}

#pragma mark -

- (NSString *)stringFromNow
{
    NSDate *now = [NSDate date];
    int interval = [now timeIntervalSinceDate:self];
    
    NSString *timeStamp = nil;
    if (interval < 60) {
        //一分钟内显示刚刚
        timeStamp = [NSString stringWithFormat:@"刚刚"];
    }else if(60<=interval && interval<60*60){
        //一分钟以上且一个小时之内的，显示“多少分钟前”，例如“5分钟前”
        timeStamp = [NSString stringWithFormat:@"%i分钟前",interval/60];
    }else if (60*60<=interval && interval<60*60*24*3){
        //1小时以上三天以内的显示“今天/昨天/前天+具体时间”
        NSString *dayStr ;
        int gapDay = interval/(60*60*24) ;
        switch (gapDay) {
            case 0:
            {
                //在24小时内,存在跨天的现象. 判断两个时间是否在同一天内.
                BOOL idSameDay = [NSDate isSameDay:now date2:self];
                if (idSameDay == YES) {
                    dayStr = @"";
//                    dayStr = [NSString stringWithFormat:@"今天"];
                }else{
                    dayStr = [NSString stringWithFormat:@"昨天"];
                }
            }
                break;
            case 1:
                dayStr = [NSString stringWithFormat:@"昨天"];
                break;
            case 2:
                dayStr = [NSString stringWithFormat:@"前天"];
                break;
            default:
                break;
        }
        //    timeStamp = [dayStr stringByAppendingString:[DSUtils smallTimewithTimeStr:timeStrs]];
        timeStamp = [NSString stringWithFormat:@"%@%@",dayStr,[self stringBy24HourClockFormatterInOneDay]];
    }else{
        //前天以后的显示"日期+具体时间",如"2月11日 20:19"
//        timeStamp = [NSString stringWithString:[self stringByChineseCalendarFormatter]];
        timeStamp = [self stringByDateFormat:@"yyyy-MM-dd"];
    }
    return [timeStamp copy];
}

//返回"日期+具体时间",如"2月11日 20:19"
- (NSString *)stringByChineseCalendarFormatter
{
    NSCalendarUnit unitFlags = NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay;
    
    NSDateComponents *nowComponents = [[NSCalendar currentCalendar] components:unitFlags fromDate:[NSDate date]];
    NSDateComponents *timeComponents = [[NSCalendar currentCalendar] components:unitFlags fromDate:self];
    
    if (timeComponents.year != nowComponents.year) {
        return [self stringByDateFormat:@"YY年MM月dd日"];
    }else{
        return [self stringByDateFormat:@"MM月dd日"];//@"MM月dd日 HH:mm:ss"
    }
}

//返回时间所在日期当天的准确时间. (20:19)
- (NSString *)stringBy24HourClockFormatterInOneDay
{
    return [self stringByDateFormat:@" HH:mm:ss"];
}

//判断两个日期是否是同一天
+ (BOOL)isSameDay:(NSDate *)date1 date2:(NSDate *)date2
{
    NSCalendar* calendar = [NSCalendar currentCalendar];
    NSCalendarUnit unitFlags = NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay;
    
    NSDateComponents *comp1 = [calendar components:unitFlags fromDate:date1];
    NSDateComponents *comp2 = [calendar components:unitFlags fromDate:date2];
    return [comp1 day] == [comp2 day] &&
    [comp1 month] == [comp2 month] &&
    [comp1 year] == [comp2 year];
}

@end
