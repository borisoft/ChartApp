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
-(void)setModel:(ScaleCellModel *)model{
    _model = model;
    self.hidden = NO;
    [self redraw];
}
-(void)redraw{
    CGRect frame = self.conteinerView.superview.frame;
    float mark = (self.model.height/self.model.maxValue)*(self.model.positionY);
 
    [UIView animateWithDuration:0.8f animations:^{
        
        self.conteinerView.superview.frame = CGRectMake(frame.origin.x, self.model.height-mark-frame.size.height/2, frame.size.width, frame.size.height);
        self.labelScale.text = [NSString stringWithFormat:@" %d  тыс.",self.model.valueLabel];
        
    }completion:^(BOOL finished) {
        
    }];

}
-(void)drawRect:(CGRect)rect{
    [self redraw];
}

@end
