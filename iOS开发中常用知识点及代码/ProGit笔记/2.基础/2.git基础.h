//
//  2git基础.h
//  iOS开发中常用知识点及代码
//
//  Created by apple on 2018/3/5.
//  Copyright © 2018年 apple. All rights reserved.
//
/**
 一、获取Git仓库：
     第一种是在现有项目或目录下导入所有文件到 Git 中:
        $git init  --该命令将创建一个名为 .git 的子目录，这个子目录含有你初始化的 Git 仓库中所有的必须文件,仅仅是做了一个初始化的操作，你的项目里的文件还没有被跟踪
        $git add .  --实现对所有/指定文件的跟踪，
        $git commit -m "描述"  --然后执行 git commit 提交
 
    第二种是从一个服务器克隆一个现有的 Git 仓库
        $ git clone https://github.com/libgit2/libgit2
        or
        $ git clone https://github.com/libgit2/libgit2 mylibgit  //自定义本地仓库的名字
 
 二、记录每次更新到仓库
    1.只要在 Changes to be committed 这行下面的，就说明是已暂存状态。
    2.git add 命令使用文件或目录的路径作为参数；如果参数是目录的路径，该命令将递归地跟踪该目录下的所有文件。
    3.出现在 Changes not staged for commit 这行下面，说明已跟踪文件的内容发生了变化，但还没有放到暂存区。
    4. git add 这是个多功能命令：可以用它开始跟踪新文件，或者把已跟踪的文件放到暂存区，还能用于合并时把有冲突的文件标记为已解决状态等,可理解为“添加内容到下一次提交中”而不是“将一个文件添加到项目中”要更加合适
    5.git status -s 文件的状态
     新添加的未跟踪文件前面有 ?? 标记，新添加到暂存区中的文件前面有 A 标记，修改过的文件前面有 M 标记。  M 有两个可以出现的位置，出现在右边的 M 表示该文件被修改了但是还没放入暂存区，出现在靠左边的 M 表示该文件被修改了并放入了暂存区
    6. git diff
        该命令比较的是工作目录中当前文件和暂存区域快照之间的差异， 也就是修改之后还没有暂存起来的变化内容。
        若要要查看已暂存的将要添加到下次提交里的内容，可以用 git diff --cached 命令
        git diff --cached和git diff命令的区别和解释如下：
            git diff 是查看工作区域的文件和暂存区文件的不同内容
            git diff --cached 是查看文件两次添加到暂存区的不同内容
    7.跳过使用暂存区域
        git commit -a -m "提交描述"   这样会自动把所有已经跟踪过的文件暂存起来一并提交，从而跳过 git add 步骤
 */










