//
//  FourteenTableViewCell.m
//  TwoTest
//
//  Created by ren on 2018/2/1.
//  Copyright © 2018年 ren. All rights reserved.
//

#import "FourteenTableViewCell.h"

@implementation FourteenTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)buttonPressed:(UIButton *)sender {
    sender.selected = !sender.selected;
}

@end
