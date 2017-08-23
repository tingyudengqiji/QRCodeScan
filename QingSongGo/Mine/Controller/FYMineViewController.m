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
    _imagePickerController.allowsEditing = YES;
    
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
        headCell.tag = 1000;
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

#pragma mark - 保存图片至沙盒
//- (void) saveImage:(UIImage *)currentImage withName:(NSString *)imageName
//{
//    
//    NSData *imageData = UIImageJPEGRepresentation(currentImage, 0.5);
//    // 获取沙盒目录
//    
//    NSString *fullPath = [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:imageName];
//    
//    // 将图片写入文件
//    
//    [imageData writeToFile:fullPath atomically:NO];
//}

#pragma mark - image picker delegte

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    FYMyHeadTableViewCell *headCell = (FYMyHeadTableViewCell*)[self.view viewWithTag:1000];
//    UIImageView *imgView = (UIImageView *)[headCell.headImg viewWithTag:1000];
//    
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
    // Dispose of any resources that can be recreated.
}


@end
