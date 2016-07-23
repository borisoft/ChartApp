//
//  InfoView.m
//  ChartApp
//
//  Created by alex on 22.07.16.
//  Copyright © 2016 alex. All rights reserved.
//

#import "InfoView.h"

@implementation InfoView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    self.numberLabel.text = [self.model.valueNumberLabel stringValue];
    
}

@end
