//
//  账号两地登录.m
//  iOS开发中常用知识点及代码
//
//  Created by apple on 2017/8/30.
//  Copyright © 2017年 apple. All rights reserved.
//
/** 
 
 实现方法一：
  实现原理:  只要有网络请求，返回的结果中设置一个字段，指定账号在另外地方登陆的所代表的状态码。当返回的结果为指定的时，就强行退出登陆。用户主动退出登陆时，调用接口告诉服务器。若不是主动退出登陆，而又在另外的地方的登陆了，则只要有网络请求时，就会返回指定的状态码，告诉用户在另外一个地方登陆了。
 
 
 退出登陆后，跳到首页
 //相当于从moreController视图中一个一个地退出视图（Pop方式），直接退到UITabBarViewController的Item3中
 
 UINavigationController *oldNavigationController = [self.viewControllers objectAtIndex:self.selectedIndex];
 
 for (NSInteger i = [oldNavigationController.viewControllers count] - 1; i >= 0; i--) {
 
 UIViewController *viewController = [oldNavigationController.viewControllers objectAtIndex:i];
 
 [oldNavigationController popToViewController:viewController animated:NO];
 
 }
 
 //当不是UITabBarViewController不是第1项时，就强制切换到Item1
 
 if (0 != self.selectedIndex){
 
 self.selectedIndex = 0;
 
 }

 
 
 
 
 */
