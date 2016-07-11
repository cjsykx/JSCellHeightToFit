//
//  AutoToFitCell.h
//  JSCellHeightToFit
//
//  Created by ihefe_Hanrovey on 16/7/11.
//  Copyright © 2016年 cjson. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AutoToFitCell;

@protocol AutoToFitCellDelegate <NSObject>

- (void)textViewCell:(AutoToFitCell *)cell didChangeText:(NSString *)text;

@end

@interface AutoToFitCell : UITableViewCell

@property (weak, nonatomic) id<AutoToFitCellDelegate> delegate;
@property (weak, nonatomic) IBOutlet UITextView *textView;

@end
