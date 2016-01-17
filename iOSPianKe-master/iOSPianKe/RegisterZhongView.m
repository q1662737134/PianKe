//
//  RegisterZhongView.m
//  iOSPianKe
//
//  Created by ma c on 16/1/15.
//  Copyright © 2016年 赵金鹏. All rights reserved.
//

#import "RegisterZhongView.h"

@implementation RegisterZhongView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.nanBtn];
        [self addSubview:self.nvBtn];
        [self addSubview:self.nichengLbl];
        [self addSubview:self.youxiangLbl];
        [self addSubview:self.mimaLbl];
        [self addSubview:self.nichengText];
        [self addSubview:self.youxiangText];
        [self addSubview:self.mimaText];
        [self addSubview:self.label1];
        [self addSubview:self.label2];
        [self addSubview:self.label3];
        [self addSubview:self.wanchengBtn];
        [self registerZhongViewLayout];
    }
    return self;
}

- (void)registerZhongViewLayout{
    WS(ws);
    [_nichengLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.mas_top).offset(60);
        make.left.equalTo(ws.mas_left).offset(40);
        make.size.equalTo(CGSizeMake(45, 15));
    }];
    [_youxiangLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.nichengLbl.mas_bottom).offset(30);
        make.left.equalTo(ws.mas_left).offset(40);
        make.size.equalTo(CGSizeMake(45, 15));
    }];
    [_mimaLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.youxiangLbl.mas_bottom).offset(30);
        make.left.equalTo(ws.mas_left).offset(40);
        make.size.equalTo(CGSizeMake(45, 15));
    }];
    [_nichengText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(ws.nichengLbl.mas_centerY);
        make.left.equalTo(ws.nichengLbl.mas_right);
        make.right.equalTo(ws.mas_right).offset(-40);
        make.height.equalTo(@20);
    }];
    [_youxiangText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(ws.youxiangLbl.mas_centerY);
        make.centerX.equalTo(ws.nichengText.mas_centerX);
        make.width.equalTo(ws.nichengText.mas_width);
        make.height.equalTo(ws.nichengText.mas_height);
    }];
    [_mimaText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(ws.mimaLbl.mas_centerY);
        make.centerX.equalTo(ws.nichengText.mas_centerX);
        make.width.equalTo(ws.nichengText.mas_width);
        make.height.equalTo(ws.nichengText.mas_height);
    }];
    [_label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.nichengLbl.mas_bottom).offset(15);
        make.left.equalTo(ws.mas_left).offset(40);
        make.right.equalTo(ws.mas_right).offset(-40);
        make.height.equalTo(@1);
    }];
    [_label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.youxiangLbl.mas_bottom).offset(15);
        make.left.equalTo(ws.mas_left).offset(40);
        make.right.equalTo(ws.mas_right).offset(-40);
        make.height.equalTo(@1);
    }];
    [_label3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.mimaLbl.mas_bottom).offset(15);
        make.left.equalTo(ws.mas_left).offset(40);
        make.right.equalTo(ws.mas_right).offset(-40);
        make.height.equalTo(@1);
    }];
    [_wanchengBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.label3.mas_bottom).offset(30);
        make.centerX.equalTo(ws.label3.mas_centerX);
        make.width.equalTo(ws.label3.mas_width);
        make.height.equalTo(@40);
    }];
    [_nanBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(ws.mas_centerX).offset(-30);
        make.bottom.equalTo(ws.nichengLbl.mas_top).offset(-30);
        make.size.equalTo(CGSizeMake(60, 30));
    }];
    [_nvBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(ws.nanBtn.mas_centerY);
        make.left.equalTo(ws.nanBtn.mas_right).offset(60);
        make.size.equalTo(CGSizeMake(60, 30));
    }];
}

- (UILabel *)nichengLbl{
    if (!_nichengLbl) {
        _nichengLbl = [[UILabel alloc]init];
        _nichengLbl.font = [UIFont systemFontOfSize:14.0];
        _nichengLbl.text = @"昵称：";
    }
    return _nichengLbl;
}

- (UILabel *)youxiangLbl{
    if (!_youxiangLbl) {
        _youxiangLbl = [[UILabel alloc]init];
        _youxiangLbl.font = [UIFont systemFontOfSize:14.0];
        _youxiangLbl.text = @"邮箱：";
    }
    return _youxiangLbl;
}

- (UILabel *)mimaLbl{
    if (!_mimaLbl) {
        _mimaLbl = [[UILabel alloc]init];
        _mimaLbl.font = [UIFont systemFontOfSize:14.0];
        _mimaLbl.text = @"密码：";
    }
    return _mimaLbl;
}

- (UILabel *)label1{
    if (!_label1) {
        _label1 = [[UILabel alloc]init];
        _label1.backgroundColor = RGB(230, 230, 230);
    }
    return _label1;
}

- (UILabel *)label2{
    if (!_label2) {
        _label2 = [[UILabel alloc]init];
        _label2.backgroundColor = RGB(230, 230, 230);
    }
    return _label2;
}

- (UILabel *)label3{
    if (!_label3) {
        _label3 = [[UILabel alloc]init];
        _label3.backgroundColor = RGB(230, 230, 230);
    }
    return _label3;
}

- (UITextField *)nichengText{
    if (!_nichengText) {
        _nichengText = [[UITextField alloc]init];
        _nichengText.borderStyle = UITextBorderStyleNone;
    }
    return _nichengText;
}

- (UITextField *)youxiangText{
    if (!_youxiangText) {
        _youxiangText = [[UITextField alloc]init];
        _youxiangText.borderStyle = UITextBorderStyleNone;
    }
    return _youxiangText;
}

- (UITextField *)mimaText{
    if (!_mimaText) {
        _mimaText = [[UITextField alloc]init];
        _mimaText.borderStyle = UITextBorderStyleNone;
        _mimaText.secureTextEntry = YES;
    }
    return _mimaText;
}

- (UIButton *)wanchengBtn{
    if (!_wanchengBtn) {
        _wanchengBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_wanchengBtn setTitle:@"完成" forState:(UIControlStateNormal)];
        [_wanchengBtn setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
        _wanchengBtn.backgroundColor = RGB(92, 191, 65);
        _wanchengBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    }
    return _wanchengBtn;
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
