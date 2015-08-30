//
//  LHLoginViewController.m
//  生活圈项目
//
//  Created by apple on 15/8/16.
//  Copyright (c) 2015年 赖文辉. All rights reserved.
//

#import "LHLoginViewController.h"
#import "LHTabBarBaseViewController.h"
#import "LHLoginCollectionViewCell.h"
#import "SSKeychain.h"
#import "DSUserInfo.h"

@interface LHLoginViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>

// 第三方的数据
@property (nonatomic, strong) NSMutableArray *shareArray;

// 第三方
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *collectionFlow;

// 账户View

@property (weak, nonatomic) IBOutlet UIView *userView;
@property (weak, nonatomic) IBOutlet UIImageView *userIcon;
@property (weak, nonatomic) IBOutlet UITextField *userFiled;

// 密码

@property (weak, nonatomic) IBOutlet UIView *passwordView;

@property (weak, nonatomic) IBOutlet UIImageView *passwordIcon;

@property (weak, nonatomic) IBOutlet UITextField *passwordFiled;


// 记住密码
@property (weak, nonatomic) IBOutlet UIButton *remmberBtn;
// 忘记密码
@property (weak, nonatomic) IBOutlet UIButton *forgetBtn;

@property (weak, nonatomic) IBOutlet UIButton *loginBtn;


- (IBAction)loginBtnClick;

- (IBAction)registBtnClick;

- (IBAction)remmberBtnClick:(id)sender;

@end

@implementation LHLoginViewController

-(void)awakeFromNib
{
    _shareArray = [NSMutableArray array];
    
    [_shareArray addObject:@{@"name":@"新浪",@"icon":@"login_wb"}];
    [_shareArray addObject:@{@"name":@"QQ",@"icon":@"login_qq"}];
    [_shareArray addObject:@{@"name":@"微信",@"icon":@"login_wx"}];
    [_shareArray addObject:@{@"name":@"豆瓣",@"icon":@"login_db"}];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.titleLabel.text = @"登陆";
    
    _userView.backgroundColor = Login_Light_Color;
    _userView.layer.cornerRadius = 5;
    _userView.clipsToBounds = YES;
    _userIcon.backgroundColor = Login_Deep_Color;
    
    
    _passwordView.backgroundColor = Login_Light_Color;
    _passwordView.layer.cornerRadius = 5;
    _passwordView.clipsToBounds = YES;
    _passwordIcon.backgroundColor = Login_Deep_Color;
    _passwordFiled.secureTextEntry = YES;
    
    [_remmberBtn setTitleColor:Login_Light_Color forState:UIControlStateNormal];
//    [_forgetBtn setTitleColor:Login_Light_Color forState:UIControlStateNormal];
    
    //下划线
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:@"忘记密码"];
    NSRange strRange = {0,[str length]};
    [str addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:strRange];
    [str addAttribute:NSForegroundColorAttributeName value:[UIColor cyanColor] range:strRange];
    [_forgetBtn setAttributedTitle:str forState:UIControlStateNormal];
    
    _forgetBtn.backgroundColor = [UIColor whiteColor];
    _forgetBtn.layer.cornerRadius = 5;
    _forgetBtn.clipsToBounds = YES;
    _forgetBtn.enabled = NO;
    [_forgetBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
//
    _collectionFlow.itemSize = CGSizeMake(_collectionView.frame.size.width / 4, _collectionView.frame.size.height);
    
    _loginBtn.selected = NO;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
    // 注册通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeLoginButtonStatus) name:UITextFieldTextDidChangeNotification object:nil];
    
    // 读取账号
    BOOL flag = [LHFunction getBoolForKey:@"login_remmenber"];
    if (flag) {
        
        [_remmberBtn setImage:[UIImage imageNamed:@"btn_selected"] forState:UIControlStateNormal];
        _remmberBtn.selected = YES;
        
        NSString *userName = [LHFunction getObjectValueFromKey:@"login_userName"];
        if (userName != nil) {
            _userFiled.text = userName;
            
            _passwordFiled.text = [SSKeychain passwordForService:[NSBundle mainBundle].bundleIdentifier account:userName];
            
            _loginBtn.enabled = YES;
        }
        
    }else{
    
        [_remmberBtn setImage:[UIImage imageNamed:@"btn_normal"] forState:UIControlStateNormal];
        _remmberBtn.selected = NO;
    
    }
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    // 移除通知
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextFieldTextDidChangeNotification object:nil];
}

#pragma mark - 改变login按钮

-(void)changeLoginButtonStatus
{
    if (_userFiled.text.length > 0 && _passwordFiled.text.length > 0) {
        _loginBtn.enabled = YES;
    }else{
    
        _loginBtn.enabled = NO;
    }
}

#pragma mark -  处理键盘消失

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [_userFiled resignFirstResponder];
    [_passwordFiled resignFirstResponder];
}



#pragma mark - UICollectionViewDataSource

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _shareArray.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    LHLoginCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"LHLoginCollectionViewCell" forIndexPath:indexPath];
    
    cell.dict = _shareArray[indexPath.row];
    return cell;
}




-(void)backMethod
{
    [self.navigationController popViewControllerAnimated:YES];
    LHTabBarBaseViewController *tab =  (LHTabBarBaseViewController *)[UIApplication sharedApplication].keyWindow.rootViewController;
    
    [tab tabBarHidden:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 登录
- (IBAction)loginBtnClick {
    
    [self showLoadView];
    
    // 定义一个装参数的字典
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    
    [param setObject:_userFiled.text forKey:@"curr_account"];
    [param setObject:_passwordFiled.text forKey:@"password"];
    [param setObject:[LHFunction getTimeScamp] forKey:@"time"];
    NSArray *signArray = @[APP_ID,param[@"password"],param[@"time"],APP_IDENGER];
    
    [param setObject:[LHFunction md5StringFromArray:signArray] forKey:@"sign"];
    [param setObject:APP_ID forKey:@"app_id"];
    
    [LHHTTPClient LHPOST:@"/index.php?anu=api/1/user/dispose_login" parameters:param successBlcok:^(id data) {
        
        [self hidenLoadView];
        // 保存密码
        [LHFunction saveObjectValue:_userFiled.text withKey:@"Login_userName"];
        
        [SSKeychain setPassword:_passwordFiled.text forService:[NSBundle mainBundle].bundleIdentifier account:_userFiled.text];
        
        [[DSUserInfo shareInatance] instanceWithDictionary:data];
        [LHFunction saveUserInfo:data];
        
        NSLog(@"%@",data);
        
        [self backMethod];
        
        
    } failureBlcok:^(NSError *error) {
        
        [self hidenLoadView];
        
    } errorBlcok:^(id error) {
        
        [self showErroeMessage:@"账号或密码错误，请重新登录"];
    
            [self hidenLoadView];
        
    }];
    
}

- (IBAction)registBtnClick {
}

#pragma mark -  记住密码
- (IBAction)remmberBtnClick:(id)sender {
    
    _remmberBtn.selected = !_remmberBtn.selected;
    if (_remmberBtn.selected) {
        [_remmberBtn setImage:[UIImage imageNamed:@"btn_selected"] forState:UIControlStateNormal];
        _remmberBtn.selected = YES;
    }else{
    
        [_remmberBtn setImage:[UIImage imageNamed:@"btn_normal"] forState:UIControlStateNormal];
        _remmberBtn.selected = NO;
    }
    [LHFunction saveBoolWith:_remmberBtn.selected forKey:@"login_remmenber"];
    
}
@end
