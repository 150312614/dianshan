//
//  LHNewsViewController.m
//  生活圈项目
//
//  Created by 赖文辉 on 15/8/10.
//  Copyright (c) 2015年 赖文辉. All rights reserved.
//

#import "LHNewsViewController.h"

@interface LHNewsViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation LHNewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.titleLabel.text=@"热点";
    self.leftBtn.hidden=YES;
    NSURL *url=[NSURL URLWithString:@"http://www.qd-life.com/news&src=webview"];
    NSURLRequest *req=[NSURLRequest requestWithURL:url];
    [self.webView loadRequest:req];
    self.webView.scalesPageToFit=YES;
    
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
