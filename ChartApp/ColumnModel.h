//
//  ColumnModel.h
//  ChartApp
//
//  Created by alex on 22.07.16.
//  Copyright © 2016 alex. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ColumnModel : NSObject
@property (strong,nonatomic) NSNumber *height;
@property int maxValue;
@property CGRect rect;
+(instancetype)modelWitchMaxValue:(int) value Rect:(CGRect) rect height:( NSNumber*) height;
-(instancetype)initWitchMaxValue:(int)value Rect:(CGRect) rect height:( NSNumber*) height;
@end
