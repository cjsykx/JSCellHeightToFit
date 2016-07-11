//
//  AcountToFitCell.m
//  JSCellHeightToFit
//
//  Created by ihefe_Hanrovey on 16/7/12.
//  Copyright © 2016年 cjson. All rights reserved.
//

#import "AcountToFitCell.h"
#import "NSString+Extension.h"

@interface AcountToFitCell ()

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *layoutHeight;
@property (weak, nonatomic) IBOutlet UILabel *countLabel;
@end

@implementation AcountToFitCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setCountStr:(NSString *)countStr{
    
    _countStr = countStr;
    
    CGSize size = [countStr sizeWithFont:_countLabel.font andMaxSize:CGSizeMake(_countLabel.frame.size.width, MAXFLOAT)];
    
    CGFloat labelY = _countLabel.frame.origin.y;
    
    self.frame = CGRectMake(0, 0, self.frame.size.width, size.height + 2 * labelY);
    self.layoutHeight.constant = size.height + 0.1;
    self.countLabel.text = countStr;
}

@end
