//
//  FYLoginViewController.m
//  QingSongGo
//
//  Created by 方进 on 2017/9/22.
//  Copyright © 2017年 方进. All rights reserved.
//

#import "FYLoginViewController.h"
#import "AFNetworking.h"
#import "AFHTTPSessionManager.h"

@interface FYLoginViewController ()<UITextFieldDelegate>

@property (strong, nonatomic)UITextField *userNameTextField;
@property (strong, nonatomic)UITextField *passwordTextField;
@property (strong, nonatomic)UIButton *buttonLogin;
@end

@implementation FYLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self.view setBackgroundColor:[UIColor colorWithRed:224.0/255.0 green:224.0/255.0 blue:224.0/255.0 alpha:1]];
    self.title = @"登录";
    [self.navigationController setNavigationBarHidden:NO animated:NO];
    [self setNavButton];
    [self setView];
}

- (void)setNavButton{
    UIBarButtonItem *leftItem = [UIBarButtonItem itemWithImageName:@"iconfont-fanhui.png" highImageName:nil target:self action:@selector(backAction:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = leftItem;
}
- (void)backAction:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)setView{
    _userNameTextField=[[UITextField alloc]initWithFrame:CGRectMake(50, 200, ScreenWidth-90, 44)];
    _userNameTextField.delegate=self;
    _userNameTextField.layer.cornerRadius = 5;
    _userNameTextField.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _userNameTextField.layer.borderWidth = 0.7;
    _userNameTextField.placeholder = @"请输入手机号码";
    _userNameTextField.keyboardType = UIKeyboardTypeNumberPad;
    _userNameTextField.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 44, 44)];
    _userNameTextField.leftViewMode = UITextFieldViewModeAlways;
    UIImageView *userimg=[[UIImageView alloc]initWithFrame:CGRectMake(11, 11, 22, 22)];
    userimg.image=[UIImage imageNamed:@"user"];
    [_userNameTextField.leftView addSubview:userimg];
    [self.view addSubview:_userNameTextField];
    
    
    
    _passwordTextField = [[UITextField alloc] initWithFrame:CGRectMake(50, _userNameTextField.frame.size.height+_userNameTextField.frame.origin.y+10,ScreenWidth-90, 44)];
    _passwordTextField.delegate = self;
    _passwordTextField.layer.cornerRadius = 5;
    _passwordTextField.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    _passwordTextField.layer.borderWidth = 0.5;
    _passwordTextField.secureTextEntry = YES;
    _passwordTextField.placeholder = @"请输入密码";
    _passwordTextField.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
    _passwordTextField.leftViewMode = UITextFieldViewModeAlways;
    UIImageView* pssimag = [[UIImageView alloc] initWithFrame:CGRectMake(11, 11, 22, 22)];
    pssimag.image = [UIImage imageNamed:@"password"];
    [_passwordTextField.leftView addSubview:pssimag];
    [self.view addSubview:_passwordTextField];
    _buttonLogin = [[UIButton alloc] initWithFrame:CGRectMake(40, _passwordTextField.frame.origin.y+_passwordTextField.frame.size.height+20, ScreenWidth-80, 40)];
//    [_buttonLogin setBackgroundImage:[UIImage imageNamed:@"login_button.png"] forState:UIControlStateNormal];
    _buttonLogin.backgroundColor = [UIColor redColor];
//    _buttonLogin.enabled = NO;
    _buttonLogin.layer.cornerRadius = 6;
    _buttonLogin.layer.masksToBounds = YES;
    [_buttonLogin setTitle:@"登录" forState:UIControlStateNormal];
    [_buttonLogin addTarget:self action:@selector(buttonLoginAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_buttonLogin];    //添加登录按钮
}

- (void)buttonLoginAction:(UIButton*)btn{
    // 将请求参数放在请求的字典里
    NSDictionary *param = @{@"userAccounts":@"18550338187", @"userPassword":@"e10adc3949ba59abbe56e057f20f883e"};

    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager POST:@"http://www.zhimai61.com/MJS/user/userlogin" parameters:param progress:^(NSProgress *_Nonnull uploadProgress){
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if(responseObject){
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
            NSLog(@"%@",dict);
        } else {
            
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
    
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
