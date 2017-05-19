//
//  JL_CircleLabel.m
//  ZhumengLH
//
//  Created by 住梦iOS on 2016/12/19.
//  Copyright © 2016年 scuser. All rights reserved.
//

#import "JL_CircleLabel.h"
#import "JL_TableView.h"

@interface JL_CircleLabel()<UITableViewDelegate,UITableViewDataSource>

//属性
@property (nonatomic,strong) JL_TableView *tableView;

@property (nonatomic,strong) NSTimer *timer;

@end

@implementation JL_CircleLabel{
    NSInteger _index;
}


-(instancetype) initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.tableView];
    }
    return self;
}

#pragma mark - get set方法
-(NSTimer *)timer{
    if (!_timer) {
        _index = 0;
        NSTimer *timer = [NSTimer timerWithTimeInterval:self.scrollTime ? self.scrollTime : 2 target:self selector:@selector(scrollAnimate) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop]addTimer:timer forMode:NSRunLoopCommonModes];
        _timer = timer;
        //暂停定时器
        _timer.fireDate = [NSDate distantFuture];
    }
    return _timer;
}

-(void)setDataArray:(NSArray *)dataArray{
    _dataArray = dataArray;
    NSLog(@"%@",self.dataArray);
    [self.tableView reloadData];
    
    [self timerStart];
}
-(UIFont *)font{
    if (!_font) {
        _font = [UIFont systemFontOfSize:13];
    }
    return _font;
}
-(UIColor *)textColor{
    if (!_textColor) {
        _textColor = [UIColor lightGrayColor];
    }
    return _textColor;
}
#pragma mark - 懒加载
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[JL_TableView alloc] initWithFrame:self.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:UITableViewCell.self forCellReuseIdentifier:@"cell"];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.scrollEnabled = NO;
        _tableView.rowHeight = self.frame.size.height;
    }
    return _tableView;
}
#pragma mark - tableView的协议方法
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    if (self.dataArray.count > 0 ) {
        cell.textLabel.text = self.dataArray[indexPath.row%self.dataArray.count];
    }
    
    cell.textLabel.font = self.font;
    cell.textLabel.textColor = self.textColor;
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count*5000;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.actionBlock) {
        self.actionBlock(indexPath.row%self.dataArray.count);
    }
    
}
#pragma mark - 定时器开始,暂停
-(void)timerStart {
    if (self.dataArray.count < 2) {
        return;
    }
    self.timer.fireDate = [NSDate distantPast];
}
-(void)timerPause{
    self.timer.fireDate = [NSDate distantFuture];
}
#pragma mark - 定时器触发的方法
-(void) scrollAnimate{
    
    [self.tableView doAnimatedScrollTo:CGPointMake(0, _index*self.frame.size.height) animationTime:0.5];
//    [self.tableView setContentOffset:CGPointMake(0, _index*self.frame.size.height) animated:YES];
    
    
    _index += 1;
}
#pragma mark - 定期器销毁
-(void)dealloc{
    [self.timer invalidate];
    self.timer = nil;
}
@end
