//
//  ViewController.m
//  ChartApp
//
//  Created by alex on 13.07.16.
//  Copyright © 2016 alex. All rights reserved.
//

#import "ViewController.h"

#import "ChartModelCell.h"
#import "CollumnView.h"

static int const koefic = 2;
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollViewChart;
@property (nonatomic) float widthCell;
@property (nonatomic) int countAllCell;
@property (strong,nonatomic) NSNumber * countCollumn;
@property (strong,nonatomic) NSNumber *  maxRandNumber;
@property (strong,atomic) NSMutableArray * dataSource;
@property (strong, atomic) NSMutableArray * viewsArray;
@property(nonatomic) CGPoint contentOffset;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.scrollViewChart.delegate =self;
    
    self.dataSource = [[NSMutableArray alloc] init];
    self.viewsArray = [[NSMutableArray alloc] init];
    self.widthCell = 20.0f;
    self.countAllCell = 20000;
    self.maxRandNumber = @1000;
    [self.scrollViewChart setContentSize:CGSizeMake(self.widthCell*self.countAllCell, 0)];
    [self.scrollViewChart setShowsHorizontalScrollIndicator:YES];
    [self.scrollViewChart setShowsVerticalScrollIndicator:NO];
    
    [self.scrollViewChart setPagingEnabled:NO];
    
    self.countCollumn =[self countCollumnForScrollView];
    
        [self createDataSourceArray];
        [self createColumns];
         
     //   [self configureView];
  

    
    // Do any additional setup after loading the view, typically from a nib.
}
-(void) createDataSourceArray{
    for( int i = 0 ; i < 20000;i++){
        ChartModelCell * cell = [[ChartModelCell alloc] init];
        [cell createCell:0 :[self.maxRandNumber intValue] : i : self.widthCell :[[self singleValueForTheColumn] floatValue]];
        [self.dataSource addObject:cell];
        
        CollumnView * view = [[CollumnView alloc] init];
        [self.viewsArray addObject:view];
    }
    
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
//    self.contentOffset = scrollView.contentOffset;
//    NSLog(@" %f  == %f size.width  %f", self.contentOffset.x ,self.contentOffset.y , self.scrollViewChart.frame.size.width);
}
-(void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset{
//    self.contentOffset = scrollView.contentOffset;
//    NSLog(@" %f  == %f size.width  %f", self.contentOffset.x ,self.contentOffset.y , self.scrollViewChart.frame.size.width);
}
//-(void) configureView{
//    CGRect rect = self.scrollViewChart.frame;
//    UIView * view =[[UIView alloc]init];
//    
//    view.frame =CGRectMake(rect.origin.x,rect.origin.y, rect.size.width*0.2, rect.size.height);
//    UITextView * label = [[UITextView alloc]init];
//    label.text = @"rere";
//    label.textColor = [UIColor redColor];
//    view.backgroundColor = [UIColor grayColor];
//    
//    view.alpha = 0.05;
//    [view addSubview:label];
//    UIView * line1 = [[UIView alloc]initWithFrame:CGRectMake(rect.origin.x,rect.size.height-300, 400000, 1)];
//    line1.backgroundColor =[UIColor blackColor];
//    [self.scrollViewChart.superview addSubview:line1];
//
//    [self.scrollViewChart.superview addSubview:view];
//   
//}
//-(UIView *)createColumnView:(NSUInteger ) rand :(CGRect) rect :(int) index{
//    UIView * mainView = [[UIView alloc]init];
//    mainView.frame =rect;
//    UIView *tempView = [[UIView alloc]init];
//    float heigthColumn = [[NSNumber numberWithUnsignedInteger:rand ]floatValue]/5;
//    
//    tempView.frame = CGRectMake(20*index,rect.size.height-100-heigthColumn, 20, heigthColumn);
//    tempView.backgroundColor = [UIColor lightGrayColor];
//    tempView.alpha = 0.4;
//    [mainView addSubview:tempView];
//    UIView *lineView =[[UIView alloc]init];
//    lineView.frame = CGRectMake(20*index,rect.size.height-100-heigthColumn, 20, 1);
//    lineView.backgroundColor = [UIColor blackColor];
//    //[mainView addSubview:lineView];
//    return mainView;
//}
-(void)createColumns{

    for( int  i = 0 ; i < [self.countCollumn intValue]*koefic ;i++){
       
        [self.scrollViewChart addSubview:[self.viewsArray[i] drawViewWitchRect:self.scrollViewChart :self.dataSource[i]]];
    }
    
}
-(NSNumber *)countCollumnForScrollView{
    return [NSNumber numberWithInt: self.view.frame.size.width/self.widthCell];
   }
-(NSNumber *) singleValueForTheColumn{
    return [NSNumber numberWithFloat: (self.view.frame.size.height-self.view.frame.size.height*0.2)/[self.maxRandNumber intValue]];
}







-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    self.contentOffset = scrollView.contentOffset;
    NSLog(@" %f  == %f size.width  %f", self.contentOffset.x ,self.contentOffset.y , self.scrollViewChart.frame.size.width);
    
}
//-(void) updateViews{
//    if(self.contentOffset.x > self.scrollViewChart.frame.size.width/2){
//        int  countCollunm= (self.contentOffset.x+self.scrollViewChart.frame.size.width)/self.widthCell;
//        for()
//    }
//}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
