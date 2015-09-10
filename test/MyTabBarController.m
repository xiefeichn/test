//
//  MyTabBarController.m
//  test
//
//  Created by xiefei on 15/8/23.
//  Copyright (c) 2015年 xiefei. All rights reserved.
//

#import "MyTabBarController.h"
#import "ViewController.h"
#import "FirstViewController.h"
#import "LoginController.h"
@interface MyTabBarController ()

@end

@implementation MyTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    //创建子视图控制器
    FirstViewController *v1 = [[FirstViewController alloc] init];
    ViewController *v2 = [[ViewController alloc] init];
    LoginController *v3 = [[LoginController alloc] init];
    v1.view.backgroundColor = [UIColor whiteColor];
    v2.view.backgroundColor = [UIColor orangeColor];
    v3.view.backgroundColor = [UIColor yellowColor];
    UINavigationController *nav1 = [[UINavigationController alloc] initWithRootViewController:v1];
    UINavigationController *nav2 = [[UINavigationController alloc] initWithRootViewController:v2];
    UINavigationController *nav3 = [[UINavigationController alloc] initWithRootViewController:v3];
    //添加子视图控制器
    self.viewControllers = @[nav1,nav2,nav3];
    self.tabBar.translucent = NO;
 
    self.tabBar.tintColor = [UIColor greenColor];
    //获取tabbar上的item
//    UITabBarItem *item1 = [self.tabBar.items objectAtIndex:0];
//    UITabBarItem *item2 = [self.tabBar.items objectAtIndex:1];
//    UITabBarItem *item3 = [self.tabBar.items objectAtIndex:2];
//    UITabBarItem *item4 = [self.tabBar.items objectAtIndex:3];
//    [item1 setTitle:@"aa"];
//    [item2 setTitle:@"bb"];
//    [item3 setTitle:@"cc"];
//    [item4 setTitle:@"dd"];
//    [NSThread deta]
//    NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(method) object:nil];
//    [thread start];
//    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(fuck) userInfo:nil repeats:YES];
//    [timer fire];
//    NSTimer *timer = [NSTimer timerWithTimeInterval:1 target:self selector:@selector(fuck) userInfo:nil repeats:YES];
//    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
}

- (void)fuck
{
    NSLog(@"fuck");
}

- (void)stop:(NSThread *)thread
{
    NSLog(@"aaaa");
    [NSThread exit];
    NSLog(@"aaaa");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
