//
//  NSString+Extension.h
//  
//
//  Created by administrator on 15-1-30.
//  Copyright (c) 2015年 Cjs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface NSString (Extension)
/**
 *  得到 字体 size
 */
+ (CGSize)sizeWithFont:(NSInteger)font andChangStr:(NSString *)string;
- (CGSize) sizeWithFont : (UIFont *) font andMaxSize :(CGSize) maxSize;

/**
 *  是否为中文
 *
 *  @return yes 是中文
 */
-(BOOL)isChinese;

@end
