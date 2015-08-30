//
//  LHFamousTableViewCell.m
//  生活圈项目
//
//  Created by 赖文辉 on 15/8/15.
//  Copyright (c) 2015年 赖文辉. All rights reserved.
//

#import "LHFamousTableViewCell.h"
#import "LHFamousCollectionViewCell.h"

@interface LHFamousTableViewCell ()<UICollectionViewDataSource,UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *flowLayout;


@end

static NSString *ID = @"LHFamousCollectionViewCell";

@implementation LHFamousTableViewCell

- (void)awakeFromNib {
    self.collectionView.scrollEnabled = NO;
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.flowLayout.minimumInteritemSpacing = 0;
    self.flowLayout.minimumLineSpacing = 0;
    
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"LHFamousCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:ID];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setList:(LHFamousListModel *)list
{
    _list = list;
    
    [self.collectionView reloadData];
    
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.flowLayout.itemSize = CGSizeMake(self.bounds.size.width / 2.0, self.bounds.size.height / 2.0);
    
}

#pragma mark  -UICollectionViewDataSource
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 4;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    LHFamousCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    
    cell.model = self.list.list[indexPath.row];
    
    return cell;
}


#pragma mark - UICollectionViewDelegate
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    if ([self.delegate respondsToSelector:@selector(didLHFamousTableViewCellClickItem:)]) {
        [self.delegate didLHFamousTableViewCellClickItem:indexPath];
    }
    
}

@end
