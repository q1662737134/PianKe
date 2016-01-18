//
//  RegisterViewController.m
//  iOSPianKe
//
//  Created by ma c on 16/1/15.
//  Copyright © 2016年 赵金鹏. All rights reserved.
//

#import "RegisterViewController.h"
#import "RegisterTouView.h"
#import "RegisterZhongView.h"
#import "RegisterWeiView.h"
#import "Masonry.h"
#import "AFNetworking.h"

@interface RegisterViewController ()<UITextFieldDelegate,UIActionSheetDelegate,UINavigationControllerDelegate,UIImagePickerControllerDelegate>

@property (strong, nonatomic) RegisterTouView               * registerTouView;
@property (strong, nonatomic) RegisterZhongView             * registerZhongView;
@property (strong, nonatomic) RegisterWeiView               * registerWeiView;
@property (assign, nonatomic) NSString                      * xingbie;
@property (strong, nonatomic) NSString                      * imageFiled;
@property (strong, nonatomic) UIView                        * tishiView;
@property (strong, nonatomic) UILabel                       * tishiLbl;
@property (strong, nonatomic) NSString                      * tishiStr;
@property (strong, nonatomic) NSTimer                       * timer;

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _xingbie = @"1";
    _imageFiled = @"头像";
    // Do any additional setup after loading the view.
    [self.view addSubview:self.registerTouView];
    [self.view addSubview:self.registerZhongView];
    [self.view addSubview:self.registerWeiView];
    [self.view addSubview:self.tishiView];
    [self.tishiView addSubview:self.tishiLbl];
    [self registerViewControllerLayout];
    
    [self.registerTouView.fanhuiBtn addTarget:self action:@selector(fanhuiBtnClick) forControlEvents:(UIControlEventTouchUpInside)];
    [self.registerZhongView.nanBtn addTarget:self action:@selector(registerViewControllerNan) forControlEvents:(UIControlEventTouchUpInside)];
    [self.registerZhongView.nvBtn addTarget:self action:@selector(registerViewControllerNv) forControlEvents:(UIControlEventTouchUpInside)];
    [self.registerTouView.touxiangBtn addTarget:self action:@selector(registerViewControllerShangChuanTuxiang) forControlEvents:(UIControlEventTouchUpInside)];
    [self.registerZhongView.wanchengBtn addTarget:self action:@selector(registerViewControllerWancheng) forControlEvents:(UIControlEventTouchUpInside)];
}

- (void)registerViewControllerWancheng{
    NSDictionary *dic = @{@"client":@"1",
                          @"deviceid":@"A55AF7DB-88C8-408D-B983-D0B9C9CA0B36",
                          @"email":_registerZhongView.youxiangText.text,
                          @"gender":_xingbie,
                          @"passwd":_registerZhongView.mimaText.text,
                          @"uname":_registerZhongView.nichengText.text,
                          @"version":@"3.0.6",
                          @"auth":@"",
                          @"iconfile":_imageFiled};
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"application/x-javascript"];
    
    [manager POST:@"http://api2.pianke.me/user/reg" parameters:dic constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        if ([_imageFiled isEqualToString:@"头像"]) {
            NSLog(@"imageFiled%@",_imageFiled);
        }
        else{
            NSLog(@"imageFiled%@",_imageFiled);
            UIImage *postImage = [UIImage imageWithContentsOfFile:_imageFiled];
            NSData *imageData = UIImageJPEGRepresentation(postImage, 0.1);
            [formData appendPartWithFileData:imageData name:@"iconfile" fileName:_imageFiled    mimeType:@"image/png"];
        }
        
    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
        _tishiStr = [[responseObject objectForKey:@"data"] objectForKey:@"msg"];
        _tishiLbl.text = _tishiStr;
        if (_tishiStr != nil) {
            [self chuxianTishi];
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"上传失败");
    }];
}

- (void)chuxianTishi{
    
    WS(ws);
    [UIView animateWithDuration:0.1 animations:^{
        CGRect rect = ws.tishiView.bounds;
        rect.origin.y = -90;
        ws.tishiView.bounds = rect;
    }];
    _timer = [NSTimer scheduledTimerWithTimeInterval:5.0 target:self selector:@selector(xiaoshiTishi) userInfo:nil repeats:NO];
}

- (void)xiaoshiTishi{
    WS(ws);
    [UIView animateWithDuration:0.1 animations:^{
        CGRect rect = ws.tishiView.bounds;
        rect.origin.y = 0;
        ws.tishiView.bounds = rect;
    }];
    [_timer invalidate];
}

- (void)registerViewControllerShangChuanTuxiang{
    UIActionSheet *sheet=[[UIActionSheet alloc]initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"拍照",@"从相册中选择", nil];
    sheet.delegate = self;
    [sheet showInView:self.view];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 0) {
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        picker.sourceType=UIImagePickerControllerSourceTypeCamera;//指定使用照相机模式,可以指定使用相册／照片库
        picker.allowsEditing = YES;//设置拍照后的图片可被编辑
        picker.showsCameraControls = YES;
        [self presentViewController:picker animated:YES completion:nil];
    }else if(buttonIndex == 1){
        UIImagePickerController * picker=[[UIImagePickerController alloc] init];
        picker.delegate = self;
        picker.allowsEditing=YES;
        [self presentViewController:picker animated:YES completion:nil];
    }
}

- (void)registerViewControllerNan{
    _xingbie = @"1";
    [self.registerZhongView.nanBtn setBackgroundImage:[UIImage imageNamed:@"男bg"] forState:(UIControlStateNormal)];
    [self.registerZhongView.nvBtn setBackgroundImage:[UIImage imageNamed:@"女"] forState:(UIControlStateNormal)];
}

- (void)registerViewControllerNv{
    _xingbie = @"2";
    [self.registerZhongView.nanBtn setBackgroundImage:[UIImage imageNamed:@"男"] forState:(UIControlStateNormal)];
    [self.registerZhongView.nvBtn setBackgroundImage:[UIImage imageNamed:@"女bg"] forState:(UIControlStateNormal)];
}

- (void)fanhuiBtnClick{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - UIImagePickerControllerDelegate 代理方法
// 当得到照片或者视频后，调用该方法
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    
    UIImage *editedImage = [info objectForKey:@"UIImagePickerControllerEditedImage"];
    
    NSString *homePath = [NSHomeDirectory() stringByAppendingString:@"/Documents"];
    
    NSString *imageViews   = [homePath stringByAppendingFormat:@"/%d.png", arc4random_uniform(1000000)];
    [UIImageJPEGRepresentation(editedImage, 1.0f) writeToFile:imageViews atomically:YES];
    self.imageFiled = imageViews;
    [self.registerTouView.touxiangBtn setBackgroundImage:editedImage forState:(UIControlStateNormal)];
    //关闭相册界面
    [picker dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - 判断相机可用不
// 前面的摄像头是否可用
- (BOOL) isFrontCameraAvailable{
    return [UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceFront];
}

// 后面的摄像头是否可用
- (BOOL) isRearCameraAvailable{
    return [UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceRear];
}
#pragma mark - 相册文件选取相关
// 相册是否可用
- (BOOL) isPhotoLibraryAvailable{
    return [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary];
}

#pragma mark - 约束
- (void)registerViewControllerLayout{
    WS(ws);
    [_registerTouView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.view.mas_top).offset(20);
        make.left.equalTo(ws.view.mas_left);
        make.right.equalTo(ws.view.mas_right);
        make.height.equalTo(@200);
    }];
    [_registerZhongView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(ws.registerWeiView.mas_top);
        make.left.equalTo(ws.view.mas_left);
        make.right.equalTo(ws.view.mas_right);
        make.height.equalTo(@260);
    }];
    [_registerWeiView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.view.mas_left);
        make.right.equalTo(ws.view.mas_right);
        make.bottom.equalTo(ws.view.mas_bottom);
        make.height.equalTo(@60);
    }];
}

#pragma mark - 懒加载
- (RegisterTouView *)registerTouView{
    if (!_registerTouView) {
        _registerTouView = [[RegisterTouView alloc]init];
    }
    return _registerTouView;
}

- (RegisterZhongView *)registerZhongView{
    if (!_registerZhongView) {
        _registerZhongView = [[RegisterZhongView alloc]init];
        _registerZhongView.nichengText.delegate = self;
        _registerZhongView.youxiangText.delegate = self;
        _registerZhongView.mimaText.delegate = self;
    }
    return _registerZhongView;
}

- (RegisterWeiView *)registerWeiView{
    if (!_registerWeiView) {
        _registerWeiView = [[RegisterWeiView alloc]init];
    }
    return _registerWeiView;
}

- (UIView *)tishiView{
    if (!_tishiView) {
        _tishiView = [[UIView alloc]initWithFrame:CGRectMake(0, -30, self.view.frame.size.width, 30)];
    }
    return _tishiView;
}

- (UILabel *)tishiLbl{
    if (!_tishiLbl) {
        _tishiLbl = [[UILabel alloc]initWithFrame:_tishiView.bounds];
        _tishiLbl.backgroundColor = RGB(240, 90, 90);
        _tishiLbl.alpha = .6;
        _tishiLbl.textColor = [UIColor whiteColor];
        _tishiLbl.textAlignment = NSTextAlignmentCenter;
        _tishiLbl.font = [UIFont systemFontOfSize:14];
    }
    return _tishiLbl;
}

#pragma mark - 收键盘
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    [_registerZhongView.nichengText resignFirstResponder];
    [_registerZhongView.youxiangText resignFirstResponder];
    [_registerZhongView.mimaText resignFirstResponder];
    WS(ws);
    [UIView animateWithDuration:0.3 animations:^{
        CGRect rect = ws.view.bounds;
        rect.origin.y = 0;
        ws.view.bounds = rect;
    }];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [_registerZhongView.nichengText resignFirstResponder];
    [_registerZhongView.youxiangText resignFirstResponder];
    [_registerZhongView.mimaText resignFirstResponder];
    WS(ws);
    [UIView animateWithDuration:0.3 animations:^{
        CGRect rect = ws.view.bounds;
        rect.origin.y = 0;
        ws.view.bounds = rect;
    }];
    return YES;
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    WS(ws);
    if (textField == _registerZhongView.nichengText) {
        [UIView animateWithDuration:0.3 animations:^{
            CGRect rect = ws.view.bounds;
            rect.origin.y = 50;
            ws.view.bounds = rect;
        }];
    }else {
        [UIView animateWithDuration:0.3 animations:^{
            CGRect rect = ws.view.bounds;
            rect.origin.y = 100;
            ws.view.bounds = rect;
        }];
    }
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
