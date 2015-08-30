//
//  LHShopDetailViewController.m
//  生活圈项目
//
//  Created by 赖文辉 on 15/8/16.
//  Copyright (c) 2015年 赖文辉. All rights reserved.
//

#import "LHShopDetailViewController.h"
#import "LHTabBarBaseViewController.h"
#import "LHShopDetailModel.h"
#import "LHShopHeaderTableViewCell.h"
#import "LHShopGoodsTableViewCell.h"
#import "LHJudgeTableViewCell.h"
#import "LHAddJudgeTableViewCell.h"
#import "LHShopFootTableViewCell.h"
#import "LHShareView.h"
#import "UMSocial.h"
#import "LHMapViewViewController.h"

@interface LHShopDetailViewController ()<UITableViewDataSource,UITableViewDelegate,LHShopHeaderTableViewCellDelegate,UIActionSheetDelegate,LHShopFootTableViewCellDelegate,LHAddJudgeTableViewCellDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic,strong) LHShopHeaderTableViewCell *header;

@property (nonatomic,strong) LHShopDetailModel *shopDetail;

@property (nonatomic,assign) CGFloat height;

@property (nonatomic,copy) NSString *phoneNum;

@property (nonatomic,assign) NSInteger goodsNum;

@property (nonatomic,assign) NSInteger pageNum;

@end

@implementation LHShopDetailViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    // 去留白
    self.automaticallyAdjustsScrollViewInsets = NO;
    
//    NSLog(@"%@",_shopDetail);
    //设置背景颜色
    self.tableView.backgroundColor = [UIColor whiteColor];
    
    //创建头部
    
    self.header = [[NSBundle mainBundle] loadNibNamed:@"LHShopHeaderTableViewCell" owner:nil options:nil].lastObject;
    self.header.delegate = self;
    
    self.tableView.tableHeaderView = self.header;
    
    _goodsNum = 2;
    
    _pageNum = 1;
    //获取数据
    [self getData];
    
//    NSLog(@"tttttt");
    
    [UMSocialConfig setSupportedInterfaceOrientations:UIInterfaceOrientationMaskAllButUpsideDown];
    
}

//setter
- (void)setShopDetail:(LHShopDetailModel *)shopDetail
{
    _shopDetail = shopDetail;
    
    CGFloat hight = [LHFunction hightForText:shopDetail.intro andFontSize:14];
    UIView *view = self.header;
    CGRect frame = view.frame;
    frame.size.height = 163 + hight;
    view.frame = frame;
    self.tableView.tableHeaderView = view;
    

    
    
}




//返回方法
- (void)backMethod
{
    [self.navigationController popViewControllerAnimated:YES];
    
    LHTabBarBaseViewController *tab =  (LHTabBarBaseViewController *)[UIApplication sharedApplication].keyWindow.rootViewController;
    
    [tab tabBarHidden:NO];
}

//获得数据
- (void)getData
{
    //参数
    [self.prar setObject:[LHFunction getTimeScamp] forKey:@"time"];
    
    NSArray *arr = @[APP_ID,self.prar[@"shop_id"],self.prar[@"time"],APP_IDENGER];
    [self.prar setObject:[LHFunction md5StringFromArray:arr] forKey:@"sign"];
    
    [self.prar setObject:APP_ID forKey:@"app_id"];
    
    [LHHTTPClient LHPOST:kURLPOSTShopDetailInfo parameters:self.prar successBlcok:^(id data) {
//        NSLog(@"----%@",data);
        
        self.shopDetail = [[LHShopDetailModel alloc] initWithDictionary:data error:nil];
        //传递头部数据
        self.header.detail = self.shopDetail;
        
        [self.tableView reloadData];
        
    } failureBlcok:^(NSError *error) {
        NSLog(@"%@",error);
        
        
    } errorBlcok:^(id error) {
        NSLog(@"%@",error);
        
        
    }];
    
}

#pragma mark -UITableViewDataSource
//每组cell的个数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        
        return _goodsNum;
        
    }else if (section == 1){
        
        return  _shopDetail.comment_list.count;
        
    }else return 1;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.section == 0) {
        
        LHShopGoodsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LHShopGoodsTableViewCell"];
        if (!cell) {
            cell = [[[UINib nibWithNibName:@"LHShopGoodsTableViewCell" bundle:nil] instantiateWithOwner:self options:nil] lastObject];
        }
//        _cellHeight = cell.frame.size.height;
        
        return cell;
    }
    else if (indexPath.section == 1)
    {
        LHJudgeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LHJudgeTableViewCell"];
        
        if (!cell) {
            cell = [[[UINib nibWithNibName:@"LHJudgeTableViewCell" bundle:nil] instantiateWithOwner:self options:nil]lastObject];
        }
        
        LHShopCommentListModel *model =_shopDetail.comment_list[indexPath.row];
        
        cell.model = model;

       _height = [cell getHeightForCell];
//        NSLog(@"%f",_height);
//        _height = [LHFunction hightForText:model.content andFontSize:14];
        
//        [_tableView reloadData];
        
        return cell;
    }
    
    LHAddJudgeTableViewCell *cell  = [tableView dequeueReusableCellWithIdentifier:@"LHAddJudgeTableViewCell"];
    cell.delegate = self;
    if (!cell) {
        cell = [[[UINib nibWithNibName:@"LHAddJudgeTableViewCell" bundle:nil] instantiateWithOwner:self options:nil] lastObject];

    }
    
        return cell;

}

//-(BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    if (indexPath.section == 2) {
//        return NO;
//    }
//    return YES;
//}

#pragma mark -UITableViewDelegate

//设置headerViewgaodu
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 2) {
        return 0;
    }
    
    return kTableViewHeaderHight;
    
    
}

// cell的高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 80;
    }else if (indexPath.section == 1){
        return _height;
    }else
    return 170;
}

//  footView 的高度

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section == 0 || section == 1) {
        return 35;
    }
    return 0;
}


//返回每组的头部view
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
  
    if (section == 2)
    {
        return nil;
    }
    //创建View
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kUIScreenWidth, kTableViewHeaderHight)];
    view.backgroundColor = [UIColor whiteColor];
    
    //上面的分隔线
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kUIScreenWidth, 6)];
    line.backgroundColor = [UIColor lightGrayColor];
    
    
    
    [view addSubview:line];
    
    //创建标题
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10,6, 200, kTableViewHeaderHight - 6 - 0.5)];
    
    //设置文字
    if (section == 0)
    {
        label.text = @"商品";
    }
    else if(section == 1)
    {
        label.text = @"用户评价";
    }
    
    //设置状态
    label.textColor = [UIColor redColor];
    label.textAlignment = NSTextAlignmentLeft;
    label.font = [UIFont fontWithName:@"Menlo" size:20];
    
    [view addSubview:label];
    
    
    
    //创建下方的分隔线
    UIView *buttomLine = [[UIView alloc] initWithFrame:CGRectMake(0, kTableViewHeaderHight - 0.5, kUIScreenWidth, 0.5)];
    buttomLine.backgroundColor = [UIColor lightGrayColor];
    [view addSubview:buttomLine];
    
    
    return view;
}

// footView
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    LHShopFootTableViewCell *footView = [[[UINib nibWithNibName:@"LHShopFootTableViewCell" bundle:nil] instantiateWithOwner:self options:nil] lastObject];
    //设置标示
    footView.moreBtn.tag = section;
    
    //设置代理
    footView.delegate = self;
    
    footView.frame = CGRectMake(0, 0, kUIScreenWidth, 35);
    
    if (section == 0) {
        
        [footView.moreBtn setTitle:@"更多" forState:UIControlStateNormal];
        
        return footView;
        
    }else if (section == 1){
        
        [footView.moreBtn setTitle:@"查看更多评论" forState:UIControlStateNormal];
        return footView;
    }
    
    return nil;
}

#pragma mark - LHShopHeaderTableViewCellDelegate

- (void)headerViewDidClickLocationBtn
{
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    LHMapViewViewController *mapView = [sb instantiateViewControllerWithIdentifier:@"LHMapViewViewController"];
    
    mapView.location = [self.prar objectForKey:@"location"];
    mapView.model = self.shopDetail;
    
    [self.navigationController pushViewController:mapView animated:YES];
}

// 分享代理
-(void)didShareBtnClick
{
    
    [UMSocialSnsService presentSnsIconSheetView:self
                 appKey:@"55d190cd67e58e183b0013a8"
              shareText:@"你要分享的文字"
             shareImage:[UIImage imageNamed:@"icon.png"]
        shareToSnsNames:[NSArray arrayWithObjects:UMShareToSina,UMShareToTencent,UMShareToRenren,UMShareToDouban,nil]
               delegate:nil];


}


// 拨打电话代理
-(void)headerViewDidClickPhoneBtn:(NSString *)phoneNumber
{
    
    self.phoneNum = phoneNumber;
    
    UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:phoneNumber delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"拨打电话" otherButtonTitles:nil, nil];
    
    [sheet showInView:self.view];
    
}

#pragma mark -LHShopFootTableViewCellDelegate

-(void)shopFootView:(LHShopFootTableViewCell *)footView didMoreBtnClick:(UIButton *)btn
{
    //点击了更多按钮
    if (btn.tag == 0)
    {
        if (_goodsNum < 4) {
            _goodsNum += 1;
        }else
        {
            [self showErroeMessage:@"已到最后"];
        }
        
        
    }
    else if (btn.tag == 1)//点击了更多评论按钮
    {
        
        [self getMoreJudegData];
        [self showLoadView];
        
    }
    //重新加载数据
    [self.tableView reloadData];
    
}

//获得更多评论的数据
- (void)getMoreJudegData
{
    self.pageNum++;
    NSMutableDictionary *prarm = [NSMutableDictionary dictionary];
    
    NSString *pageStr = [NSString stringWithFormat:@"%zd",self.pageNum];
    //参数
    [prarm setObject:@"shop" forKey:@"res_name"];
    [prarm setObject:[LHFunction getTimeScamp] forKey:@"time"];
    [prarm setObject:self.prar[@"shop_id"] forKey:@"res_id"];
    [prarm setObject:pageStr forKey:@"page"];
    
    NSArray *arr = @[APP_ID,prarm[@"res_name"],prarm[@"res_id"],prarm[@"page"],prarm[@"time"],APP_IDENGER];
    [prarm setObject:[LHFunction md5StringFromArray:arr] forKey:@"sign"];
    
    [prarm setObject:APP_ID forKey:@"app_id"];
    
    [LHHTTPClient LHPOST:@"api/1/comment/get_comment_list" parameters:prarm successBlcok:^(id data) {
        NSLog(@"----%@",data);
        
        for (NSDictionary *dict in ((NSDictionary *)data)[@"list"]) {
            LHShopCommentListModel *comModel = [[LHShopCommentListModel alloc] initWithDictionary:dict error:nil];
//            NSLog(@"%@",comModel);
            
            [self.shopDetail.comment_list addObject:comModel];
            
        }
        
        [self.tableView reloadData];
        
        [self hidenLoadView];
        
    } failureBlcok:^(NSError *error) {
        NSLog(@"%@",error);
        [self hidenLoadView];
        
    } errorBlcok:^(id error) {
        NSLog(@"%@",error);
        [self hidenLoadView];
        [self showErroeMessage:@"已到最后"];
        
    }];
    
}
#pragma mark -LHAddJudgeTableViewCellDelegate

-(void)addJudgeView:(LHAddJudgeTableViewCell *)addView didClickAddBtn:(UIButton *)btn cont:(NSString *)cont
{
    [self AddJudegDataWithStr:cont andScore:addView.starScore];
    [self showLoadView];
}

//发表评论
- (void)AddJudegDataWithStr:(NSString *)str andScore:(int)score
{
    
    NSMutableDictionary *prarm = [NSMutableDictionary dictionary];
    
    //参数
    [prarm setObject:@"600" forKey:@"user_id"];
    [prarm setObject:@"shop" forKey:@"res_name"];
    [prarm setObject:[LHFunction getTimeScamp] forKey:@"time"];
    [prarm setObject:self.prar[@"shop_id"] forKey:@"res_id"];
    [prarm setObject:str forKey:@"cont"];
    [prarm setObject:[NSString stringWithFormat:@"%d",score]forKey:@"score"];
    
    NSArray *arr = @[APP_ID,prarm[@"user_id"],prarm[@"res_name"],prarm[@"res_id"],prarm[@"score"],prarm[@"time"],APP_IDENGER];
    [prarm setObject:[LHFunction md5StringFromArray:arr] forKey:@"sign"];
    
    [prarm setObject:APP_ID forKey:@"app_id"];
    

    [LHHTTPClient LHPOST:@"api/1/comment/commit_comment" parameters:prarm successBlcok:^(id data) {
        NSLog(@"发表成功%@",data);
        [self showErroeMessage:@"发表成功"];
        [self hidenLoadView];
        
    } failureBlcok:^(NSError *error) {
        NSLog(@"%@",error);
        [self hidenLoadView];
        [self showErroeMessage:@"发表失败"];
        
    } errorBlcok:^(id error) {
        NSLog(@"%@",error);
        [self hidenLoadView];
        [self showErroeMessage:@"发表失败"];
        
    }];
    
}


#pragma mark -UIActionSheetDelegate

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
        
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:self.phoneNum]];
    }
}

@end
