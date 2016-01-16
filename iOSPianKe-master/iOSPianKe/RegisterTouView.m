//
//  RegisterTouView.m
//  iOSPianKe
//
//  Created by ma c on 16/1/15.
//  Copyright © 2016年 赵金鹏. All rights reserved.
//

#import "RegisterTouView.h"

@implementation RegisterTouView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.fanhuiBtn];
        [self addSubview:self.touxiangBtn];
        [self addSubview:self.nanBtn];
        [self addSubview:self.nvBtn];
        [self RegisterTouLayout];
    }
    return self;
}

- (void)RegisterTouLayout{
    WS(ws);
    [_fanhuiBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.mas_top).offset(10);
        make.left.equalTo(ws.mas_left).offset(10);
        make.size.equalTo(CGSizeMake(15, 15));
    }];
    [_touxiangBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(ws.mas_centerX);
        make.top.equalTo(ws.mas_top).offset(40);
        make.size.equalTo(CGSizeMake(60, 60));
    }];
    [_nanBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(ws.mas_centerX).offset(-30);
        make.top.equalTo(ws.touxiangBtn.mas_bottom).offset(60);
        make.size.equalTo(CGSizeMake(60, 30));
    }];
    [_nvBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(ws.nanBtn.mas_centerY);
        make.left.equalTo(ws.nanBtn.mas_right).offset(60);
        make.size.equalTo(CGSizeMake(60, 30));
    }];
}

- (UIButton *)fanhuiBtn{
    if (!_fanhuiBtn) {
        _fanhuiBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_fanhuiBtn setBackgroundImage:[UIImage imageNamed:@"返回"] forState:(UIControlStateNormal)];
    }
    return _fanhuiBtn;
}

- (UIButton *)touxiangBtn{
    if (!_touxiangBtn) {
        _touxiangBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_touxiangBtn setBackgroundImage:[UIImage imageNamed:@"头像选取"] forState:(UIControlStateNormal)];
    }
    return _touxiangBtn;
}

- (UIButton *)nanBtn{
    if (!_nanBtn) {
        _nanBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_nanBtn setBackgroundImage:[UIImage imageNamed:@"男"] forState:(UIControlStateNormal)];
    }
    return _nanBtn;
}

- (UIButton *)nvBtn{
    if (!_nvBtn) {
        _nvBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_nvBtn setBackgroundImage:[UIImage imageNamed:@"女"] forState:(UIControlStateNormal)];
    }
    return _nvBtn;
}

@end























