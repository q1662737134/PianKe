//
//  PKLeftViewController.m
//  iOSPianKe
//
//  Created by ma c on 16/1/14.
//  Copyright © 2016年 赵金鹏. All rights reserved.
//

#import "PKLeftViewController.h"
#import "PKLeftHeadView.h"
#import "PKLeftTableView.h"
#import "PKLeftweiView.h"
#import "PKLoginViewController.h"

@interface PKLeftViewController ()

@property (strong, nonatomic) PKLeftHeadView            * leftheadView;
@property (strong, nonatomic) PKLeftTableView           * leftTableView;
@property (strong, nonatomic) PKLeftweiView             * leftWeiView;

@end

@implementation PKLeftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = RGB(51, 51, 51);
    self.leftTableView.backgroundColor = RGB(51, 51, 51);
    [self.view addSubview:self.leftheadView];
    [self.view addSubview:self.leftTableView];
    [self.view addSubview:self.leftWeiView];
    [self addAutoLayout];
    
    [self.leftheadView.userNameBtn addTarget:self action:@selector(loginClick) forControlEvents:(UIControlEventTouchUpInside)];
    [self.leftheadView.iconImageBtn addTarget:self action:@selector(loginClick) forControlEvents:(UIControlEventTouchUpInside)];
}

- (void)loginClick{
    PKLoginViewController * vc = [[PKLoginViewController alloc]init];
    [self presentViewController:vc animated:YES completion:nil];
}

- (void)addAutoLayout{
    WS(ws);
    [_leftheadView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.view.mas_top);
        make.height.equalTo(@190);
        make.left.equalTo(ws.view.mas_left);
        make.right.equalTo(ws.view.mas_right);
    }];
    [_leftTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.leftheadView.mas_bottom);
        make.left.equalTo(ws.view.mas_left);
        make.right.equalTo(ws.view.mas_right);
        make.bottom.equalTo(ws.view.mas_bottom).offset(-60);
    }];
    [_leftWeiView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@60);
        make.left.equalTo(ws.view.mas_left);
        make.right.equalTo(ws.view.mas_right);
        make.bottom.equalTo(ws.view.mas_bottom);
    }];
}

- (PKLeftweiView *)leftWeiView{
    if (!_leftWeiView) {
        _leftWeiView = [[PKLeftweiView alloc]init];
        _leftWeiView.backgroundColor = RGB(28, 28, 28);
    }
    return _leftWeiView;
}

- (PKLeftTableView *)leftTableView{
    if (!_leftTableView) {
        _leftTableView =[[PKLeftTableView alloc]init];
    }
    return _leftTableView;
}

- (PKLeftHeadView *)leftheadView{
    if (!_leftheadView) {
        _leftheadView = [[PKLeftHeadView alloc]init];
        [_leftheadView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"cbbj"]]];
//        [_leftheadView setBackgroundColor:[UIColor yellowColor]];
    }
    return _leftheadView;
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
