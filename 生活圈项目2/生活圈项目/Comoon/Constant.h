//
//  Constant.h
//  生活圈项目
//
//  Created by 赖文辉 on 15/8/9.
//  Copyright (c) 2015年 赖文辉. All rights reserved.
//

#ifndef ______Constant_h
#define ______Constant_h


#ifdef DEBUG

#define DSLog(...) NSLog(__VA_ARGS__)

#else

#define DSLog(...)

#endif


#define kUIScreenWidth [UIScreen mainScreen].bounds.size.width
#define kUIScreenHeight [UIScreen mainScreen].bounds.size.height

#define kUITabBarViewHeight 49
#define kUIPopViewHeight 44

#define kFirstLaunch @"guide"
#define kEnterVC @"enter"

/*******************枚举********************************/

typedef enum {
    LHButtonTypeNormal = 0,
    LHButtonTypeCorner
}LHButtonType;

/*******************************************************/
#define APP_ID  @"1001"
#define APP_IDENGER @"5bV9JhaMn2GJ5MZe"

#define kBaseURL @"http://www.qd-life.com/"
#define kURLGETHomeInfo @"?anu=api/1/index/get_index_info"
#define kURLPOSTShopDetailInfo @"api/1/shop/get_shop_info"

/*******************TableView*******************/

#define kTableViewHeaderHight  44

/*******************color*******************/
#define kColor(R,G,B) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:1.0]

#define kButtonColor [UIColor colorWithRed:45/255.0 green:156/255.0 blue:239/255.0 alpha:1.0]


#define Login_Deep_Color    kColor(60, 168, 245)
#define Login_Light_Color   kColor(103, 196, 255)

#endif
