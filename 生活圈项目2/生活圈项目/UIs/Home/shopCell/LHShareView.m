//
//  LHShareView.m
//  生活圈项目
//
//  Created by apple on 15/8/17.
//  Copyright (c) 2015年 赖文辉. All rights reserved.
//

#import "LHShareView.h"
#import "WeiboSDK.h"


@implementation LHShareView

- (void)awakeFromNib {
    // Initialization code
}

- (IBAction)wbShareClick:(id)sender {
    
    if ([self.delegate respondsToSelector:@selector(didWBShare)]) {
        [self.delegate didWBShare];
    }
    
    
}

- (IBAction)qqShareClick:(id)sender {
}

- (IBAction)wxShareClick:(id)sender {
}

- (IBAction)dbShareClick:(id)sender {
}

- (IBAction)cancleBtnClick:(id)sender {
    
    self.hidden = YES;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
