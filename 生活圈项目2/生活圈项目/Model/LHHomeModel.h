//
//  LHHomeModel.h
//  生活圈项目
//
//  Created by 赖文辉 on 15/8/12.
//  Copyright (c) 2015年 赖文辉. All rights reserved.
//

#import "JSONModel.h"

@class LHFirstListModel;
@class LHGroupListModel;
@class LHGuessListModel;
@class LHFamousListModel;

@interface LHHomeModel : JSONModel

@property (nonatomic,strong) LHFirstListModel *focus;

@property (nonatomic,strong) LHGroupListModel *group;

@property (nonatomic,strong) LHGuessListModel *guess;

@property (nonatomic,strong) LHFamousListModel *famous;

@end


@protocol LHFocus;

@interface LHFirstListModel : JSONModel

@property (nonatomic,strong) NSArray<LHFocus> *list;

@end


@interface LHFocus : JSONModel

/**
 * 焦点图id
 */
@property(nonatomic,assign)int id;
/**
 *  焦点图标题
 */
@property(nonatomic,copy)NSString *title;
/**
 *  图片链接
 */
@property(nonatomic,copy)NSString *cover;
/**
 *  所要跳转的基础连接
 */
@property(nonatomic,copy)NSString *link;
/**
 *  跳转到指定的模块
 */
@property(nonatomic,copy)NSString *res_name;
/**
 *  指定模块下的详情ID
 */
@property(nonatomic,copy)NSString *res_id;

@end



#pragma mark - groupModel

@protocol LHGroupModel;


@interface LHGroupListModel : JSONModel

@property (nonatomic,strong) NSArray<LHGroupModel> *list;

@end

@interface LHGroupModel : JSONModel

/**
 * 焦点图id
 */
@property(nonatomic,assign)int id;
/**
 *  焦点图标题
 */
@property(nonatomic,copy)NSString *title;
/**
 *  图片链接
 */
@property(nonatomic,copy)NSString *cover;


@end

#pragma mark  - Guess


@protocol LHGuessModel;


@interface LHGuessListModel : JSONModel

@property (nonatomic,strong) NSArray<LHGuessModel> *list;


@end

@interface LHGuessModel : JSONModel

/**
 *  焦点图id
 */
@property(nonatomic,assign)int id;
/**
 *  焦点图标题
 */
@property(nonatomic,copy)NSString *title;
/**
 *  图片链接
 */
@property(nonatomic,copy)NSString *cover;
/**
 *  价格
 */
@property(nonatomic,copy)NSString *price;
/**
 *  简介
 */
@property(nonatomic,copy)NSString *intro;


@end


#pragma mark  - Famous


@protocol LHFamousModel;


@interface LHFamousListModel : JSONModel

@property (nonatomic,strong) NSArray<LHFamousModel> *list;


@end

@interface LHFamousModel : JSONModel

/**
 *  焦点图id
 */
@property(nonatomic,assign)int id;
/**
 *  图片链接
 */
@property(nonatomic,copy)NSString *cover;
/**
 *  名字
 */
@property(nonatomic,copy)NSString *name;
/**
 *  简介
 */
@property(nonatomic,copy)NSString *intro;

@property(nonatomic,copy)NSString *score;

@property(nonatomic,copy)NSString *distance;


@end

