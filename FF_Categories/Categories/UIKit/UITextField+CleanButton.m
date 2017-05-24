//
//  UITextField+CleanButton.m
//  caifumap
//
//  Created by fanxiaobin on 2017/5/24.
//  Copyright © 2017年 EIMS. All rights reserved.
//

#import "UITextField+CleanButton.h"

@implementation UITextField (CleanButton)

- (void)modifyCleanButtonImage{
    
    UIButton *button = [self valueForKey:@"_clearButton"];
    [button setImage:[UIImage imageNamed:@"login_cleanBtn"] forState:UIControlStateNormal];
}

@end
