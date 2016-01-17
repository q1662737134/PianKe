//
//  PKLeftTableViewCell.m
//  iOSPianKe
//
//  Created by ma c on 16/1/15.
//  Copyright © 2016年 赵金鹏. All rights reserved.
//

#import "PKLeftTableViewCell.h"
#import "Masonry.h"

@implementation PKLeftTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.imagepk];
        [self.contentView addSubview:self.labelpk];
        self.backgroundColor = RGB(51, 51, 51);
        self.selectedBackgroundView = [[UIView alloc] init];
        self.selectedBackgroundView.backgroundColor = RGB(90, 90, 90);
        [self yueshu];
    }
    return self;
}

- (void)yueshu{
    WS(weakSelf);
    [self.imagepk mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.mas_left).offset(30);
        make.size.equalTo(CGSizeMake(20, 20));
        make.centerY.equalTo(weakSelf.mas_centerY);
    }];
    [self.labelpk mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.imagepk.mas_right).offset(20);
        make.size.equalTo(CGSizeMake(40, 20));
        make.centerY.equalTo(weakSelf.mas_centerY);
    }];
}

-(UIImageView *)imagepk{
    if (!_imagepk) {
        _imagepk = [[UIImageView alloc]init];
    }
    return _imagepk;
}
-(UILabel *)labelpk{
    if (!_labelpk) {
        _labelpk = [[UILabel alloc]init];
        _labelpk.textColor = [UIColor whiteColor];
    }
    return _labelpk;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
