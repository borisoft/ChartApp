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


@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *bottomView;
@property (weak, nonatomic) IBOutlet UILabel *numberLabel;
@property (strong,nonatomic) NSMutableArray *columnModels;
@end

@implementation ViewController

- (void)viewDidLoad {
     [super viewDidLoad];
//     UIView * topView = [[[NSBundle mainBundle] loadNibNamed:@"InfoView" owner:self options:nil] objectAtIndex:0];
//     topView.frame = self.topInfoView.bounds;
//     [self.topInfoView addSubview:topView];
    
    [self configureCollectionView];
    
    
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)configureCollectionView{
    CGRect rect = self.bottomView.bounds;
    
    self.columnModels = [[NSMutableArray alloc]init];
        for( int  i  = 0 ; i < 5000; i++){
            NSNumber *height = [NSNumber numberWithUnsignedInteger:arc4random_uniform(50000)];
        ColumnModel * model = [ColumnModel modelWitchMaxValue: 50000  Rect:rect height:height];
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
    selectedView.frame = CGRectMake(frame.size.width/2- 10, 0, 20, frame.size.height);
    selectedView.backgroundColor= [UIColor lightGrayColor];
    selectedView.alpha = 0.2f;
    [self.bottomView addSubview:selectedView];
    
  //  [self updateModel];
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

-(void)updateModel{
    int maxValue =[self searchMaxVisibleItems];
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
-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
   // [self updateModel];
}
-(void)collectionView:(UICollectionView *)collectionView {
    [self updateModel];

}
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    [self updateModel];
}
-(void)scrollViewDidEndScroll:(UIScrollView *)scrollView{
    [self updateModel];
}
#pragma UICollectionViewFlowLayout

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    CGRect rect = self.bottomView.bounds;

    return CGSizeMake(20, rect.size.height);
}


@end
