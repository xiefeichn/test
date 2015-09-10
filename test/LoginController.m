//
//  LoginController.m
//  test
//
//  Created by xiefei on 15/9/8.
//  Copyright (c) 2015年 xiefei. All rights reserved.
//

#import "LoginController.h"
#import "LoginViewController.h"
#define screen_width [UIScreen mainScreen].bounds.size.width
#define screen_height [UIScreen mainScreen].bounds.size.height
#define Image_height 150
static CGFloat kImageOriginHight = 200;
static CGFloat kTempHeight = 80.0f;

@interface LoginController () <UITableViewDataSource,UITableViewDelegate,UINavigationControllerDelegate>
{
    UIButton *loginBtn;
}
@end

@implementation LoginController

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    NSLog(@"dsasfafsdafdsafsdafsa");
}

- (void)viewWillAppear:(BOOL)animated {
    self.navigationController.delegate = self;
    [UINavigationBar appearance].titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor whiteColor]};//标题颜色
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"111.png"] forBarMetrics:UIBarMetricsDefault];//背景颜色
    [UINavigationBar appearance].tintColor = [UIColor whiteColor];//导航栏返回键颜色
    [UINavigationBar appearance].translucent = YES;
    [[UINavigationBar appearance] setBarStyle:UIBarStyleDefault];
}

- (void)viewWillDisappear:(BOOL)animated {
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"test.png"] forBarMetrics:UIBarMetricsDefault];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"我";
    self.myDataArray = [NSMutableArray arrayWithObjects:@"小明",@"刘德华",@"李连杰",@"孙俪",@"刘小光",@"小沈阳", nil];
    
    [self addTableAndImageView];
    [self addLoginBtn];

}

- (void)addTableAndImageView {
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 320, 568)];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = [UIColor lightGrayColor];
    self.tableView.contentInset = UIEdgeInsetsMake(kImageOriginHight, 0, 0, 0);
    [self.view addSubview:self.tableView];
    self.expandZoomImageView = [[UIImageView alloc]initWithImage:[UIImage  imageNamed:@"mibai.jpg"]];
    self.expandZoomImageView.frame = CGRectMake(0, -kImageOriginHight - kTempHeight, self.tableView.frame.size.width, kImageOriginHight + kTempHeight);
    
    [self.tableView addSubview:self.expandZoomImageView];

}
- (void)addLoginBtn {
    loginBtn = [[UIButton alloc] init];
    loginBtn.bounds = CGRectMake(0, 0, 100, 44);
    loginBtn.center = CGPointMake(self.view.center.x, 100);
    [loginBtn setTitle:@"登陆|注册" forState:UIControlStateNormal];
    [loginBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:loginBtn];
    [self.view bringSubviewToFront:loginBtn];
    [loginBtn addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
}

- (void)login {
    LoginViewController *loginControl = [[LoginViewController alloc] init];
    [self presentViewController:loginControl animated:YES completion:nil];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat yOffset  = scrollView.contentOffset.y;
//    NSLog(@"yOffset===%f",yOffset);
    CGFloat xOffset = (yOffset + kImageOriginHight)/2;
    if (yOffset < -kImageOriginHight) {
        CGRect f = self.expandZoomImageView.frame;
        f.origin.y = yOffset - kTempHeight;
        f.size.height =  -yOffset + kTempHeight;
        f.origin.x = xOffset;
        f.size.width = 320 + fabsf(xOffset)*2;
        self.expandZoomImageView.frame = f;
    }
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.myDataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *myCell = @"MyCellIndifer";
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:myCell];
    
    cell.textLabel.text = [self.myDataArray objectAtIndex:indexPath.row];
    
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
