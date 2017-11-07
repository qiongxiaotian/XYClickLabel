//
//  XYClickLabel.h
//  部分label点击
//
//  Created by mxy on 2017/11/7.
//  Copyright © 2017年 mxy. All rights reserved.
//

#import <UIKit/UIKit.h>

//点击按钮
typedef void(^clickBlock)();
@interface XYClickLabel : UIView

@property (nonatomic, copy) clickBlock clickBlock;

- (instancetype)initLabelViewWithLab:(NSString *)text clickTextRange:(NSRange)clickTextRange clickAtion:(clickBlock)clickAction;

@end
