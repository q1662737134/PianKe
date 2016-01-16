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

@interface RegisterViewController ()

@property (strong, nonatomic) RegisterTouView               * registerTouView;
@property (strong, nonatomic) RegisterZhongView             * registerZhongView;
@property (strong, nonatomic) RegisterWeiView               * registerWeiView;

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.registerTouView];
    [self.view addSubview:self.registerZhongView];
    [self.view addSubview:self.registerWeiView];
    [self registerViewControllerLayout];
    
    [self.registerTouView.fanhuiBtn addTarget:self action:@selector(fanhuiBtnClick) forControlEvents:(UIControlEventTouchUpInside)];
}

- (void)fanhuiBtnClick{
    [self dismissViewControllerAnimated:YES completion:nil];
}

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
        make.height.equalTo(@250);
    }];
    [_registerWeiView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.view.mas_left);
        make.right.equalTo(ws.view.mas_right);
        make.bottom.equalTo(ws.view.mas_bottom);
        make.height.equalTo(@80);
    }];
}

- (RegisterTouView *)registerTouView{
    if (!_registerTouView) {
        _registerTouView = [[RegisterTouView alloc]init];
    }
    return _registerTouView;
}

- (RegisterZhongView *)registerZhongView{
    if (!_registerZhongView) {
        _registerZhongView = [[RegisterZhongView alloc]init];
    }
    return _registerZhongView;
}

- (RegisterWeiView *)registerWeiView{
    if (!_registerWeiView) {
        _registerWeiView = [[RegisterWeiView alloc]init];
    }
    return _registerWeiView;
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
