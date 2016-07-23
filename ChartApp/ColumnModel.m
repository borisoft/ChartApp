//
//  ColumnModel.m
//  ChartApp
//
//  Created by alex on 22.07.16.
//  Copyright © 2016 alex. All rights reserved.
//

#import "ColumnModel.h"

@implementation ColumnModel


-(instancetype)initWitchMaxValue:(int)value Rect:(CGRect) rect height:( NSNumber*) height{
    if(self=[super init]){
        self.maxValue = value;
        self.height =height;
        self.rect = rect;
    }
    return  self;
    
}
+(instancetype)modelWitchMaxValue:(int) value Rect:(CGRect) rect height:( NSNumber*) height{
    return [[self alloc]initWitchMaxValue:value Rect:rect height:height];
}

@end
