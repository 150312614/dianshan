//
//  LHShopHeaderTableViewCell.m
//  生活圈项目
//
//  Created by mac on 15/8/16.
//  Copyright (c) 2015年 赖文辉. All rights reserved.
//

#import "LHShopHeaderTableViewCell.h"
#import "LHLoginViewController.h"

@interface LHShopHeaderTableViewCell ()
// 头像
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
// 店名
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
// 星星图片
@property (weak, nonatomic) IBOutlet UIImageView *starImage;
// 评分
@property (weak, nonatomic) IBOutlet UILabel *countLabel;
// 分类标题
@property (weak, nonatomic) IBOutlet UILabel *subLabel;
// 地址按钮（跳转地图）
@property (weak, nonatomic) IBOutlet UIButton *locationBtn;
// 电话
@property (weak, nonatomic) IBOutlet UIButton *phoneBtn;
// 介绍
@property (weak, nonatomic) IBOutlet UILabel *introLabel;
//分享按钮
@property (weak, nonatomic) IBOutlet UIButton *shareBtn;

@property (strong,nonatomic) UIWebView *phoneView;

@end

@implementation LHShopHeaderTableViewCell

- (void)setDetail:(LHShopDetailModel *)detail
{
    
    
    _detail = detail;
    [self.iconView lh_setImageWithURLString:detail.cover];
    //店名
    self.titleLabel.text = detail.name;
    //评分
    NSString *starImageName = [NSString stringWithFormat:@"star_%d",detail.score];
    self.starImage.image = [UIImage imageNamed:starImageName];
    //得分标题
    self.countLabel.text = [NSString stringWithFormat:@"%d分",detail.score];
    //服务
    self.subLabel.text = detail.server;
    //地址
    [self.locationBtn setTitle:detail.address forState:UIControlStateNormal];
    //电话
    [self.phoneBtn setTitle:detail.phone forState:UIControlStateNormal];
    
    //简介
    self.introLabel.text = detail.intro;
    
    
    
}

- (void)awakeFromNib {
    // Initialization code
    
    _introLabel.numberOfLines = 0;
    _shareBtn.layer.cornerRadius = 3;
    
//    _shareBtn.layer.masksToBounds = YES;
   
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    
//    CGRect rect = self.frame;
//    
//    CGSize introSize = [_introLabel.text boundingRectWithSize:CGSizeMake(300, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:13]} context:nil].size;
//    
//    rect.size.height = introSize.height;
//    
//    self.frame = rect;

    
}

-(CGFloat)getHeight
{
    return self.frame.size.height + 145;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark -

-(UIWebView *)phoneView{

    if (_phoneView == nil) {
        _phoneView = [[UIWebView alloc] init];
    }
    return _phoneView;
}








- (IBAction)shareBtnClick:(id)sender {
    
    if ([self.delegate respondsToSelector:@selector(didShareBtnClick)]) {
        [self.delegate didShareBtnClick];
    }
    
}

- (IBAction)locationClick:(id)sender {
    if ([self.delegate respondsToSelector:@selector(headerViewDidClickLocationBtn)])
    {
        [self.delegate headerViewDidClickLocationBtn];
    }
}

- (IBAction)phoneClick:(id)sender {
    
//    UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:_phoneBtn.titleLabel.text delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"拨打" otherButtonTitles:nil, nil];
    
    if ([self.delegate respondsToSelector:@selector(headerViewDidClickPhoneBtn:)]) {
        [self.delegate headerViewDidClickPhoneBtn:_phoneBtn.titleLabel.text];
    }
    
//    
//   NSLog(@"%@",_phoneBtn.titleLabel.text);
//    NSString *str = [NSString stringWithFormat:@"tel://%@",_phoneBtn.titleLabel.text];
//    
//    [self.phoneView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:str]]];
    
}

@end
