//
//  ScaleCell.m
//  ChartApp
//
//  Created by alex on 24.07.16.
//  Copyright © 2016 alex. All rights reserved.
//

#import "ScaleCell.h"

@implementation ScaleCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)drawRect:(CGRect)rect{
    self.conteinerView.frame = rect;
    self.labelScale.text = [NSString stringWithFormat:@" %d  тыс.",self.model.value];
}

@end
