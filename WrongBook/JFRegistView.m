//
//  JFRegistView.m
//  WrongBook
//
//  Created by apple on 2017/7/28.
//  Copyright © 2017年 lab. All rights reserved.
//

#import "JFRegistView.h"
#import "Tools.h"

@interface JFRegistView()

@property (nonatomic, strong) UITextField *phoneNumber;

@property (nonatomic, strong) UITextField *password;

@property (nonatomic, strong) UITextField *verity;

@property (nonatomic, strong) UIButton *verityButton;

@property (nonatomic, strong) UIButton *registButton;

@property (nonatomic, weak) JFBaseViewController *rootViewController;

@property  (nonatomic, assign) NSInteger time;
@property (nonatomic,strong) NSTimer *timer;


@end

@implementation JFRegistView


- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = COLOR_BACKGROUND;
        
        _time = 60;
        UIView *backView1 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenW, 40)];
        backView1.backgroundColor = [UIColor whiteColor];
        
        
        _phoneNumber = [[UITextField alloc]initWithFrame:CGRectMake(30, 5, ScreenW-60, 30)];
        _phoneNumber.placeholder = @"请输入手机号";
        _phoneNumber.backgroundColor = [UIColor clearColor];
        
        
        
        UIView *backView2 = [[UIView alloc]initWithFrame:CGRectMake(0, View_Y_HEIGHT(backView1)-9, ScreenW, 40)];
        backView2.backgroundColor = [UIColor whiteColor];
        
        
        _password = [[UITextField alloc]initWithFrame:CGRectMake(30, 5, ScreenW-60, 30)];
        _password.placeholder = @"请输入密码";
        _password.backgroundColor = [UIColor clearColor];
        
        
        
        UIView *backView3 = [[UIView alloc]initWithFrame:CGRectMake(0, View_Y_HEIGHT(backView2)-9, ScreenW, 40)];
        backView3.backgroundColor = [UIColor whiteColor];
        
        _verity = [[UITextField alloc]initWithFrame:CGRectMake(30, 5, ScreenW-60-80, 30)];
        _verity.placeholder = @"请输入验证码";
        _verity.backgroundColor = [UIColor clearColor];
        
        
        _verityButton = [[UIButton alloc]initWithFrame:CGRectMake(ScreenW-110, 5, 80, 30)];
        _verityButton.layer.cornerRadius = 8;
        _verityButton.clipsToBounds = YES;
        _verityButton.titleLabel.font = FONT(14);
        [_verityButton setTitle:@"验证码" forState:UIControlStateNormal];
        [_verityButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_verityButton setBackgroundColor:COLOR_MAIN];
        [_verityButton addTarget:self action:@selector(verityAction) forControlEvents:UIControlEventTouchUpInside];
        
        _registButton = [[UIButton alloc]initWithFrame:CGRectMake(ScreenW/2-120, View_Y_HEIGHT(backView3)+60, 240, 35)];
        _registButton.layer.cornerRadius = 8;
        _registButton.clipsToBounds = YES;
        [_registButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_registButton setTitle:@"提交" forState:UIControlStateNormal];
        [_registButton setBackgroundColor:COLOR_DISABLE_BG];
        [_registButton addTarget:self action:@selector(registAction) forControlEvents:UIControlEventTouchUpInside];


        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(passWordTextChange:) name:UITextFieldTextDidChangeNotification object:_password];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(userNameTextChange:) name:UITextFieldTextDidChangeNotification object:_phoneNumber];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(captchaTextChange:) name:UITextFieldTextDidChangeNotification object:_verity];
        
        
        _phoneNumber.font = FONT(14);
        _password.font = FONT(14);
        _verity.font = FONT(14);
        
        [self addSubview:backView1];
        [backView1 addSubview:_phoneNumber];
        
        [self addSubview:backView2];
        [backView2 addSubview:_password];

        [self addSubview:backView3];
        [backView3 addSubview:_verity];
        [backView3 addSubview:_verityButton];
        
        [self addSubview:_registButton];
        
    }
    return self;
}


- (void)verityAction{
    if([Tools checkPhone:_phoneNumber.text]) {
        _timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(getVerity) userInfo:nil repeats:YES];
        
    }else{
        [_rootViewController textStateHUD:@"手机号不正确"];
    }
    
}


- (void)registAction{
    
    
}

- (void)getVerity{
    if(_time <= 0){
        [_timer invalidate];
        _time = 61;
        self.verityButton.enabled = YES;
        [self.verityButton setTitle:@"验证码" forState:UIControlStateNormal];
        [self.verityButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self.verityButton setBackgroundColor:COLOR_MAIN];
    }else{
        self.verityButton.enabled = NO;
        self.verityButton.titleLabel.text = StringFormat(@"%ld",(long)_time);
        [self.verityButton setTitle:StringFormat(@"%ld",(long)_time) forState:UIControlStateNormal];
        [self.verityButton setTitleColor:COLOR_MAIN forState:UIControlStateNormal];
        [self.verityButton setBackgroundColor:COLOR_DISABLE_BG];
    }
    _time--;
    
}

- (void)showInController:(JFBaseViewController *)rootViewController{
    
    _rootViewController = rootViewController;
    
    [_rootViewController.view addSubview:self];
    
}

- (void)passWordTextChange:(id)sender {
    [self changeButtonState];
}

- (void)userNameTextChange:(id)sender {
    [self changeButtonState];
}

- (void)captchaTextChange:(id)sender {
    [self changeButtonState];
}

- (void)changeButtonState{
    if(_phoneNumber.text.length != 0 && _verity.text.length != 0 && _password.text.length != 0){
        _registButton.backgroundColor = COLOR_MAIN;
        _registButton.enabled = YES;
    }else{
        _registButton.backgroundColor = COLOR_DISABLE_BG;
        _registButton.enabled = NO;
    }
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
