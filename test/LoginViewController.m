//
//  LoginViewController.m
//  iOS-git-osc
//
//  Created by chenhaoxiang on 14-5-9.
//  Copyright (c) 2014年 chenhaoxiang. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController () <UIGestureRecognizerDelegate, UIActionSheetDelegate>

@property UIButton *submit;
@property UILabel *tips;
@property NSLayoutConstraint *inputViewConstraint;
@end

@implementation LoginViewController

@synthesize loginTableView;
@synthesize submit;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"登录";
    
    // 监听键盘
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(kbFrmWillChange:) name:UIKeyboardWillChangeFrameNotification object:nil];
    
    [self initSubviews];
    [self setLayout];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController.navigationBar setTranslucent:NO];
}

-(void)kbFrmWillChange:(NSNotification *)noti{
        NSLog(@"%@",noti.userInfo);
    // 获取窗口的高度
    CGFloat windowH = [UIScreen mainScreen].bounds.size.height;
    CGFloat windowW = [UIScreen mainScreen].bounds.size.width;
    // 键盘结束的Frm
    CGRect kbEndFrm = [noti.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    // 获取键盘结束的y值
    CGFloat kbEndY = kbEndFrm.origin.y;

    self.inputViewConstraint.constant = windowH - kbEndY;
}


- (void)viewDidAppear:(BOOL)animated {
    if (!_accountTextField.text.length || !_passwordTextField.text.length) {
        submit.alpha = 0.4;
        submit.enabled = NO;
    }
}

#pragma mark - about subviews
- (void)initSubviews {
    self.accountTextField = [UITextField new];
    self.accountTextField.placeholder = @"Email";
    self.accountTextField.textColor = [UIColor colorWithRed:56.0f/255.0f green:84.0f/255.0f blue:135.0f/255.0f alpha:1.0f];
    self.accountTextField.autocapitalizationType = UITextAutocapitalizationTypeNone;
    self.accountTextField.keyboardType = UIKeyboardTypeEmailAddress;
    self.accountTextField.delegate = self;
    self.accountTextField.returnKeyType = UIReturnKeyNext;
    self.accountTextField.enablesReturnKeyAutomatically = YES;
    
    self.passwordTextField = [UITextField new];
    self.passwordTextField.placeholder = @"Password";
    self.passwordTextField.textColor = [UIColor colorWithRed:56.0f/255.0f green:84.0f/255.0f blue:135.0f/255.0f alpha:1.0f];
    self.passwordTextField.secureTextEntry = YES;
    self.passwordTextField.delegate = self;
    self.passwordTextField.returnKeyType = UIReturnKeyDone;
    self.passwordTextField.enablesReturnKeyAutomatically = YES;
    
//    [self.accountTextField addTarget:self action:@selector(returnOnKeyboard:) forControlEvents:UIControlEventEditingDidEndOnExit];
//    [self.passwordTextField addTarget:self action:@selector(returnOnKeyboard:) forControlEvents:UIControlEventEditingDidEndOnExit];
    
    [self.view addSubview: self.accountTextField];
    [self.view addSubview: self.passwordTextField];
    
    submit = [UIButton buttonWithType:UIButtonTypeCustom];
    submit.backgroundColor = [UIColor redColor];
    [submit setTitle:@"登录" forState:UIControlStateNormal];
    submit.titleLabel.font = [UIFont systemFontOfSize:17];
    [submit addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview: submit];

    _tips = [[UILabel alloc] init];
    _tips.font = [UIFont systemFontOfSize:12];
    _tips.textColor = [UIColor grayColor];
    _tips.lineBreakMode = NSLineBreakByWordWrapping;
    _tips.numberOfLines = 0;
    _tips.text = @"tips:\n\t请使用Git@OSC的push邮箱和密码登录\n\t注册请前往 https://git.oschina.net";
    [self.view addSubview:_tips];
    
    //添加手势，点击屏幕其他区域关闭键盘的操作
    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hidenKeyboard)];
    gesture.numberOfTapsRequired = 1;
    gesture.delegate = self;
    [self.view addGestureRecognizer:gesture];
}

- (void)setLayout {
    UIImageView *loginLogo = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"111.png"]];
    loginLogo.contentMode = UIViewContentModeScaleAspectFit;
    UIImageView *email = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"email.png"]];
    email.contentMode = UIViewContentModeScaleAspectFill;
    UIImageView *password = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"test.png"]];
    password.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:loginLogo];
    [self.view addSubview:email];
    [self.view addSubview:password];
    
    for (UIView *view in [self.view subviews]) {
        view.translatesAutoresizingMaskIntoConstraints = NO;
    }
    
    NSDictionary *viewsDict = NSDictionaryOfVariableBindings(loginLogo, email, password, _accountTextField, _passwordTextField, _tips, submit);
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-40-[loginLogo(90)]-25-[email(20)]-20-[password(20)]"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:viewsDict]];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|->=50-[loginLogo(90)]->=50-|"
                                                                      options:NSLayoutFormatAlignAllCenterX
                                                                      metrics:nil
                                                                        views:viewsDict]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:loginLogo
                                                          attribute:NSLayoutAttributeCenterX
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterX
                                                         multiplier:1.f constant:0.f]];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-30-[email(20)]-[_accountTextField]-30-|"
                                                                      options:NSLayoutFormatAlignAllCenterY
                                                                      metrics:nil
                                                                        views:viewsDict]];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-30-[password(20)]-[_passwordTextField]-30-|"
                                                                      options:NSLayoutFormatAlignAllCenterY
                                                                      metrics:nil
                                                                        views:viewsDict]];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[password]->=20-[submit(35)]-20-[_tips]"
                                                                      options:NSLayoutFormatAlignAllLeft
                                                                      metrics:nil
                                                                        views:viewsDict]];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_passwordTextField]-30-[submit]"
                                                                      options:NSLayoutFormatAlignAllRight
                                                                      metrics:nil
                                                                        views:viewsDict]];
}

- (void)hidenKeyboard {
    [_accountTextField resignFirstResponder];
    [_passwordTextField resignFirstResponder];
}

@end
