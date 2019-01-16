//
//  JFLoginView.m
//  WrongBook
//
//  Created by apple on 2017/7/23.
//  Copyright © 2017年 lab. All rights reserved.
//

#import "JFLoginView.h"
#import "JFForgetViewController.h"
#import "JFRegistViewController.h"


@interface JFLoginView ()<UITextFieldDelegate>

@property (strong, nonatomic) UITextField *phoneNumber;

@property (strong, nonatomic) UITextField *password;

@property (strong, nonatomic) UIButton *loginButton;

@property (strong, nonatomic) UIButton *forgetPassword;

@property (strong, nonatomic) UIButton *registerButton;

@property (nonatomic, weak) JFBaseViewController *rootViewController;

@end


@implementation JFLoginView


- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
    
    
        UIImageView *backImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"登录背景"]];
        backImage.frame = CGRectMake(0, 0, ScreenW, ScreenH);
//        [self addSubview:backImage];
        self.frame = CGRectMake(0,0,ScreenW,ScreenH);
        
        UIImageView *logoImageView = [[UIImageView alloc]initWithFrame:CGRectMake(ScreenW/2-40, 100, 80, 90)];
        logoImageView.image = [UIImage imageNamed:@"登录logo"];
        
         UIImageView *phoneImage = [[UIImageView alloc]initWithFrame:CGRectMake(50, View_Y_HEIGHT(logoImageView)+70, 18, 18)];
        phoneImage.image = [UIImage imageNamed:@"用户"];
        
        _phoneNumber = [[UITextField alloc]initWithFrame:CGRectMake(View_X_WIDTH(phoneImage)+20, phoneImage.frame.origin.y-6, ScreenW-147, 30)];
        _phoneNumber.borderStyle = UITextBorderStyleNone;
        _phoneNumber.placeholder = @"请输入手机号";
        _phoneNumber.backgroundColor = [UIColor clearColor];
        _phoneNumber.delegate = self;
        _phoneNumber.enabled = YES;
        
        UIView *lineView1 = [[UIView alloc]initWithFrame:CGRectMake(50, View_Y_HEIGHT(_phoneNumber)-10, ScreenW-100, 1)];
        lineView1.backgroundColor = [UIColor grayColor];
        
        UIImageView *passwordImage = [[UIImageView alloc]initWithFrame:CGRectMake(50, View_Y_HEIGHT(phoneImage)+20, 18, 18)];
        passwordImage.image = [UIImage imageNamed:@"锁"];
        
        _password = [[UITextField alloc]initWithFrame:CGRectMake(View_X_WIDTH(passwordImage)+20, passwordImage.frame.origin.y-6, ScreenW-147, 30)];
        _password.borderStyle = UITextBorderStyleNone;
        _password.placeholder = @"请输入密码";
        _password.backgroundColor = [UIColor clearColor];
        _password.delegate = self;
        _password.enabled = YES;
        _password.secureTextEntry = YES;
        
        
        UIView *lineView2 = [[UIView alloc]initWithFrame:CGRectMake(50, View_Y_HEIGHT(_password)-10, ScreenW-100, 1)];
        lineView2.backgroundColor = [UIColor grayColor];
        
        _loginButton = [[UIButton alloc]initWithFrame:CGRectMake(50, View_Y_HEIGHT(lineView2)+50, ScreenW-100, 35)];
        _loginButton.enabled = NO;
        _loginButton.layer.cornerRadius = 8;
        _loginButton.clipsToBounds = YES;
        [_loginButton setTitle:@"登录" forState:UIControlStateNormal];
        [_loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_loginButton setBackgroundColor:COLOR_DISABLE_BG];
        [_loginButton addTarget:self action:@selector(loginAction) forControlEvents:UIControlEventTouchUpInside];
        
        _forgetPassword = [[UIButton alloc]initWithFrame:CGRectMake(50, View_Y_HEIGHT(_loginButton)+10, 70, 20)];
        _forgetPassword.titleLabel.font = FONT(12);
        [_forgetPassword setTitle:@"忘记密码？" forState:UIControlStateNormal];
        [_forgetPassword setTitleColor:COLOR_MAIN forState:UIControlStateNormal];
        [_forgetPassword setBackgroundColor:[UIColor clearColor]];
        [_forgetPassword addTarget:self action:@selector(forgetAction) forControlEvents:UIControlEventTouchUpInside];
        
        _registerButton = [[UIButton alloc]initWithFrame:CGRectMake(ScreenW-110, View_Y_HEIGHT(_loginButton)+10, 60, 20)];
        _registerButton.titleLabel.font = FONT(12);
        [_registerButton setTitle:@"点击注册" forState:UIControlStateNormal];
        [_registerButton setTitleColor:COLOR_MAIN forState:UIControlStateNormal];
        [_registerButton setBackgroundColor:[UIColor clearColor]];
        [_registerButton addTarget:self action:@selector(registerAction) forControlEvents:UIControlEventTouchUpInside];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(phoneNumTextFieldChanged:) name:UITextFieldTextDidChangeNotification object:_phoneNumber];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(passWDTextFieldChanged:) name:UITextFieldTextDidChangeNotification object:_password];
        
        _phoneNumber.font = FONT(14);
        _password.font = FONT(14);
        
        [self addSubview:backImage];
        [self addSubview:logoImageView];
        
        [self addSubview:phoneImage];
        [self addSubview:_phoneNumber];
        [self addSubview:lineView1];
        
        [self addSubview:passwordImage];
        [self addSubview:_password];
        [self addSubview:lineView2];
        
        [self addSubview:_loginButton];
        [self addSubview:_forgetPassword];
        [self addSubview:_registerButton];
    }
    
    return self;
}


-(void)phoneNumTextFieldChanged:(id)sender{
    [self changeButtonState];
}

- (void)passWDTextFieldChanged:(id)sender{
    [self changeButtonState];
}



- (void)changeButtonState{
    if(_phoneNumber.text.length != 0 && _password.text.length != 0){
        _loginButton.backgroundColor = COLOR_MAIN;
        _loginButton.enabled = YES;
    }else{
        _loginButton.backgroundColor = COLOR_DISABLE_BG;
        _loginButton.enabled = NO;
    }
}
- (void)loginAction {


    if ([_phoneNumber.text  isEqual: @"18267930116"]&&[_password.text  isEqual: @"154062261"]) {
        [_rootViewController.navigationController dismissViewControllerAnimated:YES completion:nil];
    }

}

- (void)forgetAction {
    JFForgetViewController *controller = [[JFForgetViewController alloc]init];
    [_rootViewController.navigationController pushViewController:controller animated:YES];
    
    NSLog(@"忘记密码");

}

- (void)registerAction {

    JFRegistViewController *controller = [[JFRegistViewController alloc]init];
    [_rootViewController.navigationController pushViewController:controller animated:YES];
    NSLog(@"注册");
}





- (void)showInController:(JFBaseViewController *)rootViewController{
    
    _rootViewController = rootViewController;
    
    [_rootViewController.view addSubview:self];
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self endEditing:YES];
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    NSLog(@"textFieldShouldReturn");
    [textField resignFirstResponder];
    return YES;
}
- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextFieldTextDidChangeNotification object:nil];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
