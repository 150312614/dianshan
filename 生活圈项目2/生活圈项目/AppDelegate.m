//
//  AppDelegate.m
//  生活圈项目
//
//  Created by 赖文辉 on 15/8/9.
//  Copyright (c) 2015年 赖文辉. All rights reserved.
//

#import "AppDelegate.h"
#import "LHGuideViewController.h"
#import "LHHomeViewController.h"
#import "LHTabBarBaseViewController.h"
#import "LHCircleViewController.h"
#import "LHHomeViewController.h"
#import "LHAboutViewController.h"
#import "LHShakeViewController.h"
#import "LHNewsViewController.h"
#import "LHToolsViewController.h"
#import "LHFunction.h"
#import "UMSocial.h"

// appkey 55d190cd67e58e183b0013a8
@interface AppDelegate ()

@end

@implementation AppDelegate

//1222222222222222221321312312321
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [UMSocialData setAppKey:@"55d190cd67e58e183b0013a8"];
    
    
//    [WeiboSDK  enableDebugMode:YES];
//    [WeiboSDK registerApp:@"246174392"];
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
  
    
    //返回通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeRoot) name:kEnterVC object:nil];
    
    
    BOOL flag = [LHFunction getBoolWith:kFirstLaunch];
    if (flag)
    {
        [self changeRoot];
    }
    else
    {
        LHGuideViewController *guide = [[LHGuideViewController alloc] init];
        self.window.rootViewController = guide;
        
    }
    
    
    [self.window makeKeyAndVisible];
    
    
    
    return YES;
}


//改变根控制器
- (void)changeRoot
{
    LHTabBarBaseViewController *vc = [[LHTabBarBaseViewController alloc] init];
    
    
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    LHAboutViewController *about = [sb instantiateViewControllerWithIdentifier:@"LHAboutViewController"];
    UINavigationController *aboutNav = [[UINavigationController alloc] initWithRootViewController:about];
    
    LHCircleViewController *circle = [sb instantiateViewControllerWithIdentifier:@"LHCircleViewController"];
    UINavigationController *circleNav = [[UINavigationController alloc] initWithRootViewController:circle];
    
    LHHomeViewController *home = [sb instantiateViewControllerWithIdentifier:@"LHHomeViewController"];
    UINavigationController *homeNav = [[UINavigationController alloc] initWithRootViewController:home];
    
    LHShakeViewController *shake = [sb instantiateViewControllerWithIdentifier:@"LHShakeViewController"];
    UINavigationController *shakeNav = [[UINavigationController alloc] initWithRootViewController:shake];
    
    LHNewsViewController *news = [sb instantiateViewControllerWithIdentifier:@"LHNewsViewController"];
    UINavigationController *newsNav = [[UINavigationController alloc] initWithRootViewController:news];
    
    LHToolsViewController *tools = [sb instantiateViewControllerWithIdentifier:@"LHToolsViewController"];
    UINavigationController *toolsNav = [[UINavigationController alloc] initWithRootViewController:tools];
    
    vc.viewControllers = @[homeNav,newsNav,circleNav,toolsNav,shakeNav,aboutNav];
    
    self.window.rootViewController = vc;
    
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kEnterVC object:nil];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


#pragma mark -

//-(BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
//{
//    return [WeiboSDK handleOpenURL:url delegate:self];
//}
//
//-(BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
//{
//    return [WeiboSDK handleOpenURL:url delegate:self];
//}
//

@end
