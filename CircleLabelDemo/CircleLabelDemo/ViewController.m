//
//  ViewController.m
//  CircleLabelDemo
//
//  Created by 住梦iOS on 2017/5/19.
//  Copyright © 2017年 qiongjiwuxian. All rights reserved.
//

#import "ViewController.h"
#import "JL_CircleLabel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //初始化轮播
    JL_CircleLabel *label = [[JL_CircleLabel alloc] initWithFrame:CGRectMake(0,100, self.view.frame.size.width, 50)];
    
    //设置数据源
    label.dataArray = @[@"大家好啊！",@"你们好啊!",@"我们好啊!",@"全部都好啊!"];
    //动画开始
//    [label timerStart];
    
    //文本点击回调
    label.actionBlock = ^(NSInteger index) {
        NSLog(@"%ld",index);
        
    };
    
    [self.view addSubview:label];
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
