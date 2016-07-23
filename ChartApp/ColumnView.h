//
//  ColumnCell.h
//  ChartApp
//
//  Created by alex on 22.07.16.
//  Copyright © 2016 alex. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ColumnModel.h"

@interface ColumnView : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIView *columnView;
@property (strong , nonatomic)ColumnModel * model;
-(void)redraw;
@end
