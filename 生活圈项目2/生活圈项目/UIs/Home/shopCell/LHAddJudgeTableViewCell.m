//
//  LHAddJudgeTableViewCell.m
//  生活圈项目
//
//  Created by mac on 15/8/16.
//  Copyright (c) 2015年 赖文辉. All rights reserved.
//

#import "LHAddJudgeTableViewCell.h"

#define kNumberOfStar 5

@interface LHAddJudgeTableViewCell ()

@property (weak, nonatomic) IBOutlet UITextView *textView;

@property (weak, nonatomic) IBOutlet UIImageView *starImageView;


@property (weak, nonatomic) IBOutlet UIButton *addBtn;

//@property (assign,nonatomic)NSInteger numberOfStar;

- (IBAction)addBtnClick;


@end

@implementation LHAddJudgeTableViewCell

- (void)awakeFromNib {
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    // Initialization code
    _textView.layer.borderColor = [[UIColor colorWithRed:215/255.0 green:215/255.0 blue:215/255.0 alpha:1] CGColor];
    _textView.layer.borderWidth = 0.6f;
    _textView.layer.cornerRadius = 6.0;
   
    // 星级评价
    _starImageView.userInteractionEnabled = YES;
    _starImageView.image = [UIImage imageNamed:@"star_0"];
    
    // 定义触摸事件
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(userTapRateView:)];
    // 单击
    tapGesture.numberOfTapsRequired = 1;
    UIPanGestureRecognizer *panTure = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(userPanTure:)];
    
    // 添加到图片上
    [_starImageView addGestureRecognizer:tapGesture];
    [_starImageView addGestureRecognizer:panTure];
}


-(void)userTapRateView:(UITapGestureRecognizer *)gesture
{
    // 获得触摸点
    CGPoint tapPoint = [gesture locationInView:_starImageView];
    
    // 计算是在第几颗星星上
    CGFloat count = tapPoint.x / (_starImageView.bounds.size.width /kNumberOfStar);

    _starScore = (int)count + 1;
    
    // 更换图片
    _starImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"star_%d",_starScore]];
    
//    NSLog(@"%d",_starScore);
}

-(void)userPanTure:(UIPanGestureRecognizer *)panTure
{
    CGPoint panPoint = [panTure locationInView:_starImageView];
    
    NSInteger count = (panPoint.x)/(_starImageView.bounds.size.width /kNumberOfStar);
    if (count < 0) {
        _starScore = 0;
    }
    else if (count <= 4) {
        _starScore = (int)count + 1;
    }
     // 更换图片
    _starImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"star_%d",_starScore]];

}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)addBtnClick {
    
    [self.textView resignFirstResponder];
    if (self.textView.text.length <= 0)
    {
        return;
    }
    
    if ([self.delegate respondsToSelector:@selector(addJudgeView:didClickAddBtn:cont:)]) {
        [self.delegate addJudgeView:self didClickAddBtn:self.addBtn cont:self.textView.text];
    }
    
}
@end
