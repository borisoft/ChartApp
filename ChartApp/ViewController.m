//
//  ViewController.m
//  ChartApp
//
//  Created by alex on 13.07.16.
//  Copyright © 2016 alex. All rights reserved.
//

#import "ViewController.h"
#import "ChartModelCell.h"

static int const koefic = 2;
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollViewChart;
@property (nonatomic) float widthCell;
@property (nonatomic) int countAllCell;
@property (strong,nonatomic) NSNumber * countCollumn;
@property (strong,nonatomic) NSNumber *  maxRandNumber;
@property (strong,nonatomic) NSMutableArray * dataSource;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.widthCell = 20.0f;
    self.countAllCell = 20000;
    self.maxRandNumber = @1000;
    [self.scrollViewChart setContentSize:CGSizeMake(self.widthCell*self.countAllCell, 0)];
    [self.scrollViewChart setShowsHorizontalScrollIndicator:YES];
    [self.scrollViewChart setShowsVerticalScrollIndicator:NO];
    
    [self.scrollViewChart setPagingEnabled:YES];
    
    self.countCollumn =[self countCollumnForScrollView];
    dispatch_async(dispatch_get_main_queue(), ^{
        [self createColumns:@0 :self.maxRandNumber];
        [self configureView];
    });

    
    // Do any additional setup after loading the view, typically from a nib.
}
-(void) createDataSourceArray{
    for( int i = 0 ; i < [self.countCollumn intValue]*koefic;i++){
        ChartModelCell * cell = [[ChartModelCell alloc] init];
        [cell createCell:0 :[self.maxRandNumber intValue] : i : self.widthCell];
        [self.dataSource addObject:cell];
    }
}
-(void) configureView{
    CGRect rect = self.scrollViewChart.frame;
    UIView * view =[[UIView alloc]init];
    
    view.frame =CGRectMake(rect.origin.x,rect.origin.y, rect.size.width*0.2, rect.size.height);
    UITextView * label = [[UITextView alloc]init];
    label.text = @"rere";
    label.textColor = [UIColor redColor];
    view.backgroundColor = [UIColor grayColor];
    
    view.alpha = 0.05;
    [view addSubview:label];
    UIView * line1 = [[UIView alloc]initWithFrame:CGRectMake(rect.origin.x,rect.size.height-300, 400000, 1)];
    line1.backgroundColor =[UIColor blackColor];
    [self.scrollViewChart.superview addSubview:line1];

    [self.scrollViewChart.superview addSubview:view];
   
}
-(UIView *)createColumnView:(NSUInteger ) rand :(CGRect) rect :(int) index{
    UIView * mainView = [[UIView alloc]init];
    mainView.frame =rect;
    UIView *tempView = [[UIView alloc]init];
    float heigthColumn = [[NSNumber numberWithUnsignedInteger:rand ]floatValue]/5;
    
    tempView.frame = CGRectMake(20*index,rect.size.height-100-heigthColumn, 20, heigthColumn);
    tempView.backgroundColor = [UIColor lightGrayColor];
    tempView.alpha = 0.4;
    [mainView addSubview:tempView];
    UIView *lineView =[[UIView alloc]init];
    lineView.frame = CGRectMake(20*index,rect.size.height-100-heigthColumn, 20, 1);
    lineView.backgroundColor = [UIColor blackColor];
    //[mainView addSubview:lineView];
    return mainView;
}
-(void)createColumns:(NSNumber *)from :(NSNumber *)to{
    CGRect rect = self.scrollViewChart.frame;
    for( int  i = 0 ; i < 20000;i++){
        NSUInteger r = arc4random_uniform(1000);
        [self.scrollViewChart addSubview:[self createColumnView:r :rect :i]];
    }
    
}
-(NSNumber *)countCollumnForScrollView{
    return [NSNumber numberWithInt: self.view.frame.size.width/self.widthCell];
   }
-(NSNumber *) singleValueForTheColumn{
    return [NSNumber numberWithInt: self.view.frame.size.height-100/[self.maxRandNumber intValue]];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    [scrollView setContentOffset: CGPointMake(20, scrollView.contentOffset.y*20)];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
