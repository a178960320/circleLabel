//
//  JL_CircleLabel.h
//  ZhumengLH
//
//  Created by 住梦iOS on 2016/12/19.
//  Copyright © 2016年 scuser. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^actionBlock)(NSInteger index);
@interface JL_CircleLabel : UIView

//数据源数组
@property (nonatomic,copy) NSArray *dataArray;
//字体，默认13号
@property (nonatomic,strong) UIFont *font;
//文本颜色，默认灰色
@property (nonatomic,strong) UIColor *textColor;
//文本切换时间间隔,默认2秒
@property (nonatomic,assign) NSTimeInterval scrollTime;
//文本点击回调的bolck
@property (nonatomic,copy) actionBlock actionBlock;



//初始化方法
-(instancetype) initWithFrame:(CGRect)frame;
//定时器开始，一般在view重新出现的时候调用。
-(void) timerStart;
//定时器暂停,一般在view消失的时候可以调用。
-(void) timerPause;



@end
