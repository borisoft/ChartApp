//
//  Colunm.m
//  ChartApp
//
//  Created by alex on 13.07.16.
//  Copyright © 2016 alex. All rights reserved.
//

#import "Colunm.h"

@implementation Colunm

- (void)commonInit
{
    // do any initialization that's common to both -initWithFrame:
    // and -initWithCoder: in this method
}

- (id)initWithFrame:(CGRect)aRect
{
    if ((self = [super initWithFrame:aRect])) {
        [self commonInit];
    }
    return self;
}

- (id)initWithCoder:(NSCoder*)coder
{
    if ((self = [super initWithCoder:coder])) {
        [self commonInit];
    }
    return self;
}
@end
