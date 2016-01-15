//
//  PKLoginView.h
//  iOSPianKe
//
//  Created by ma c on 16/1/15.
//  Copyright © 2016年 赵金鹏. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PKLoginView : UIView<UITextFieldDelegate>

@property (strong, nonatomic) UILabel                   * xianLbl1;
@property (strong, nonatomic) UILabel                   * xianLbl2;
@property (strong, nonatomic) UILabel                   * zhanghaoLbl;
@property (strong, nonatomic) UILabel                   * MimaLbl;
@property (strong, nonatomic) UITextField               * zhanghaoText;
@property (strong, nonatomic) UITextField               * mimaText;
@property (strong, nonatomic) UIButton                  * loginBtn;

@end
