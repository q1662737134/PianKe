//
//  PKLoginWeiView.m
//  iOSPianKe
//
//  Created by ma c on 16/1/15.
//  Copyright © 2016年 赵金鹏. All rights reserved.
//

#import "PKLoginWeiView.h"
#import "Masonry.h"

@interface PKLoginWeiView()



@end

@implementation PKLoginWeiView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.xianLabel];
        [self addSubview:self.hezuoLabel];
        [self addSubview:self.xinlangBtn];
        [self addSubview:self.renrenBtn];
        [self addSubview:self.doubanBtn];
        [self addSubview:self.qqBtn];
        [self yueshu];
    }
    return self;
}

- (void)yueshu{
    WS(ws);
    [_xianLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@1);
        make.left.equalTo(ws.mas_left).offset(30);
        make.right.equalTo(ws.mas_right).offset(-30);
        make.centerY.equalTo(ws.hezuoLabel.mas_centerY);
    }];
    [_hezuoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(CGSizeMake(90, 10));
        make.top.equalTo(ws.mas_top).offset(15);
        make.centerX.equalTo(ws.mas_centerX);
    }];
    CGFloat w = (VIEW_WIDTH - 160)/3;
    [_xinlangBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(CGSizeMake(25, 25));
        make.left.equalTo(ws.mas_left).offset(30);
        make.top.equalTo(ws.hezuoLabel.mas_bottom).offset(20);
    }];
    [_renrenBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(CGSizeMake(25, 25));
        make.left.equalTo(ws.xinlangBtn.mas_right).offset(w);
        make.centerY.equalTo(ws.xinlangBtn.mas_centerY);
    }];
    [_doubanBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(CGSizeMake(25, 25));
        make.left.equalTo(ws.renrenBtn.mas_right).offset(w);
        make.centerY.equalTo(ws.renrenBtn.mas_centerY);
    }];
    [_qqBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(CGSizeMake(25, 25));
        make.left.equalTo(ws.doubanBtn.mas_right).offset(w);
        make.centerY.equalTo(ws.doubanBtn.mas_centerY);
    }];
}

- (UILabel *)xianLabel{
    if (!_xianLabel) {
        _xianLabel = [[UILabel alloc]init];
        _xianLabel.backgroundColor = RGB(230, 230, 230);
//        _xianLabel.backgroundColor = [UIColor blackColor];
    }
    return _xianLabel;
}

- (UILabel *)hezuoLabel{
    if (!_hezuoLabel) {
        _hezuoLabel = [[UILabel alloc]init];
        _hezuoLabel.text = @"合作伙伴登录片刻";
        _hezuoLabel.textAlignment = NSTextAlignmentCenter;
        _hezuoLabel.font = [UIFont systemFontOfSize:10.0];
        _hezuoLabel.backgroundColor = [UIColor whiteColor];
    }
    return _hezuoLabel;
}

- (UIButton *)xinlangBtn{
    if (!_xinlangBtn) {
        _xinlangBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_xinlangBtn setBackgroundImage:[UIImage imageNamed:@"新浪"] forState:(UIControlStateNormal)];
    }
    return _xinlangBtn;
}

- (UIButton *)renrenBtn{
    if (!_renrenBtn) {
        _renrenBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_renrenBtn setBackgroundImage:[UIImage imageNamed:@"人人"] forState:(UIControlStateNormal)];
    }
    return _renrenBtn;
}

- (UIButton *)doubanBtn{
    if (!_doubanBtn) {
        _doubanBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_doubanBtn setBackgroundImage:[UIImage imageNamed:@"豆瓣"] forState:(UIControlStateNormal)];
    }
    return _doubanBtn;
}

- (UIButton *)qqBtn{
    if (!_qqBtn) {
        _qqBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_qqBtn setBackgroundImage:[UIImage imageNamed:@"QQ"] forState:(UIControlStateNormal)];
    }
    return _qqBtn;
}

@end
