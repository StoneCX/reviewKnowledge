//
//  ViewController.m
//  reviewKnowledge
//
//  Created by chengxc on 2017/6/15.
//  Copyright © 2017年 chengxue. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) dispatch_source_t timer;

@end

@implementation ViewController

- (IBAction)btnClick:(id)sender {
	NSLog(@"%s",__func__);
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
	//NSLog(@"%s",__func__);
	//NSLog(@"%@",dispatch_get_global_queue(0, 0));
	//1. 创建GCD定时器
	
	/**
	 创建GCD定时器
	 
	 参数1 DISPATCH_SOURCE_TYPE_TIMER 表示是定时器
	 参数2 0 描述信息
	 参数3 0 更详细的描述信息
	 参数4 队列,决定GCD中的任务在哪个线程中执行
	 返回 定时器
	 */
	dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_global_queue(0, 0));
	
	//2. 设置定时器
	/**
	 参数1 定时器对象
	 参数2 起始时间
	 参数3 间隔时间,间隔多久执行一次
	 参数4 精准度 绝对精准0
	 */
	dispatch_source_set_timer(timer, DISPATCH_TIME_NOW, 2.0 * NSEC_PER_SEC, 0 * NSEC_PER_SEC);
	
	//3. 需要处理的事件
	dispatch_source_set_event_handler(timer, ^{
		NSLog(@"GCD---%@",[NSThread currentThread]);
	});
	//4. 启动定时器
	dispatch_resume(timer);
	
	self.timer = timer;
	
}

@end
