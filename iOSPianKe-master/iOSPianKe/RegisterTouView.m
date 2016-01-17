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



@end























