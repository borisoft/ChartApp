//
//  CollumnView.m
//  ChartApp
//
//  Created by alex on 14.07.16.
//  Copyright © 2016 alex. All rights reserved.
//

#import "CollumnView.h"
#import "ChartModelCell.h"
@interface CollumnView()
@property (strong,nonatomic) UIView * view;
@end
@implementation CollumnView

-(instancetype)init{
    self = [super init];
    if(self){
        self.view =[[UIView alloc]init];
    }
    return  self;
}

-(UIView *) drawViewWitchRect: (UIView *)superViewForCurrent :(ChartModelCell *)model{
    
    float heightCollumn =model.singleValueHeight*[[ NSNumber numberWithUnsignedInteger:model.randNumber ] floatValue];

    self.view.frame = CGRectMake(model.widthCell*model.index,superViewForCurrent.frame.size.height-100-heightCollumn, model.widthCell,heightCollumn);
    self.view.backgroundColor = [UIColor lightGrayColor];
  //  UIView * lineView = [[UIView alloc]init];
    return self.view;
}
@end
