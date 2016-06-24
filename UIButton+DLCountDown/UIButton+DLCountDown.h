//
//  UIButton+DLCountDown.h
//  ButtonCountDownDemo
//
//  Created by Dory on 24/6/16.
//  Copyright © 2016年 www.visualogies.com. All rights reserved.
//

/**
 *  使用分类的方法实现倒计时功能
 */

#import <UIKit/UIKit.h>

@interface UIButton (DLCountDown)

/**
 *  倒计时
 *
 *  @param time      开始倒计时的时间
 *  @param stopTitle 倒计时结束时按钮显示的文字
 */
- (void)countDownFromTime:(NSInteger)time withStopTitle:(NSString *)stopTitle;

@end
