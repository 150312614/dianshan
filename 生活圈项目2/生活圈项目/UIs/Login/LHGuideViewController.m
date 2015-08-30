//
//  LHGuideViewController.m
//  生活圈项目
//
//  Created by 赖文辉 on 15/8/9.
//  Copyright (c) 2015年 赖文辉. All rights reserved.
//

#import "LHGuideViewController.h"
#import "LHFunction.h"

@interface LHGuideViewController ()

@end

@implementation LHGuideViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    scrollView.contentSize = CGSizeMake(3 * kUIScreenWidth, 0);
    scrollView.pagingEnabled = YES;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;

    [self.view addSubview:scrollView];
    
    
    for (int i = 0; i < 3; i++)
    {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.frame = CGRectMake(i * kUIScreenWidth, 0, kUIScreenWidth, kUIScreenHeight);
        NSString *imageStr = [NSString stringWithFormat:@"guide_%d",i];
        
        imageView.image = [UIImage imageNamed:imageStr];
        [scrollView addSubview:imageView];
        if (i == 2) {
            imageView.userInteractionEnabled = YES;
            
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(enter)];
            
            [imageView addGestureRecognizer:tap];
        }
        
    }
    
}


- (void)enter
{
    [[NSNotificationCenter defaultCenter] postNotificationName:kEnterVC object:nil];
    
    [LHFunction saveBoolWith:YES forKey:kFirstLaunch];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    
}


@end
