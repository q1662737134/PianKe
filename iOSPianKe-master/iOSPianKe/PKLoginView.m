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
        
    }
    return self;
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
    }
    return _loginBtn;
}

@end
