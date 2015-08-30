//
//  LHBaseViewController.m
//  生活圈项目
//
//  Created by 赖文辉 on 15/8/9.
//  Copyright (c) 2015年 赖文辉. All rights reserved.
//

#import "LHBaseViewController.h"
#import "MBProgressHUD.h"
#import "UIView+Toast.h"

@interface LHBaseViewController ()

@property (nonatomic,strong) MBProgressHUD *HUD;

@end

@implementation LHBaseViewController\

#pragma mark - 懒加载

-(NSMutableDictionary *)prar
{
    if (_prar == nil) {
        _prar = [NSMutableDictionary dictionary];
    }
    return _prar;
}



-(NSMutableArray *)array
{
    if (_array == nil)
    {
        _array = [NSMutableArray array];
        
    }
    return _array;
}



- (MBProgressHUD *)HUD
{
    if (_HUD == nil)
    {
        _HUD = [[MBProgressHUD alloc] initWithView:self.view];
    }
    return _HUD;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.view.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255) / 255.0 green:arc4random_uniform(255) / 255.0 blue:arc4random_uniform(255) / 255.0 alpha:1.0];
}


- (void)showLoadView
{
    [self.HUD show:YES];
    
    [self.view addSubview:self.HUD];
}
- (void)hidenLoadView
{
    if (self.HUD != nil)
    {
        [self.HUD hide:YES];
        [self.HUD removeFromSuperViewOnHide];
        
        self.HUD = nil;
    }
}


- (void)showErroeMessage:(NSString *)message;
{
    [self.view makeToast:message];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
