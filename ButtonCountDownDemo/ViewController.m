//
//  ViewController.m
//  ButtonCountDownDemo
//
//  Created by Dory on 23/6/16.
//  Copyright © 2016年 www.visualogies.com. All rights reserved.
//
/**
 *  倒计时
 */

#import "ViewController.h"
#import "DLCountDownButton.h"
#import "UIButton+DLCountDown.h"
@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //UIButton子类的方法实现倒计时
    DLCountDownButton *btn = [DLCountDownButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(10, 100, 150, 50);
    btn.backgroundColor = [UIColor redColor];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn setTitle:@"子类方法获取验证码" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(count:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    
    //UIbutton分类的方法实现
    UIButton *categrayBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    categrayBtn.frame = CGRectMake(10, 200, 150, 50);
    categrayBtn.backgroundColor = [UIColor redColor];
    [categrayBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [categrayBtn setTitle:@"分类方法获取验证码" forState:UIControlStateNormal];
    [categrayBtn addTarget:self action:@selector(categrayCount:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:categrayBtn];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)count:(DLCountDownButton *)button {
    [button countDownFromTime:5 complement:^(DLCountDownButton *countDownButton) {
        [countDownButton setTitle:@"重新获取验证码" forState:UIControlStateNormal];
    }];
}

- (void)categrayCount:(UIButton *)button {
    
    [button countDownFromTime:5 withStopTitle:@"重新获取验证码"];
}


@end
