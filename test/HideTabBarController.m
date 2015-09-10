//
//  HideTabBarController.m
//  test
//
//  Created by xiefei on 15/9/9.
//  Copyright (c) 2015年 xiefei. All rights reserved.
//

#import "HideTabBarController.h"

@interface HideTabBarController ()

@end

@implementation HideTabBarController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNi {
    self = [[[NSBundle mainBundle] loadNibNamed:@"HideTabBarController" owner:nil options:nil] lastObject];
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
