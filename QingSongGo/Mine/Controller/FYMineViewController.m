//
//  FYMineViewController.m
//  轻松购
//
//  Created by 方进 on 2017/8/14.
//  Copyright © 2017年 方进. All rights reserved.
//

#import "FYMineViewController.h"
#import "FYMyHeadTableViewCell.h"

@interface FYMineViewController ()<UITableViewDelegate,UITableViewDataSource,FYHeadCellDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@property (nonatomic, strong) UITableView *myTableView;
@property (nonatomic, strong) UIImagePickerController *imagePickerController;


@end

static NSString * const headReuseIdentifier = @"headReuseIdentifier";
static NSString * const ReuseIdentifier = @"detailCell";

@implementation FYMineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor colorWithRed:224.0/255.0 green:224.0/255.0 blue:224.0/255.0 alpha:1]];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    [self setTableView];
    _imagePickerController = [[UIImagePickerController alloc]init];
    _imagePickerController.delegate = self;
    
}
-(void)setTableView{
    _myTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight) style:UITableViewStylePlain];
    _myTableView.delegate = self;
    _myTableView.dataSource = self;
    [self.view addSubview:_myTableView];
    [_myTableView registerClass:[FYMyHeadTableViewCell class] forCellReuseIdentifier:headReuseIdentifier];
    [_myTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:ReuseIdentifier];

}

#pragma mark <UITableViewDataSource>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    }
    return 9;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        FYMyHeadTableViewCell *headCell = [_myTableView dequeueReusableCellWithIdentifier:headReuseIdentifier forIndexPath:indexPath];
        headCell.backgroundColor = headColor;
        NSDictionary *dic = @{@"name":@"听雨等奇迹",@"info":@"雨迹"};
        headCell.accessoryType = UITableViewCellAccessoryNone;
        headCell.selectionStyle = UITableViewCellSelectionStyleNone;
        headCell.delegate = self;
        [headCell creatUIWithMode:dic ];
        
        return headCell;
    }
    else{
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ReuseIdentifier forIndexPath:indexPath];
        
        cell.textLabel.text = @"失望";
        cell.textLabel.textColor = [UIColor colorWithRed:41/255.0 green:36/255.0 blue:33/255.0 alpha:0.8];
        cell.textLabel.font = [UIFont boldSystemFontOfSize:17];
        UIView *backView = [[UIView alloc]initWithFrame:cell.frame];
        backView.backgroundColor = [UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:0.8];;
        cell.selectedBackgroundView = backView;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        return cell;
    }
    
    
}


#pragma mark <UITableViewDelegate>

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    NSString *str = [NSString stringWithFormat:@"您点击了tableView%ld",(long)indexPath.item];
//    UIAlertController *alterContr = [UIAlertController alertControllerWithTitle:@"标题" message:str preferredStyle:UIAlertControllerStyleAlert];
//    
//    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
//    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleDefault handler:nil];
//    [alterContr addAction:cancelAction];
//    [alterContr addAction:okAction];
//    [self presentViewController:alterContr animated:YES completion:nil];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 150;
    }
    return 44;
}

-(void)touchHeadImg:(id)sender{
    UIAlertController *pictureCtr = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *camera = [UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction *_Nonnull action){
        _imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
        [self presentViewController:_imagePickerController animated:NO completion:nil];
    }];
    
    UIAlertAction *photo = [UIAlertAction actionWithTitle:@"从相册选择" style:UIAlertActionStyleDefault handler:^(UIAlertAction *_Nonnull action){
        _imagePickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
         [self presentViewController:_imagePickerController animated:NO completion:nil];
    }];
    
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    [pictureCtr addAction:camera];
    [pictureCtr addAction:photo];
    [pictureCtr addAction:cancel];
    [self presentViewController:pictureCtr animated:NO completion:nil];
}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(nullable NSDictionary<NSString *,id> *)editingInfo{
    [picker dismissViewControllerAnimated:YES completion:^{}];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
