//
//  NSString+Extension.m
//
//
//  Created by administrator on 15-1-30.
//  Copyright (c) 2015年 Cjs. All rights reserved.
//+------------------------------------------------------------
// 工具类，用来获得处理后的文字高度和宽度(size)
//+------------------------------------------------------------
// 主要接口
//+------------------------------------------------------------

#import "NSString+Extension.h"

@implementation NSString (Extension)
/**
 *  得到 字体 size
 */
+ (CGSize)sizeWithFont:(NSInteger)font andChangStr:(NSString *)string
{
    UIFont *fonts = [UIFont systemFontOfSize:font];
    
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:fonts,NSFontAttributeName, nil];
    
    CGSize sizes = [string boundingRectWithSize:CGSizeMake(MAXFLOAT, 20) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil].size;
    
    return sizes;
}
- (CGSize) sizeWithFont:(UIFont *)font andMaxSize:(CGSize)maxSize{
    
    NSDictionary *attr = @{NSFontAttributeName : font };
    
    return   [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attr context:nil].size;
}
/**
 *  是否为中文
 */
-(BOOL)isChinese{
    NSString *match=@"(^[\u4e00-\u9fa5]+$)";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF matches %@", match];
    return [predicate evaluateWithObject:self];
}

@end
