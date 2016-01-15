//
//  PKLoginView.m
//  iOSPianKe
//
//  Created by ma c on 16/1/15.
//  Copyright © 2016年 赵金鹏. All rights reserved.
//

#import "PKLoginView.h"
#import "Masonry.h"

@implementation PKLoginView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.zhanghaoLbl];
        [self addSubview:self.MimaLbl];
        [self addSubview:self.zhanghaoText];
        [self addSubview:self.mimaText];
        [self addSubview:self.xianLbl1];
        [self addSubview:self.xianLbl2];
        [self addSubview:self.loginBtn];
        [self PKLoginViewLayout];
    }
    return self;
}

- (void)PKLoginViewLayout{
    WS(ws);
    [_zhanghaoLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(CGSizeMake(45, 20));
        make.top.equalTo(ws.mas_top);
        make.left.equalTo(ws.mas_left).offset(30);
    }];
    [_MimaLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(CGSizeMake(45, 20));
        make.top.equalTo(ws.zhanghaoLbl.mas_bottom).offset(40);
        make.left.equalTo(ws.mas_left).offset(30);
    }];
    [_zhanghaoText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(ws.zhanghaoLbl.mas_centerY);
        make.left.equalTo(ws.zhanghaoLbl.mas_right);
        make.right.equalTo(ws.mas_right).offset(-30);
        make.height.equalTo(@20);
    }];
    [_mimaText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(ws.MimaLbl.mas_centerY);
        make.left.equalTo(ws.zhanghaoText.mas_left);
        make.width.equalTo(ws.zhanghaoText.mas_width);
        make.height.equalTo(ws.zhanghaoText.mas_height);
    }];
    [_xianLbl1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@1);
        make.top.equalTo(ws.zhanghaoLbl.mas_bottom).offset(5);
        make.left.equalTo(ws.mas_left).offset(30);
        make.right.equalTo(ws.mas_right).offset(-30);
    }];
    [_xianLbl2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@1);
        make.top.equalTo(ws.MimaLbl.mas_bottom).offset(5);
        make.left.equalTo(ws.xianLbl1.mas_left);
        make.width.equalTo(ws.xianLbl1.mas_width);
    }];
    [_loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.xianLbl2.mas_bottom).offset(30);
        make.left.equalTo(ws.mas_left).offset(30);
        make.width.equalTo(ws.xianLbl1);
        make.height.equalTo(@30);
    }];
}

- (UILabel *)xianLbl1{
    if (!_xianLbl1) {
        _xianLbl1 = [[UILabel alloc]init];
        _xianLbl1.backgroundColor = RGB(230, 230, 230);
    }
    return _xianLbl1;
}

- (UILabel *)xianLbl2{
    if (!_xianLbl2) {
        _xianLbl2 = [[UILabel alloc]init];
        _xianLbl2.backgroundColor = RGB(230, 230, 230);
    }
    return _xianLbl2;
}

- (UILabel *)zhanghaoLbl{
    if (!_zhanghaoLbl) {
        _zhanghaoLbl = [[UILabel alloc]init];
        _zhanghaoLbl.text = @"邮箱：";
        _zhanghaoLbl.font = [UIFont systemFontOfSize:14.0];
    }
    return _zhanghaoLbl;
}

- (UILabel *)MimaLbl{
    if (!_MimaLbl) {
        _MimaLbl = [[UILabel alloc]init];
        _MimaLbl.text = @"密码：";
        _MimaLbl.font = [UIFont systemFontOfSize:14.0];
    }
    return _MimaLbl;
}

- (UITextField *)zhanghaoText{
    if (!_zhanghaoText) {
        _zhanghaoText = [[UITextField alloc]init];
        _zhanghaoText.borderStyle = UITextBorderStyleNone;
    }
    return _zhanghaoText;
}

- (UITextField *)mimaText{
    if (!_mimaText) {
        _mimaText = [[UITextField alloc]init];
        _mimaText.borderStyle = UITextBorderStyleNone;
    }
    return _mimaText;
}

- (UIButton *)loginBtn{
    if (!_loginBtn) {
        _loginBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        _loginBtn.backgroundColor = RGB(92, 191, 65);
        [_loginBtn setTitle:@"登录" forState:(UIControlStateNormal)
         ];
        [_loginBtn setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
        _loginBtn.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    }
    return _loginBtn;
}

@end
