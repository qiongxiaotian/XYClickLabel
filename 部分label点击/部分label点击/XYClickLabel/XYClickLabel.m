//
//  XYClickLabel.m
//  部分label点击
//
//  Created by mxy on 2017/11/7.
//  Copyright © 2017年 mxy. All rights reserved.
//

#import "XYClickLabel.h"
#define originY 60
@interface XYClickLabel()
@property (nonatomic,strong)NSString *clickLabelStr;
@end
@implementation XYClickLabel

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initLabelViewWithLab:(NSString *)text clickTextRange:(NSRange)clickTextRange clickAtion:(clickBlock)clickAction{

    self = [super init];
    if (self) {

        //变量
        NSString *clickText;
        NSString *commonText;
        NSString *commonText2;
        UILabel *clickLabel = [UILabel new];
        UILabel *commonLabel = [UILabel new];
        UILabel *commonLabel2 = [UILabel new];

        clickText = [text substringWithRange:clickTextRange];
        //如果选择的范围文字是文尾的文字，而不是中间的文字或者开头的文字
        if (clickTextRange.location + clickTextRange.length == text.length) {

            commonText = [text substringToIndex:clickTextRange.location];
            //label的位置
            commonLabel.frame = CGRectMake(0, 0, [[self class]calculateRowWidth:commonText],30 );
            clickLabel.frame = CGRectMake(commonLabel.frame.size.width, 0, [[self class]calculateRowWidth:clickText], 30);
        }else if(clickTextRange.location == 0){//选择的是开头的文字
            commonText = [text substringWithRange:NSMakeRange(clickText.length, text.length-clickText.length)];
            //label的位置
            clickLabel.frame = CGRectMake(0, 0, [[self class]calculateRowWidth:clickText], 30);
            commonLabel.frame =CGRectMake(clickLabel.frame.size.width, 0, [[self class]calculateRowWidth:commonText], 30);
        }else{//选择的是中间的文字，不是开头，不是结尾
            commonText = [text substringToIndex:clickTextRange.location];
            commonText2 = [text substringWithRange:NSMakeRange(clickTextRange.location+clickTextRange.length, text.length-clickTextRange.length-clickTextRange.location)];

            //label的位置
            commonLabel.frame = CGRectMake(0, 0, [[self class]calculateRowWidth:commonText], 30);
            clickLabel.frame = CGRectMake(commonLabel.frame.size.width, 0, [[self class]calculateRowWidth:clickText], 30);
            commonLabel2.frame = CGRectMake(CGRectGetMaxX(clickLabel.frame), 0, [[self class]calculateRowWidth:commonText2], 30);
            commonLabel2.text = commonText2;
            [self addSubview:commonLabel2];
        }

        commonLabel.text = commonText;
        clickLabel.text = clickText;
        clickLabel.textColor = [UIColor redColor];
        self.clickLabelStr = clickText;
        clickLabel.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(labelClick)];
        [clickLabel addGestureRecognizer:tap];

        self.backgroundColor = [UIColor greenColor];
        self.clickBlock = clickAction;
        self.frame = CGRectMake(([UIScreen mainScreen].bounds.size.width-(clickLabel.frame.size.width+commonLabel.frame.size.width+commonLabel2.frame.size.width))/2, originY, [[self class] calculateRowWidth:text], 30);

        [self addSubview:commonLabel];
        [self addSubview:clickLabel];

    }
    return self;
}
+ (CGFloat)calculateRowWidth:(NSString *)string{

    NSDictionary *dic = @{NSFontAttributeName:[UIFont systemFontOfSize:17]};
    CGRect rect = [string boundingRectWithSize:CGSizeMake(0, 30) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:dic context:nil];
    return rect.size.width;
}

- (void)labelClick{
    NSLog(@"点击了%@",self.clickLabelStr);
    self.clickBlock();
}

@end
