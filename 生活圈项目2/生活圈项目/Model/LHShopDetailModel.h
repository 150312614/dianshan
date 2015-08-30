//
//  LHShopDetailModel.h
//  生活圈项目
//
//  Created by 赖文辉 on 15/8/16.
//  Copyright (c) 2015年 赖文辉. All rights reserved.
//

#import "JSONModel.h"


@protocol LHShopCommentListModel;

@interface LHShopDetailModel : JSONModel


//地理地址
@property (nonatomic,copy) NSString *address;
//评论列表
@property (nonatomic,strong) NSMutableArray<LHShopCommentListModel> *comment_list;

@property (nonatomic,assign) int comment_totalPage;

//商家头像
@property (nonatomic,copy) NSString *cover;

@property (nonatomic,assign) int id;

@property (nonatomic,copy) NSString *intro;

@property (nonatomic,copy) NSString *lat;

@property (nonatomic,copy) NSString *lon;

@property (nonatomic,copy) NSString *name;

@property (nonatomic,copy) NSString *phone;

@property (nonatomic,assign) int score;

@property (nonatomic,copy) NSString *server;


@end


@interface LHShopCommentListModel : JSONModel

@property (nonatomic,copy) NSString *avatar;

@property (nonatomic,copy) NSString *content;

@property (nonatomic,copy) NSString *date;

@property (nonatomic,assign) int id;

@property (nonatomic,copy) NSString *name;

@property (nonatomic,assign) int score;

@property (nonatomic,assign) int user_id;


@end



/**
 address = "\U9752\U5c9b\U5e02\U80f6\U5357\U5e02\U4eba\U6c11\U8def490\U53f7";
 "comment_list" =     (
 {
 avatar = "http://www.qd-life.com/images/default/general.gif";
 content = "\U54ea\U91cc\U627e2.0";
 date = "08-15 15:51";
 id = 776;
 name = test001;
 score = 1;
 "user_id" = 636;
 },
 {
 avatar = "http://www.qd-life.com/static/upload/2015/08/15/small_14395725435288.jpg";
 content = "\U641e\U4e2a\U5927\U65b0\U95fb";
 date = "08-15 15:51";
 id = 775;
 name = a3868081;
 score = 5;
 "user_id" = 630;
 }
 );
 "comment_totalPage" = 3;
 cover = "http://www.qd-life.com/static/upload/2015/04/08/info_20150408153820000000_1_98894_50.jpg";
 goods =     (
 );
 id = 3169;
 intro = "\U5e97\U5185\U73af\U5883\U5e72\U51c0\U6574\U6d01\Uff0c\U4ef7\U683c\U5b9e\U60e0\Uff0c\U5473\U9053\U9c9c\U7f8e\Uff0c\U6b22\U8fce\U60a8\U7684\U5149\U4e34\Uff01";
 lat = "35.885114";
 lon = "120.014701";
 name = "\U857e\U68ee\U5c45\U7f8e\U98df\U57ce";
 phone = 15725259000;
 score = 0;
 server = "\U7f8e\U98df";
 status = success;
 totalPage = 0;
 */