//
//  FirstViewController.m
//  test
//
//  Created by xiefei on 15/8/29.
//  Copyright (c) 2015年 xiefei. All rights reserved.
//

#import "FirstViewController.h"
#import "UMSocial.h"


#define screen_width [UIScreen mainScreen].bounds.size.width
#define screen_height [UIScreen mainScreen].bounds.size.height
@interface FirstViewController ()

@end

@implementation FirstViewController


- (void)viewDidLoad {
    [super viewDidLoad];

    
    
    [self setTitle:@"测试UIwebView"];
    UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, screen_width, screen_height)];
    [self.view addSubview:webView];
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://cont.app.autohome.com.cn/autov4.5/content/news/newscontent-n878096-t0.html"]]];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"分享" style:UIBarButtonItemStyleDone target:self action:@selector(shareFuction)];
    
}

- (void)shareFuction {
    [UMSocialSnsService presentSnsIconSheetView:self
                                         appKey:@"55ed892be0f55ac3dd000ae4"
                                      shareText:@"友盟社会化分享让您快速实现分享等社会化功能，www.umeng.com/social"
                                     shareImage:[UIImage imageNamed:@"icon"]
                                shareToSnsNames:[NSArray arrayWithObjects:UMShareToSina,UMShareToRenren,UMShareToQzone,UMShareToTencent,UMShareToQQ,UMShareToSms,UMShareToEmail,UMShareToDouban,UMShareToTwitter,nil] delegate:nil];

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
