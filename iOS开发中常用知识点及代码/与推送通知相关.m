//
//  与推送通知相关.m
//  iOS开发中常用知识点及代码
//
//  Created by apple on 2017/8/30.
//  Copyright © 2017年 apple. All rights reserved.
//

/**  
 
 由于iOS 10以下版本，前台收到通知时无法显示在通知栏的。iOS 10 已经开放了前台展示通知栏的API。
 
 首先我们来看看低版本的如何处理：
 
 // 低版本 只在前台时 才会收到
 -(void)application:(UIApplication )application didReceiveRemoteNotification:(NSDictionary )userInfo;
 
 // 所有版本  前后台 都会收到通知
 -(void)application:(UIApplication )application didReceiveRemoteNotification:(NSDictionary )userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler;
 
 首先来比较这两个API的异同，虽然前者已经被苹果抛弃了，但是在低版本系统我们还是要适配的，最主要的区别是前者只能在应用跑在前台时才能收到，后者则前后台都可以收到，
 两者都是实现的话，系统只会调用 后者。

 
 
 下面处理iOS 10的情况：
 //new API 设置前台收到远程消息时是否显示
 -(void)userNotificationCenter:(UNUserNotificationCenter )center willPresentNotification:(UNNotification )notification withCompletionHandler:(void (^)(UNNotificationPresentationOptions))completionHandler{
 
 completionHandler(UNNotificationPresentationOptionAlert);
 }
 
 //用户点击通知栏，前后台处理方式一致，需要注意的是以前的低版本的API是收到通知就回调，iOS 10以后则是用户点击才回调
 -(void)userNotificationCenter:(UNUserNotificationCenter )center didReceiveNotificationResponse:(UNNotificationResponse )response withCompletionHandler:(void (^)())completionHandler{
 //do something
 }
 
 
 
 设备接到apns发来的通知，应用处理通知有以下几种情况：
 1. 应用还没有加载
 这时如果点击通知的显示按钮，会调用didFinishLaunchingWithOptions，不会调用didReceiveRemoteNotification方法。
 如果点击通知的关闭按钮，再点击应用，只会调用didFinishLaunchingWithOptions方法。
 
 2. 应用在前台（foreground)
    这时如果收到通知，会触发didReceiveRemoteNotification方法。
 
 3.应用在后台
 （1）此时如果收到通知，点击显示按钮，会调用didReceiveRemoteNotification方法。
 （2）点击关闭再点击应用，则上面两个方法都不会被调用这时，只能在applicationWillEnterForeground或者applicationDidBecomeActive,根据发过来通知中的badge进行判断是否有通知，然后发请求获取数据
 
 高能量:
 
 如果 App 状态为未运行，此函数将被调用，如果launchOptions包含UIApplicationLaunchOptionsRemoteNotificationKey表示用户点击apn 通知导致app被启动运行；如果不含有对应键值则表示 App 不是因点击apn而被启动，可能为直接点击icon被启动或其他。
 
 - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions;
     // apn 内容获取：
     NSDictionary *remoteNotification = [launchOptions objectForKey: UIApplicationLaunchOptionsRemoteNotificationKey]
 
 */
