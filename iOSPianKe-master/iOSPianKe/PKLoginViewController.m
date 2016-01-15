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

@interface PKLoginViewController ()

@property (strong, nonatomic) PKLoginWeiView                * loginWeiView;

@end

@implementation PKLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    UIButton * btn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    btn.frame = CGRectMake(10, 30, 40, 20);
    btn.backgroundColor = [UIColor yellowColor];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:btn];
    
    [self.view addSubview:self.loginWeiView];
    [self loginYueshu];
    
}

- (void)loginYueshu{
    WS(ws);
    [_loginWeiView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@100);
        make.left.equalTo(ws.view.mas_left);
        make.right.equalTo(ws.view.mas_right);
        make.bottom.equalTo(ws.view.mas_bottom);
    }];
}

- (void)btnClick{
    [self dismissViewControllerAnimated:YES completion:nil];
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
