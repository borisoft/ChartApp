//
//  ColumnCell.m
//  ChartApp
//
//  Created by alex on 22.07.16.
//  Copyright © 2016 alex. All rights reserved.
//

#import "ColumnView.h"

@implementation ColumnView

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(void)setModel:(ColumnModel *)model{
    _model = model;
    
}
-(void)redraw{
     float height =(self.model.rect.size.height/self.model.maxValue )*[self.model.height floatValue];
    [UIView animateWithDuration:0.5f animations:^{
        
       
        self.columnView.frame = CGRectMake(self.model.rect.origin.x, self.model.rect.origin.y +(self.model.rect.size.height- height), 20, height);
    }completion:^(BOOL finished) {

    }];

}
-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
      float height =(rect.size.height/self.model.maxValue )*[self.model.height floatValue];
    self.columnView.frame = CGRectMake(rect.origin.x, rect.origin.y +(rect.size.height- height), 20, height);
}


@end
