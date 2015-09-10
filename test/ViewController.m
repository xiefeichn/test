//
//  ViewController.m
//  test
//
//  Created by xiefei on 15/8/23.
//  Copyright (c) 2015年 xiefei. All rights reserved.
//

#import "ViewController.h"
#import "HideTabBarController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"下一个controller隐藏tabbar";
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"下一个" style:UIBarButtonItemStylePlain target:self action:@selector(pushNextControl)];
}

-(void)pushNextControl {
    HideTabBarController *nextControl = [[HideTabBarController alloc] init];
    [nextControl hidesBottomBarWhenPushed];
    [self.navigationController pushViewController:nextControl animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
