//
//  PKLoginHeadView.m
//  iOSPianKe
//
//  Created by ma c on 16/1/15.
//  Copyright © 2016年 赵金鹏. All rights reserved.
//

#import "PKLoginHeadView.h"
#import "Masonry.h"

@implementation PKLoginHeadView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.fanhuiBtn];
        [self addSubview:self.zhuceBtn];
        [self addSubview:self.logoImage];
        [self PKLoginHeadLayout];
    }
    return self;
}

- (void)PKLoginHeadLayout{
    WS(ws);
    [_fanhuiBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.mas_top).offset(10);
        make.left.equalTo(ws.mas_left).offset(10);
        make.size.equalTo(CGSizeMake(15, 15));
    }];
    [_zhuceBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(ws.fanhuiBtn.mas_centerY);
        make.right.equalTo(ws.mas_right).offset(-10);
        make.size.equalTo(CGSizeMake(35, 18));
    }];
    [_logoImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(ws.mas_centerX);
//        make.left.equalTo(ws.mas_left).offset(100);
        make.top.equalTo(ws.mas_top).offset(80);
        make.size.equalTo(CGSizeMake(120, 50));
    }];
}

- (UIButton *)fanhuiBtn{
    if (!_fanhuiBtn) {
        _fanhuiBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_fanhuiBtn setBackgroundImage:[UIImage imageNamed:@"返回"] forState:(UIControlStateNormal)];
    }
    return _fanhuiBtn;
}

- (UIButton *)zhuceBtn{
    if (!_zhuceBtn) {
        _zhuceBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_zhuceBtn setTitle:@"注册" forState:(UIControlStateNormal)];
        _zhuceBtn.titleLabel.font = [UIFont systemFontOfSize:16.0];
        [_zhuceBtn setTitleColor:[UIColor lightGrayColor] forState:(UIControlStateNormal)];
    }
    return _zhuceBtn;
}

- (UIImageView *)logoImage{
    if (!_logoImage) {
        _logoImage = [[UIImageView alloc]init];
        _logoImage.image = [UIImage imageNamed:@"片刻logo"];
//        _logoImage.backgroundColor = [UIColor redColor];
    }
    return _logoImage;
}

@end
