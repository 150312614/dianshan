//
//  LHJudgeTableViewCell.m
//  生活圈项目
//
//  Created by mac on 15/8/16.
//  Copyright (c) 2015年 赖文辉. All rights reserved.
//

#import "LHJudgeTableViewCell.h"

@interface LHJudgeTableViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UIImageView *starImageView;
@property (weak, nonatomic) IBOutlet UILabel *introLabel;
@property (nonatomic,assign) CGFloat height;

@end


@implementation LHJudgeTableViewCell


- (void)awakeFromNib {
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

-(void)setModel:(LHShopCommentListModel *)model
{
    _model = model;
    // 用户头像
    NSString *imageName = model.avatar;
    [_iconImageView lh_setImageWithURLString:imageName];
    // 用户名
    _nameLabel.text = model.name;
    // time
    _timeLabel.text = model.date;
    // 星星
    NSString *star = [NSString stringWithFormat:@"star_%d",model.score];
    
    _starImageView.image = [UIImage imageNamed:star];
    // 评价
    _introLabel.text = model.content;
    
    
    CGRect introRect = _introLabel.frame;
    
    CGRect rect = [_introLabel.text boundingRectWithSize:CGSizeMake(kUIScreenWidth - 25, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:14]} context:nil];
    introRect.size.height = rect.size.height;
    
    _height = rect.size.height;
    
    _introLabel.frame  = introRect;
    
    NSLog(@"%f",_introLabel.frame.size.height);

    
}

//  获得评论cell的高度
-(CGFloat)getHeightForCell
{
    NSLog(@"%f",_introLabel.frame.size.height + 49);
    return _height + 70;
}


-(void)layoutSubviews
{
    [super layoutSubviews];
    
//    CGRect introRect = _introLabel.frame;
//    
//   CGRect rect = [_introLabel.text boundingRectWithSize:CGSizeMake(kUIScreenWidth - 25, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:14]} context:nil];
//    introRect.size.height = rect.size.height;
//    
//    _introLabel.frame  = introRect;
//    
//    NSLog(@"%f",_introLabel.frame.size.height);
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
