//
//  FYQRCodeScanViewController.m
//  QingSongGo
//
//  Created by 方进 on 2017/9/27.
//  Copyright © 2017年 方进. All rights reserved.
//

#import "FYQRCodeScanViewController.h"
#import <AVFoundation/AVFoundation.h>

//#define QRCodeWidth  260.0   //正方形二维码的边长

#define TOP (ScreenHeight-220)/2
#define LEFT (ScreenWidth-220)/2

@interface FYQRCodeScanViewController ()<AVCaptureMetadataOutputObjectsDelegate>
{
    NSTimer * timer;
    CAShapeLayer *cropLayer;
    int num;
    BOOL upOrdown;
}
@property (nonatomic, strong)UIImageView *line;
@property (nonatomic, strong)AVCaptureSession *session;
@property (nonatomic, strong)AVCaptureDevice * device;
@property (nonatomic, strong)AVCaptureDeviceInput * input;
@property (nonatomic, strong)AVCaptureMetadataOutput * output;
@property (nonatomic, strong)AVCaptureVideoPreviewLayer * preview;
@end

@implementation FYQRCodeScanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"二维码";
    [self setNavButton];
    [self.view setBackgroundColor:bgColor];
    [self setBaseView];

}

- (void)setNavButton{
    UIBarButtonItem *leftItem = [UIBarButtonItem itemWithImageName:@"iconfont-fanhui.png"  target:self action:@selector(backAction:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = leftItem;
}

- (void)backAction:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)viewWillAppear:(BOOL)animated{
    
    [self setCropRect:CGRectMake(LEFT, TOP, 220, 220)];
    
    [self performSelector:@selector(setupCamera) withObject:nil afterDelay:0.3];
    
}

- (void)setBaseView{
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(LEFT, TOP, 220, 220)];
    imageView.image = [UIImage imageNamed:@"pick_bg"];
    [self.view addSubview:imageView];
    
    upOrdown = NO;
    num = 0;
    _line = [[UIImageView alloc]initWithFrame:CGRectMake(LEFT, TOP + 10, 220, 2)];
    _line.image = [UIImage imageNamed:@"line.png"];
    [self.view addSubview:_line];
    
    timer = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(animation1) userInfo:nil repeats:YES];
}
- (void)setCropRect:(CGRect)cropRect{
    cropLayer = [[CAShapeLayer alloc]init];
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddRect(path, nil, cropRect);
    CGPathAddRect(path, nil, self.view.bounds);
    
    [cropLayer setFillRule:kCAFillRuleEvenOdd];
    [cropLayer setPath:path];
    [cropLayer setFillColor:[UIColor blackColor].CGColor];
    [cropLayer setOpacity:0.6];
    
    [cropLayer setNeedsDisplay];
    
    [self.view.layer addSublayer:cropLayer];
    
}



- (void)setupCamera{
    //获取摄像设备
    _device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    if (_device == nil) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"设备没有摄像头" preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
        }]];
        [self presentViewController:alert animated:YES completion:nil];
        return;
    }
    //输入流
    _input = [AVCaptureDeviceInput deviceInputWithDevice:_device error:nil];
    //    输出流
    _output = [[AVCaptureMetadataOutput alloc]init];
    [_output setMetadataObjectsDelegate:self queue:dispatch_get_main_queue()];
    
    //设置扫描区域
    CGFloat top = TOP/ScreenHeight;
    CGFloat left = LEFT/ScreenWidth;
    CGFloat width = 220/ScreenWidth;
    CGFloat height = 220/ScreenHeight;
    ///top 与 left 互换  width 与 height 互换
    [_output setRectOfInterest:CGRectMake(top,left, height, width)];
    
    //初始化链接对象
    _session = [[AVCaptureSession alloc]init];
    //高质量采集率
    [_session setSessionPreset:AVCaptureSessionPresetHigh];
    if ([_session canAddInput:_input]) {
        [_session addInput:_input];
    }
    if ([_session canAddOutput:_output]) {
        [_session addOutput:_output];
    }
    _output.metadataObjectTypes = @[AVMetadataObjectTypeQRCode,AVMetadataObjectTypeEAN13Code,AVMetadataObjectTypeCode128Code];
    _preview = [AVCaptureVideoPreviewLayer layerWithSession:_session];
    _preview.videoGravity = AVLayerVideoGravityResizeAspectFill;
    _preview.frame = self.view.layer.bounds;
    [self.view.layer insertSublayer:_preview atIndex:0];
    
    [_session startRunning];
}
-(void)animation1
{
    if (upOrdown == NO) {
        num ++;
        _line.frame = CGRectMake(LEFT, TOP+10+2*num, 220, 2);
        if (2 * num == 200) {
            upOrdown = YES;
        }
    }
    else{
        num -- ;
        _line.frame = CGRectMake(LEFT, TOP+10+2*num, 220, 2);
        if (num * 2 == 0) {
            upOrdown = NO;
        }
    }
}
#pragma mark AVCaptureMetadataOutputObjectsDelegate
- (void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection
{
    NSString *stringValue;
    
    if ([metadataObjects count] >0)
    {
        //停止扫描
        [_session stopRunning];
        [timer setFireDate:[NSDate distantFuture]];
        
        AVMetadataMachineReadableCodeObject * metadataObject = [metadataObjects objectAtIndex:0];
        stringValue = metadataObject.stringValue;

//        NSArray *arry = metadataObject.corners;
//        for (id temp in arry) {
//            NSLog(@"%@",temp);
//        }
//
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"扫描结果" message:stringValue preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//            if (_session != nil && timer != nil) {
//                [_session startRunning];
//                [timer setFireDate:[NSDate date]];
//            }
            NSLog(@"%@",stringValue);
            
        }]];
        [self presentViewController:alert animated:YES completion:nil];
        
    } else {
//        NSLog(@"无扫描信息");
//        return;
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"" message:@"无扫描信息" preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            if (_session != nil && timer != nil) {
                [_session startRunning];
                [timer setFireDate:[NSDate date]];
            }
            
        }]];
        [self presentViewController:alert animated:YES completion:nil];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
