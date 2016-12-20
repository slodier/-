//
//  AppDelegate.m
//  跑马灯
//
//  Created by CC on 2016/10/18.
//  Copyright © 2016年 CC. All rights reserved.
//

#import "AppDelegate.h"
#import "CCPaomaView.h"
#import "CCPaomaModel.h"

@interface AppDelegate ()

@property (nonatomic, strong) NSUserDefaults *defaults;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    _defaults = [NSUserDefaults standardUserDefaults];
    [_defaults setObject:@"0" forKey:@"isBack"];
    
    //删除数据库
    CCPaomaModel *ccPaomaModel = [[CCPaomaModel alloc]init];
    [ccPaomaModel removeSqlite];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    CCPaomaView *ccView = [CCPaomaView shareManager];
    [_defaults setObject:@"1" forKey:@"isBack"];
    [ccView pauseAnimation];
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    CCPaomaView *pView = [CCPaomaView shareManager];
    [pView resumeAnimation];
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
