//
//  FYHomeViewController.m
//  轻松购
//
//  Created by 方进 on 2017/8/14.
//  Copyright © 2017年 方进. All rights reserved.
//

#import "FYHomeViewController.h"
#import "FYScrollView.h"
#import "FYHomeCollectionViewCell.h"


#define ITEM_WIDTH (ScreenWidth-50) / 4
#define ITEM_HIGHT (ScreenWidth-50) / 4

@interface FYHomeViewController ()<UITableViewDelegate,UITableViewDataSource,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>


@property (nonatomic, strong) NSArray *imgaesArray;
@property (nonatomic, strong) NSArray *colArray;
@property (nonatomic, strong) FYScrollView *scrollView;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UICollectionView *collectionView;


@end

@implementation FYHomeViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self.view setBackgroundColor:[UIColor colorWithRed:224.0/255.0 green:224.0/255.0 blue:224.0/255.0 alpha:1]];
    self.view.backgroundColor = [UIColor clearColor];
    _imgaesArray = @[@"page 1", @"page 2", @"page3", @"page 4", @"page 5"];
    _colArray = @[@"天猫",@"聚划算",@"天猫国际",@"口碑外卖",@"天猫超市",@"充值中心",@"阿里旅行",@"领金币"];
    [self setNavButton];
    [self setTableView];
}

-(void)setTableView{
    //其中49是tabbar的高度
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64,ScreenWidth, ScreenHeight-64-49) style:UITableViewStylePlain];

    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"detailCell"];
    _tableView.backgroundColor = [UIColor colorWithRed:224.0/255.0 green:224.0/255.0 blue:224.0/255.0 alpha:1];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
}

-(void)setNavButton{
    UIBarButtonItem *leftItem = [UIBarButtonItem itemWithImageName:@"saoma.png" highImageName:@"" target:self action:@selector(scanButtonAction) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = leftItem;
    
    UIBarButtonItem *rightItem = [UIBarButtonItem itemWithImageName:@"msg.png" highImageName:@"" target:self action:@selector(showMessage:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = rightItem;
}


-(void)setScrollView{
    
    _scrollView = [[FYScrollView alloc]initWithFrame:CGRectMake(0,0, ScreenWidth, 180)];
    [_tableView addSubview:_scrollView];
    self.automaticallyAdjustsScrollViewInsets = NO;//解决ScrollView中的子视图VIew自动下移了64个像素.
    
    NSMutableArray *imgArray = [NSMutableArray new];
    for (int i = 0; i < _imgaesArray.count; i ++) {
        UIImage *img = [UIImage imageNamed:[NSString stringWithFormat:@"%d.jpg",i+1]];
        [imgArray addObject:img];
    }
    [_scrollView setupSubViewPages:imgArray withCallBackBlock:^{
        
    }];
}

-(void)setCollectionView{
     UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, _scrollView.frame.origin.y + _scrollView.frame.size.height, ScreenWidth, ITEM_HIGHT*2+30) collectionViewLayout:flowLayout];
    _collectionView.alpha = 1;
    _collectionView.scrollEnabled = NO;
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.backgroundColor = [UIColor whiteColor];
    [_collectionView registerClass:[FYHomeCollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
     [_tableView addSubview:_collectionView];

}

//扫一扫
-(void)scanButtonAction{
    UIAlertController *alterContr = [UIAlertController alertControllerWithTitle:@"标题" message:@"点击了扫一扫" preferredStyle:UIAlertControllerStyleAlert];

    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleDefault handler:nil];
    [alterContr addAction:cancelAction];
    [alterContr addAction:okAction];
    [self presentViewController:alterContr animated:YES completion:nil];
}

-(void)showMessage:(id)sender{
    
}

#pragma mark <UITableViewDataSource>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0 || section == 1) {
        return 1;
    }
    return 9;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"detailCell" forIndexPath:indexPath];
    if (indexPath.section == 0 ) {
         [self setScrollView];
    }
    else if (indexPath.section == 1){
        [self setCollectionView];
    }
    else{
        cell.textLabel.text = @"失望";
        cell.textLabel.textColor = [UIColor colorWithRed:41/255.0 green:36/255.0 blue:33/255.0 alpha:0.8];
        cell.textLabel.font = [UIFont boldSystemFontOfSize:17];
        UIView *backView = [[UIView alloc]initWithFrame:cell.frame];
        backView.backgroundColor = [UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:0.8];;
        cell.selectedBackgroundView = backView;
  
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
    
}


#pragma mark <UITableViewDelegate>

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *str = [NSString stringWithFormat:@"您点击了tableView%ld",(long)indexPath.item];
    UIAlertController *alterContr = [UIAlertController alertControllerWithTitle:@"标题" message:str preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleDefault handler:nil];
    [alterContr addAction:cancelAction];
    [alterContr addAction:okAction];
    [self presentViewController:alterContr animated:YES completion:nil];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0 || section == 1) {
        return 0;
    }
    else{
        return 40;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return  180;
    }
    else if (indexPath.section == 1)
    {
        return ITEM_HIGHT*2+30;
    }
    else{
        return 44;
    }
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _colArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    FYHomeCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    cell.picView.frame = CGRectMake((ITEM_WIDTH-45)/2, 5, 45, 45);
    cell.labelInfo.frame = CGRectMake(0, cell.picView.frame.origin.y+cell.picView.frame.size.height+5, ITEM_WIDTH, 20);
    cell.labelInfo.text = _colArray[indexPath.row];
    cell.picView.image = [UIImage imageNamed:[NSString stringWithFormat:@"colcell%ld_img",(long)indexPath.row]];
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSString *str = [NSString stringWithFormat:@"您点击了%ld",(long)indexPath.item];
    UIAlertController *alterContr = [UIAlertController alertControllerWithTitle:@"标题" message:str preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleDefault handler:nil];
    [alterContr addAction:cancelAction];
    [alterContr addAction:okAction];
    [self presentViewController:alterContr animated:YES completion:nil];
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section

{
    
    UIEdgeInsets top = {10,10,10,10};
    
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




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
