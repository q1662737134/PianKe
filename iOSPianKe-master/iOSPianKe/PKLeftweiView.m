//
//  PKLeftweiView.m
//  iOSPianKe
//
//  Created by ma c on 16/1/15.
//  Copyright © 2016年 赵金鹏. All rights reserved.
//

#import "PKLeftweiView.h"
#import "Masonry.h"

@implementation PKLeftweiView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.musicImage];
        [self addSubview:self.musicName];
        [self addSubview:self.musicFrom];
        [self addSubview:self.backBtn];
        [self addSubview:self.startBtn];
        [self yueshu];
    }
    return self;
}

- (void)yueshu{
    WS(ws);
    [_backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.mas_top);
        make.bottom.equalTo(ws.mas_bottom);
        make.left.equalTo(ws.mas_left);
        make.right.equalTo(ws.mas_right);
    }];
    [_musicImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(CGSizeMake(40, 40));
        make.left.equalTo(ws.mas_left).offset(10);
        make.centerY.equalTo(ws.mas_centerY);
    }];
    [_startBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(CGSizeMake(20, 20));
        make.right.equalTo(ws.mas_right).offset(-60);
        make.centerY.equalTo(ws.mas_centerY);
    }];
    [_musicName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ws.musicImage.mas_right).offset(10);
        make.right.equalTo(ws.startBtn.mas_left).offset(-20);
        make.height.equalTo(@16);
        make.top.equalTo(ws.mas_top).offset(17);
    }];
    [_musicFrom mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@10);
        make.width.equalTo(ws.musicName.mas_width);
        make.left.equalTo(ws.musicName.mas_left);
        make.top.equalTo(ws.musicName.mas_bottom);
    }];
}

- (UIImageView *)musicImage{
    if (!_musicImage) {
        _musicImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"音乐"]];
    }
    return _musicImage;
}

- (UILabel *)musicName{
    if (!_musicName) {
        _musicName = [[UILabel alloc]init];
        _musicName.textAlignment = NSTextAlignmentLeft;
        _musicName.textColor = [UIColor whiteColor];
        _musicName.font = [UIFont systemFontOfSize:14.0];
    }
    return _musicName;
}
- (UILabel *)musicFrom{
    if (!_musicFrom) {
        _musicFrom = [[UILabel alloc]init];
        _musicFrom.textAlignment = NSTextAlignmentLeft;
        _musicFrom.textColor = [UIColor whiteColor];
        _musicFrom.font = [UIFont systemFontOfSize:10.0];
    }
    return _musicFrom;
}

- (UIButton *)startBtn{
    if (!_startBtn) {
        _startBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [_startBtn setBackgroundImage:[UIImage imageNamed:@"播放"] forState:(UIControlStateNormal)];
    }
    return _startBtn;
}

- (UIButton *)backBtn{
    if (!_backBtn) {
        _backBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        _backBtn.backgroundColor = [UIColor clearColor];
    }
    return _backBtn;
}

@end
