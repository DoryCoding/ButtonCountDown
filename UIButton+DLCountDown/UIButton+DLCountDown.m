//
//  UIButton+DLCountDown.m
//  ButtonCountDownDemo
//
//  Created by Dory on 24/6/16.
//  Copyright © 2016年 www.visualogies.com. All rights reserved.
//



#import "UIButton+DLCountDown.h"

@implementation UIButton (DLCountDown)

- (void)countDownFromTime:(NSInteger)time withStopTitle:(NSString *)stopTitle {

    
    __weak typeof(self) weakSelf = self;
    
    // 剩余的时间
    __block NSInteger remainTime = time;
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    // 每秒执行一次
    dispatch_source_set_timer(timer, DISPATCH_TIME_NOW, 1.0 * NSEC_PER_SEC, 0 * NSEC_PER_SEC);
    
    // 子线程（queue）执行event_handler
    dispatch_source_set_event_handler(timer, ^{
        
        if (remainTime <= 0) { // 倒计时结束
            dispatch_source_cancel(timer);
            // 主线程更新UI
            dispatch_async(dispatch_get_main_queue(), ^{
                [weakSelf setTitle:stopTitle forState:UIControlStateNormal];
                weakSelf.enabled = YES;
            });
        } else {
            NSString *timeStr = [NSString stringWithFormat:@"%ld", remainTime];
            dispatch_async(dispatch_get_main_queue(), ^{
                [weakSelf setTitle:[NSString stringWithFormat:@"%@s后重新发送",timeStr] forState:UIControlStateNormal];
                weakSelf.enabled = NO;
            });
            remainTime--;
        }
    });
    dispatch_resume(timer);
}


@end
