//
//  FYEditMyinfoViewController.m
//  QingSongGo
//
//  Created by 方进 on 2017/8/23.
//  Copyright © 2017年 方进. All rights reserved.
//

#import "FYEditMyinfoViewController.h"
#import "FYInfoHeadTableViewCell.h"
#import "FYEditTableViewCell.h"

@interface FYEditMyinfoViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

static NSString * const ReuseIdentifier = @"detailCell";
static NSString * const headReuseIdentifier = @"headCellID";

@implementation FYEditMyinfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor colorWithRed:224.0/255.0 green:224.0/255.0 blue:224.0/255.0 alpha:1]];
    self.title = @"个人信息";
    [self.navigationController setNavigationBarHidden:NO animated:NO];
    [self setNavButton];
    [self setTableView];
}

- (void)setNavButton{
    UIBarButtonItem *leftItem = [UIBarButtonItem itemWithImageName:@"iconfont-fanhui.png" highImageName:nil target:self action:@selector(backAction:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = leftItem;
}

- (void)backAction:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)setTableView{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];

    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    [_tableView registerClass:[FYEditTableViewCell class] forCellReuseIdentifier:ReuseIdentifier];
    [_tableView registerClass:[FYInfoHeadTableViewCell class] forCellReuseIdentifier:headReuseIdentifier];
}
#pragma mark <UITableViewDataSource>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.row == 0){
        FYInfoHeadTableViewCell *headCell = [_tableView dequeueReusableCellWithIdentifier:headReuseIdentifier forIndexPath:indexPath];
        headCell.backgroundColor = [UIColor colorWithRed:224.0/255.0 green:224.0/255.0 blue:224.0/255.0 alpha:1];
        headCell.selectionStyle = UITableViewCellSelectionStyleNone;
        headCell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
//        headCell.headImg.image = @"
        return headCell;
    }
    else{
        FYEditTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ReuseIdentifier forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        return cell;
    }
    
    
}


#pragma mark <UITableViewDelegate>

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.row ==0){
        return 60;
    }
    else
        return 44;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
