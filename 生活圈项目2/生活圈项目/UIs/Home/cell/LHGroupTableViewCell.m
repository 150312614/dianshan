//
//  LHGroupTableViewCell.m
//  生活圈项目
//
//  Created by 赖文辉 on 15/8/14.
//  Copyright (c) 2015年 赖文辉. All rights reserved.
//

#import "LHGroupTableViewCell.h"
#import "LHGroupCollectionViewCell.h"

static NSString *ID = @"LHGroupCollectionViewCell";

@interface LHGroupTableViewCell ()<UICollectionViewDataSource>


@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *flowLayout;

@end

@implementation LHGroupTableViewCell


- (void)awakeFromNib {
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"LHGroupCollectionViewCell" bundle:nil]forCellWithReuseIdentifier:ID];
    
    self.collectionView.scrollEnabled = NO;
    self.collectionView.backgroundColor=[UIColor whiteColor];
    self.flowLayout.minimumInteritemSpacing = 0;
    self.flowLayout.minimumLineSpacing = 0;
    
    
}

- (void)layoutSubviews
{

    [super layoutSubviews];
    
    
    self.flowLayout.itemSize = CGSizeMake(self.bounds.size.width / 4.0, self.bounds.size.height / 2.0);
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    
}

- (void)setList:(LHGroupListModel *)list
{
    _list = list;
//    NSLog(@"---%@",_list);
    [self.collectionView reloadData];
}

#pragma mark - UICollectionViewDataSource

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    LHGroupCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    
    
    cell.model = self.list.list[indexPath.row];
    
    return cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.list.list.count;
}


@end
