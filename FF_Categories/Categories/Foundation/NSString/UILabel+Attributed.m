//
//  UILabel+Attributed.m
//  FFLabel
//
//  Created by IOS开发 on 2018/3/27.
//  Copyright © 2018年 YuanHui. All rights reserved.
//

#import "UILabel+Attributed.h"

@implementation UILabel (Attributed)
///添加下划线
- (void)throughLineStyleSingleWithText:(NSString *)text lineColor:(UIColor *)color rmbColor:(UIColor *)rmbColor rmbFont:(CGFloat)rmbFont smallDotFont:(CGFloat)dotFont{
   
    NSMutableAttributedString *string;
    
    if (rmbColor) {
        text = [NSString stringWithFormat:@"¥%@",text];
        string = [[NSMutableAttributedString alloc] initWithString:text];
        
        [string addAttributes:@{NSForegroundColorAttributeName : rmbColor} range:NSMakeRange(0, @"¥".length)];
        if (rmbFont) {
            [string addAttributes:@{NSForegroundColorAttributeName : rmbColor,NSFontAttributeName : [UIFont systemFontOfSize:rmbFont]} range:NSMakeRange(0, @"¥".length)];
        }
    }
    
    if (dotFont > 0.0) {
        NSString *fontStr = [text componentsSeparatedByString:@"."].firstObject;
        NSString *belowStr = [text componentsSeparatedByString:@"."].lastObject;
        [string addAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:dotFont]} range:NSMakeRange(fontStr.length + @".".length, belowStr.length)];
    }
    
    if (color) {
        [string addAttributes:@{NSStrikethroughStyleAttributeName : @(NSUnderlineStyleSingle),NSStrikethroughColorAttributeName : color} range:NSMakeRange(0, string.length)];
    }
    
    self.attributedText = string;
}

///添加下划线
- (void)underlineStyleSingleWithText:(NSString *)text lineColor:(UIColor *)color{
    
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:text];
    
    if (color) {
        [string addAttributes:@{NSUnderlineStyleAttributeName : @(NSUnderlineStyleSingle),NSUnderlineColorAttributeName : color} range:NSMakeRange(0, string.length)];
    }
    
    self.attributedText = string;
}

///添加颜色
- (void)attributedStringWithText:(NSString *)text color:(UIColor *)color font:(CGFloat)fontSize range:(NSRange)range{
    
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:text];
    [str addAttributes:@{NSForegroundColorAttributeName : color, NSFontAttributeName : [UIFont systemFontOfSize:fontSize]} range:range];
    
    self.attributedText = str;
}

///添加行间距
- (void)paragraphStyleWithText:(NSString *)text lineSpace:(CGFloat)lineSpace{
    self.numberOfLines = 0;
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:text];
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    style.lineSpacing = lineSpace;
    
    [str addAttributes:@{NSParagraphStyleAttributeName : style} range:NSMakeRange(0, text.length)];
    
    self.attributedText = str;
}

@end
