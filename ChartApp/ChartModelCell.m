//
//  ChartModelCell.m
//  ChartApp
//
//  Created by alex on 14.07.16.
//  Copyright © 2016 alex. All rights reserved.
//

#import "ChartModelCell.h"

@implementation ChartModelCell


-(instancetype)init{
    self = [super init];
    if(self){
    }
    return  self;
}
-(void)createCell:(int)from :(int)toNumber :(int)indexCell :(float)widthCell{
   self.randNumber =  arc4random_uniform(toNumber)+ from;
    self.index = indexCell;
    self.widthCell = widthCell;
}
@end
