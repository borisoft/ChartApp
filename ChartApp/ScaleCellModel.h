//
//  ScaleCellModel.h
//  ChartApp
//
//  Created by alex on 24.07.16.
//  Copyright © 2016 alex. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ScaleCellModel : NSObject
@property  int valueLabel;
@property float height;
@property int maxValue;
@property float positionY;
+(instancetype)modelWitchValueLabel:(int) valueLabel height:(float) height positionY:(float) positionY maxValue:(int)maxValue;
-(instancetype)initWitchValueLabel:(int) valueLabel height:(float) height positionY:(float) positionY maxValue:(int)maxValue;
@end
