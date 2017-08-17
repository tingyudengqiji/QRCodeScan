//
//  FYCollectionViewController.m
//  QingSongGo
//
//  Created by 方进 on 2017/8/17.
//  Copyright © 2017年 方进. All rights reserved.
//

#import "FYCollectionViewController.h"

@interface FYCollectionViewController ()<UICollectionViewDelegateFlowLayout>

@end

@implementation FYCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    self.collectionView.backgroundView = nil;
    self.collectionView.backgroundColor = [UIColor clearColor];
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    self.collectionView.collectionViewLayout = flowLayout;
    
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 8;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    cell.backgroundColor = [UIColor redColor];
    UILabel* dataLab = (UILabel*)[cell viewWithTag:10010];
    if(dataLab == nil)
    {
        dataLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, cell.frame.size.width, 44)];
        dataLab.tag = 10010;
        dataLab.textColor = [UIColor colorWithRed:102.0f / 255.0f green:102.0f / 255.0f blue:102.0f / 255.0f alpha:1.0f];
        dataLab.numberOfLines = 0;
        dataLab.backgroundColor = [UIColor clearColor];
        dataLab.font = [UIFont fontWithName:@"GillSans" size:16.0f];
        [dataLab setTextAlignment:NSTextAlignmentCenter];
        [cell addSubview:dataLab];
        
    }
    dataLab.text = @"真烦";
    // Configure the cell
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section

{
    
    UIEdgeInsets top = {0,10,0,10};
    
    return top;
    
}
//设置cell的横向间距
-(CGFloat )collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 10;
}
//设置cell的纵向间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 10;
}

//设置元素大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat width;
    CGFloat hight;
    width = (ScreenWidth-50) / 4 ;
    hight = (ScreenWidth-50) / 4;
 
    return CGSizeMake( width,hight);
}
@end
