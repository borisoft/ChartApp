//
//  ScaleCellModel.m
//  ChartApp
//
//  Created by alex on 24.07.16.
//  Copyright © 2016 alex. All rights reserved.
//

#import "ScaleCellModel.h"

@implementation ScaleCellModel

-(instancetype)initWitchValueLabel:(int)valueLabel height:(float)height positionY:(float)positionY maxValue:(int)maxValue;{
    if(self=[super init]){
        self.height=height;
        self.positionY = positionY;
        self.valueLabel=valueLabel;
        self.maxValue =maxValue;
    }
    return  self;
}
+(instancetype)modelWitchValueLabel:(int)valueLabel height:(float)height positionY:(float)positionY maxValue:(int)maxValue;{
    return [[self alloc]initWitchValueLabel:valueLabel height:height positionY:positionY maxValue:maxValue];
}
@end
