//
//  JL_TableView.h
//  ZhumengLH
//
//  Created by 住梦iOS on 2016/12/20.
//  Copyright © 2016年 scuser. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JL_TableView : UITableView
//通过prtween对tableview的contentoffset做动画效果，系统自带的动画效果太快，有点突兀。
- (void) doAnimatedScrollTo:(CGPoint)destinationOffset
              animationTime:(CGFloat)animationTime;
@end
