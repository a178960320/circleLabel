# 文本轮播控件


## 如何使用
```Objective-C
//初始化轮播
JL_CircleLabel *circleLabel = [[JL_CircleLabel alloc] initWithFrame:CGRectMake(0,100, self.view.frame.size.width, 50)];

//设置数据源
circleLabel.dataArray = @[@"大家好啊！",@"你们好啊!",@"我们好啊!",@"全部都好啊!"];

//文本点击回调
label.actionBlock = ^(NSInteger index) {
   NSLog(@"%ld",index);      
};
```

## circleLabel属性设置
```Objective-C
//轮播一次的时间，默认为2秒
circleLabel.scrollTime = 3;
    
//文本字体，默认为13号
circleLabel.font = [UIFont systemFontOfSize:15];
    
//文本颜色，默认为灰色
circleLabel.textColor = [UIColor redColor];
```

## 关于
circleLabel是使用tableview控件实现文本的加载，同时使用PRTween完成文本轮播的动画，使其看起来不像系统的contentoffset动画时那么突兀。
