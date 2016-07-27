//
//  ViewController.m
//  ChartApp
//
//  Created by alex on 13.07.16.
//  Copyright © 2016 alex. All rights reserved.
//

#import "ViewController.h"
#import "ColumnView.h"
#import "InfoView.h"
#import "ColumnModel.h"
#import "ScaleCellModel.h"
#import "ScaleCell.h"

int const  countColumns = 20000;
int const maxValueColumn =100000;
float const  widthCell = 20.0f;
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *bottomView;
@property (weak, nonatomic) IBOutlet UILabel *numberLabel;
@property (strong,nonatomic) NSMutableArray *columnModels;
@property (strong,nonatomic) ScaleCell *hightScale;
@property (strong,nonatomic) ScaleCell *midleScale;
@property (strong,nonatomic) ScaleCell *lowScale;
@property (strong,nonatomic) NSMutableArray *scaleArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configureScale];
    [self configureCollectionView];
    
    
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)configureScale{
    
    self.hightScale =[[[NSBundle mainBundle] loadNibNamed:@"ScaleCell" owner:self options:nil] objectAtIndex:0];
    ScaleCellModel *  model = [ScaleCellModel modelWitchValueLabel:75 height:self.bottomView.frame.size.height positionY:75000 maxValue:maxValueColumn];
    
    self.hightScale.model= model;
    
    [self.bottomView addSubview:self.hightScale];
    
    self.midleScale =[[[NSBundle mainBundle] loadNibNamed:@"ScaleCell" owner:self options:nil] objectAtIndex:0];
    ScaleCellModel* modelMidle = [ScaleCellModel modelWitchValueLabel:50 height:self.bottomView.frame.size.height positionY:50000 maxValue:maxValueColumn];
    
    self.midleScale.model= modelMidle;
    
    [self.bottomView addSubview:self.midleScale];
    
    self.lowScale =[[[NSBundle mainBundle] loadNibNamed:@"ScaleCell" owner:self options:nil] objectAtIndex:0];
     ScaleCellModel* modelLow = [ScaleCellModel modelWitchValueLabel:25 height:self.bottomView.frame.size.height positionY:25000 maxValue:maxValueColumn];
    
    self.lowScale.model= modelLow;
    
    
    [self.bottomView addSubview:self.lowScale];
    self.scaleArray = [[NSMutableArray alloc]init];
    [self.scaleArray addObject:self.lowScale];
    [self.scaleArray addObject:self.midleScale];
    [self.scaleArray addObject:self.hightScale];

}
-(void)configureCollectionView{
    CGRect rect = self.bottomView.bounds;
    
    self.columnModels = [[NSMutableArray alloc]init];
        for( int  i  = 0 ; i < countColumns; i++){
            NSNumber *height = [NSNumber numberWithUnsignedInteger:arc4random_uniform(maxValueColumn)];
        ColumnModel * model = [ColumnModel modelWitchMaxValue: maxValueColumn  Rect:rect height:height];
        [self.columnModels addObject:model];
    }

    UINib * nib = [UINib nibWithNibName:@"ColumnView" bundle:nil];
    [self.collectionView registerNib:nib forCellWithReuseIdentifier:@"ColumnView"];
    self.collectionView.delegate = self;
    self.collectionView.dataSource=self;
    
}



-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    UIView * selectedView = [[UIView alloc]init];
    CGRect frame = self.bottomView.frame;
    selectedView.frame = CGRectMake(frame.size.width/2- widthCell/2, 0,widthCell, frame.size.height);
    selectedView.backgroundColor= [UIColor lightGrayColor];
    selectedView.alpha = 0.2f;
    [self.bottomView addSubview:selectedView];
    NSIndexPath * indexPath = [NSIndexPath indexPathForRow:(self.bottomView.frame.size.width/(2*widthCell)) inSection:0];
    [self scrollToItemIndexPath:indexPath];
    [self updateModel];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(int)searchMaxVisibleItems{
    int max = -1;
    for(ColumnView* column in [self.collectionView visibleCells] ){
        if([column.model.height intValue] > max){
            max =[column.model.height intValue] ;
        }
    }
    
    return  max;
}


-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
        [self.collectionView  scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
    [self scrollToItemIndexPath:indexPath];
    [self updateModel];
}
-(void)scrollToItemIndexPath:(NSIndexPath *)indexPath{
    [self.collectionView  scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
    [self updateModel];
    
    ColumnView * column= (ColumnView *)[self.collectionView cellForItemAtIndexPath:indexPath];
    self.numberLabel.text= [column.model.height stringValue];
}
-(void)updateModel{
    int maxValue =[self searchMaxVisibleItems];
    
    for(ScaleCell *cell in self.scaleArray){
        ScaleCellModel *temp = cell.model;
       
        ScaleCellModel *scaleModel = [ScaleCellModel modelWitchValueLabel:temp.valueLabel height:temp.height positionY:temp.positionY maxValue:maxValue];
        cell.model = scaleModel;
        if(maxValue < temp.positionY ){
            cell.hidden=YES;
        }

        
    }
//    ScaleCellModel *temp = self.hightScale.model;
//    ScaleCellModel *scaleModel = [ScaleCellModel modelWitchValueLabel:temp.valueLabel height:temp.height positionY:temp.positionY maxValue:maxValue];
//    self.hightScale.model = scaleModel;
//    temp = self.midleScale.model;
//    scaleModel = [ScaleCellModel modelWitchValueLabel:temp.valueLabel height:temp.height positionY:temp.positionY maxValue:maxValue];
//    self.midleScale.model = scaleModel;
//    temp = self.lowScale.model;
//    scaleModel = [ScaleCellModel modelWitchValueLabel:temp.valueLabel height:temp.height positionY:temp.positionY maxValue:maxValue];
//    self.lowScale.model = scaleModel;

    for( ColumnView *column in  [self.collectionView visibleCells]){
        ColumnModel * model = [[ColumnModel alloc]initWitchMaxValue:maxValue Rect:self.bottomView.bounds height:column.model.height];
        [column setModel:model];
        [column redraw];
    }
    
       
}

#pragma UICollectionView
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    ColumnView * column =[collectionView dequeueReusableCellWithReuseIdentifier:@"ColumnView" forIndexPath:indexPath];
    column.model =self.columnModels[indexPath.row];
    return  column;
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return  1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return  self.columnModels.count;
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
   
    
    NSLog(@"%@",NSStringFromCGPoint(scrollView.contentOffset));
    int  index = (scrollView.contentOffset.x+(self.bottomView.frame.size.width/2))/widthCell;
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:index inSection:0];
    [self scrollToItemIndexPath:indexPath];
}
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    NSLog(@"%@",NSStringFromCGPoint(scrollView.contentOffset));
    int  index = (scrollView.contentOffset.x+(self.bottomView.frame.size.width/2))/widthCell;
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:index inSection:0];
    [self scrollToItemIndexPath:indexPath];

}


#pragma UICollectionViewFlowLayout

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    CGRect rect = self.bottomView.bounds;

    return CGSizeMake(widthCell, rect.size.height);
}


@end
