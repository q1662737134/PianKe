//
//  RegisterWeiView.m
//  iOSPianKe
//
//  Created by ma c on 16/1/15.
//  Copyright © 2016年 赵金鹏. All rights reserved.
//

#import "RegisterWeiView.h"

@implementation RegisterWeiView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.xieyiBtn];
        [self addSubview:self.tishiLbl];
        [self registerWeiViewLayout];
    }
    return self;
}

- (void)registerWeiViewLayout{
    WS(ws);
    [_tishiLbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(ws.mas_bottom).offset(-30);
        make.left.equalTo(ws.mas_left).offset(30);
        make.right.equalTo(ws.xieyiBtn.mas_left);
        make.height.equalTo(@15);
    }];
    [_xieyiBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(ws.tishiLbl.mas_centerY);
        make.right.equalTo(ws.mas_right).offset(-30);
        make.size.equalTo(CGSizeMake(50, 15));
    }];
}

- (UIButton *)xieyiBtn{
    if (!_xieyiBtn) {
        _xieyiBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_xieyiBtn setTitle:@"片刻协议" forState:(UIControlStateNormal)];
        _xieyiBtn.titleLabel.font = [UIFont systemFontOfSize:11];
        [_xieyiBtn setTitleColor:RGB(120, 180, 70) forState:(UIControlStateNormal)];
    }
    return _xieyiBtn;
}

- (UILabel *)tishiLbl{
    if (!_tishiLbl) {
        _tishiLbl = [[UILabel alloc]init];
        _tishiLbl.text = @"点击“完成按钮，代表你已阅读并同意”";
        _tishiLbl.font = [UIFont systemFontOfSize:11];
        _tishiLbl.textColor = RGB(100, 100, 100);
    }
    return _tishiLbl;
}

@end
