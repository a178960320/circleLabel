//
//  JL_TableView.m
//  ZhumengLH
//
//  Created by 住梦iOS on 2016/12/20.
//  Copyright © 2016年 scuser. All rights reserved.
//

#import "PRTween.h"
#import "JL_TableView.h"

@implementation JL_TableView{
    PRTweenOperation *activeTweenOperation;
}
- (void) doAnimatedScrollTo:(CGPoint)destinationOffset
              animationTime:(CGFloat)animationTime
{
    CGPoint offset = [self contentOffset];
    activeTweenOperation = [PRTweenCGPointLerp lerp:self property:@"contentOffset" from:offset to:destinationOffset duration:animationTime];
    
}

@end
