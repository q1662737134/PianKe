//
//  PKLoginViewController.m
//  iOSPianKe
//
//  Created by ma c on 16/1/15.
//  Copyright © 2016年 赵金鹏. All rights reserved.
//

#import "PKLoginViewController.h"
#import "Masonry.h"
#import "PKLoginWeiView.h"
#import "PKLoginView.h"
#import "PKLoginHeadView.h"

@interface PKLoginViewController ()

@property (strong, nonatomic) PKLoginWeiView                * loginWeiView;
@property (strong, nonatomic) PKLoginView                   * longinView;
@property (strong, nonatomic) PKLoginHeadView               * loginHeadView;

@end

@implementation PKLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.loginWeiView];
    [self.view addSubview:self.longinView];
    [self.view addSubview:self.loginHeadView];
    [self loginYueshu];
    
    [self.loginHeadView.fanhuiBtn addTarget:self action:@selector(btnClick) forControlEvents:(UIControlEventTouchUpInside)];
    
}

- (void)loginYueshu{
    WS(ws);
    [_loginWeiView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@100);
        make.left.equalTo(ws.view.mas_left);
        make.right.equalTo(ws.view.mas_right);
        make.bottom.equalTo(ws.view.mas_bottom);
    }];
    [_longinView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(ws.loginWeiView.mas_top);
        make.left.equalTo(ws.view.mas_left);
        make.right.equalTo(ws.view.mas_right);
        make.height.equalTo(@180);
    }];
    [_loginHeadView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.view.mas_top).offset(20);
        make.left.equalTo(ws.view.mas_left);
        make.right.equalTo(ws.view.mas_right);
        make.height.equalTo(@200);
    }];
}

- (void)btnClick{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (PKLoginHeadView *)loginHeadView{
    if (!_loginHeadView) {
        _loginHeadView = [[PKLoginHeadView alloc]init];
//        _loginHeadView.backgroundColor = [UIColor cyanColor];
    }
    return _loginHeadView;
}

- (PKLoginView *)longinView{
    if (!_longinView) {
        _longinView = [[PKLoginView alloc]init];
//        _longinView.backgroundColor = [UIColor cyanColor];
    }
    return _longinView;
}

- (PKLoginWeiView *)loginWeiView{
    if (!_loginWeiView) {
        _loginWeiView = [[PKLoginWeiView alloc]init];
//        _loginWeiView.backgroundColor = [UIColor cyanColor];
    }
    return _loginWeiView;
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
