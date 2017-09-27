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

@interface FYEditMyinfoViewController ()<UITableViewDelegate,UITableViewDataSource,UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIImagePickerController *imagePickerController;

@end

static NSString * const ReuseIdentifier = @"detailCell";
static NSString * const headReuseIdentifier = @"headCellID";

@implementation FYEditMyinfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:bgColor];
    self.title = @"个人信息";
    [self.navigationController setNavigationBarHidden:NO animated:NO];
    [self setNavButton];
    [self setTableView];
    _imagePickerController = [[UIImagePickerController alloc]init];
    _imagePickerController.delegate = self;
    _imagePickerController.allowsEditing = YES;
}

- (void)setNavButton{
    UIBarButtonItem *leftItem = [UIBarButtonItem itemWithImageName:@"iconfont-fanhui.png"  target:self action:@selector(backAction:) forControlEvents:UIControlEventTouchUpInside];
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
        headCell.tag = 1000;
        headCell.selectionStyle = UITableViewCellSelectionStyleNone;
        headCell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
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
    if(indexPath.row == 0){
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
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.row ==0){
        return 70;
    }
    else
        return 44;
}


#pragma mark - image picker delegte

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    FYInfoHeadTableViewCell *headCell = (FYInfoHeadTableViewCell*)[self.view viewWithTag:1000];
    UIImage * originalImage  = info[UIImagePickerControllerOriginalImage];
    UIImage * editedImg = info[UIImagePickerControllerEditedImage];
    NSURL   * mediaUrl  = info[UIImagePickerControllerMediaURL];
    //选中图片进行了裁剪
    if (editedImg) {
        headCell.headImg.image = editedImg;
    }
    else if(originalImage){
        //没有对图片进行裁剪
        headCell.headImg.image = originalImage;
    }
    //如果选中的是视频
    if (mediaUrl) {
        
    }
    [picker dismissViewControllerAnimated:YES completion:^{}];
}

//当用户选取完成后调用；
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissViewControllerAnimated:YES completion:^{}];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
