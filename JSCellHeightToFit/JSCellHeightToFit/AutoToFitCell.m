//
//  AutoToFitCell.m
//  JSCellHeightToFit
//
//  Created by ihefe_Hanrovey on 16/7/11.
//  Copyright © 2016年 cjson. All rights reserved.
//
#import "AutoToFitCell.h"

@interface AutoToFitCell ()<UITextViewDelegate>

@end

@implementation AutoToFitCell

-(void)awakeFromNib{
    self.textView.delegate = self;
}

- (void)textViewDidChange:(UITextView *)textView{
    if ([self.delegate respondsToSelector:@selector(textViewCell:didChangeText:)]) {
        [self.delegate textViewCell:self didChangeText:textView.text];
    }
    
    // 让 table view 重新计算高度
    UITableView *tableView = [self tableView];
    [tableView beginUpdates];
    [tableView endUpdates];
}

- (UITableView *)tableView{
    UIView *tableView = self.superview;
    
    while (![tableView isKindOfClass:[UITableView class]] && tableView) {
        tableView = tableView.superview;
    }
    
    return (UITableView *)tableView;
}

@end
