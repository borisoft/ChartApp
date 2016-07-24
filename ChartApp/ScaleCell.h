//
//  ScaleCell.h
//  ChartApp
//
//  Created by alex on 24.07.16.
//  Copyright © 2016 alex. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ScaleCellModel.h"

@interface ScaleCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *conteinerView;
@property (weak, nonatomic) IBOutlet UILabel *labelScale;
@property (strong,nonatomic)ScaleCellModel *model;
@end
