//
//  InfoView.h
//  ChartApp
//
//  Created by alex on 22.07.16.
//  Copyright © 2016 alex. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InfoViewModel.h"

@interface InfoView : UIView
@property (weak, nonatomic) IBOutlet UILabel *numberLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UIView *selectView;
@property (strong,nonatomic) InfoViewModel * model;
@end
