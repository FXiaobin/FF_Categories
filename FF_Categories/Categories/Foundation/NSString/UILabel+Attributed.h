//
//  UILabel+Attributed.h
//  FFLabel
//
//  Created by IOS开发 on 2018/3/27.
//  Copyright © 2018年 YuanHui. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Attributed)

///添加删除线
- (void)throughLineStyleSingleWithText:(NSString *)text lineColor:(UIColor *)color rmbColor:(UIColor *)rmbColor rmbFont:(CGFloat)rmbFont smallDotFont:(CGFloat)dotFont;

///添加下划线
- (void)underlineStyleSingleWithText:(NSString *)text lineColor:(UIColor *)color;

///添加颜色
- (void)attributedStringWithText:(NSString *)text color:(UIColor *)color font:(CGFloat)fontSize range:(NSRange)range;

///添加行间距
- (void)paragraphStyleWithText:(NSString *)text lineSpace:(CGFloat)lineSpace;



@end
