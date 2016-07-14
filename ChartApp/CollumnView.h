//
//  CollumnView.h
//  ChartApp
//
//  Created by alex on 14.07.16.
//  Copyright © 2016 alex. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ChartModelCell;

@interface CollumnView : UIView
-(UIView *) drawViewWitchRect: (UIView *)superViewForCurrent :(ChartModelCell *)model;
@end
