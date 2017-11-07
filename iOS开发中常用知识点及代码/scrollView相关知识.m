//
//  scrollView相关知识.m
//  iOS开发中常用知识点及代码
//
//  Created by apple on 2017/8/28.
//  Copyright © 2017年 apple. All rights reserved.
//

/**
 
 手动滚动scrollView的时候会调用:
 scrollViewDidScroll:方法
 scrollViewDidEndDecelerating:方法
 
 用 setContentOffset:设置offSet，会调用:
 scrollViewDidScroll:方法
 scrollViewDidEndScrollingAnimation:方法
 
 
 
 
 
 */
