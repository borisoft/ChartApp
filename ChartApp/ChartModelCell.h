//
//  ChartModelCell.h
//  ChartApp
//
//  Created by alex on 14.07.16.
//  Copyright © 2016 alex. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChartModelCell : UIView
@property (nonatomic) int index;
@property ( nonatomic) NSUInteger randNumber;
@property (nonatomic) float widthCell;
-(void)createCell:(int)from :(int) toNumber :(int)indexCell :(float) widthCell;
@end
