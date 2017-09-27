//
//  FYMineViewController.m
//  QingSongGo
//
//  Created by 方进 on 2017/9/27.
//  Copyright © 2017年 方进. All rights reserved.
//

#import "FYMineViewController.h"
#import "FYMyHeadTableViewCell.h"
#import "FYLoginViewController.h"
#import "FYBaseNavController.h"
#import "FYEditMyinfoViewController.h"

@interface FYMineViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)FYUserAccount *userInfo;

@end

static NSString * const FirReuseIdentifier = @"headCell";
static NSString * const ReuseIdentifier = @"detailCell";

@implementation FYMineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:bgColor];
//    _userInfo = [[FYUserAccount alloc]init];
    [self setBaseView];

    //接受通知
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(receiveNotificationForLogin:) name:@"FYLoginViewController" object:nil];

}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
}

- (void)setBaseView{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, -44, ScreenWidth, ScreenHeight) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
//    _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    _tableView.showsVerticalScrollIndicator = NO;
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:ReuseIdentifier];
    [_tableView registerClass:[FYMyHeadTableViewCell class] forCellReuseIdentifier:FirReuseIdentifier];
    if ([[NSUserDefaults standardUserDefaults]objectForKey:@"userInfo"] != NULL) {
        NSData *data = [[NSUserDefaults standardUserDefaults] objectForKey:@"userInfo"];
        _userInfo = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    }
}


-(void)receiveNotificationForLogin:(NSNotification *)notification{
    NSData *data = [[NSUserDefaults standardUserDefaults] objectForKey:@"userInfo"];
    _userInfo = [NSKeyedUnarchiver unarchiveObjectWithData:data];
   [_tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:[NSIndexPath indexPathForRow:0 inSection:0], nil] withRowAnimation:UITableViewRowAnimationNone];
}


#pragma mark <UITableViewDataSource>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 9;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        FYMyHeadTableViewCell *headCell = [tableView dequeueReusableCellWithIdentifier:FirReuseIdentifier forIndexPath:indexPath];
        headCell.backgroundColor = headColor;
        headCell.selectionStyle = UITableViewCellSelectionStyleNone;
        [headCell creatUIWithMode:_userInfo];
        return headCell;
    }
    else{
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ReuseIdentifier forIndexPath:indexPath];
        cell.textLabel.text = @"byebye My Love!";
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        return cell;
    }
}

#pragma mark <UITableViewDelegate>

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        if (_userInfo==NULL) {
            FYLoginViewController *loginVC = [[FYLoginViewController alloc]init];
            FYBaseNavController *nav = [[FYBaseNavController alloc]initWithRootViewController:loginVC];
            [self presentViewController:nav animated:YES completion:^{
        
            }];
        }
        else{
            FYEditMyinfoViewController *editVC = [[FYEditMyinfoViewController alloc]init];
            [self.navigationController pushViewController:editVC animated:YES];
        }
       
    }
    

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return 200;
    }
    return 44;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}
@end
