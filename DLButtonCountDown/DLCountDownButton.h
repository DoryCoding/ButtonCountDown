//
//  DLButton.h
//  ButtonCountDownDemo
//
//  Created by Dory on 23/6/16.
//  Copyright © 2016年 www.visualogies.com. All rights reserved.
//
/**
 *  使用按钮的子类实现倒计时功能
 */
#import <UIKit/UIKit.h>

@interface DLCountDownButton : UIButton

/**
 *  开始倒计时
 *
 *  @param startTime  倒计时时间
 *  @param complement 倒计时结束执行的block
 */
- (void)countDownFromTime:(NSInteger)startTime complement:(void(^)(DLCountDownButton *countDownButton))complement;

@end
