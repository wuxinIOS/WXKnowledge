//
//  冷门知识.m
//  iOS开发中常用知识点及代码
//
//  Created by apple on 2017/8/18.
//  Copyright © 2017年 apple. All rights reserved.
//

/**
 
 1.当collectionView的数据少时，默认是不能滚动的。用上以下代码就可以解决这个问题了
 collectionView.alwaysBounceVertical = YES;
 
 
 2.把子视图放到父视图的最前面
 - (void)bringSubviewToFront:(UIView *)view;

 
 3.把导航栏变成透明
 //设置透明的导航栏
 self.navigationBarBackgroundView = self.navigationController.navigationBar.subviews.firstObject;

 self.navigationController.navigationBar.translucent = YES;
 
 self.navigationBarBackgroundView.alpha = self.lastAlpha;

 
 
4.隐藏导航栏
    方法一:
     注意这里一定要用动画的方式隐藏导航栏,这样在使用滑动返回手势的时候效果最好,和上面动图一致.这样做有一个缺点就是在切换tabBar的时候有一个导航栏向上消失的动画.
     - (void)viewWillAppear:(BOOL)animated {
     [super viewWillAppear:animated];
     
     [self.navigationController setNavigationBarHidden:YES animated:YES];
     }
     
     - (void)viewWillDisappear:(BOOL)animated {
     [super viewWillDisappear:animated];
     
     [self.navigationController setNavigationBarHidden:NO animated:YES];
     }
 
    方法二:
     设置self为导航控制器的代理,实现代理方法,在将要显示控制器中设置导航栏隐藏和显示,使用这种方式不仅完美切合滑动返回手势,同时也解决了切换tabBar的时候,导航栏动态隐藏的问题.
 
     @interface WLHomePageController () <UINavigationControllerDelegate>
     
     @end
     
     @implementation WLHomePageController
     
     #pragma mark - lifeCycle
     - (void)viewDidLoad {
     [super viewDidLoad];
     
     // 设置导航控制器的代理为self
     self.navigationController.delegate = self;
     }
     
     #pragma mark - UINavigationControllerDelegate
     // 将要显示控制器
     - (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
     // 判断要显示的控制器是否是自己
     BOOL isShowHomePage = [viewController isKindOfClass:[self class]];
     
     [self.navigationController setNavigationBarHidden:isShowHomePage animated:YES];
     }
 
5.监听二级界面手势滑动返回按钮的实现
     在需要滑动返回的遵守协议:UIGestureRecognizerDelegate,成为他的代理，并实现方法:
     - (void)viewWillAppear:(BOOL)animated {
     [super viewWillAppear: animated];
     self.navigationController.interactivePopGestureRecognizer.delegate = self;
     
     }
     
     - (void)viewDidDisappear:(BOOL)animated {
     self.navigationController.interactivePopGestureRecognizer.delegate = nil;
     }

     //UIGestureRecognizerDelegate
     - (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
         {
 
    return YES;
     }

6. 行向滚动collectionView时，设置点击的cell上面的文字为红色，其他cell上的文字颜色为其他颜色的实现思路
      思路一: 设置cell.selectedBackgroundView 为选中时的背景，文字都添加到这个 背景视图上
             设置cell.backgroundView，也添加一样的文字，这两个背景上的控件的frame 一模一样
 
7.数组去重实现
    思路一: 利用字典，把数组里面的值座位 key-value 往字典里面添加。但是这样会打乱数组里面原本的顺序
    思路二:
 
 */
