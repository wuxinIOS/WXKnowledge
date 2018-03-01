//
//  git相关命令.m
//  iOS开发中常用知识点及代码
//
//  Created by apple on 2017/8/24.
//  Copyright © 2017年 apple. All rights reserved.
//

/**
 
 Workspace：工作区
 Index/Stage：暂存区，也叫索引
 Repository：仓库区（或本地仓库），也存储库
 Remote：远程仓库
 工作区: 通过git init创建的代码库的所有文件但是不包括.git文件(版本库)
 暂存区: 通过git add . 添加的修改,都是进入到暂存区了,肉眼不可见 通过 git status 可以看到修改的状态。
 
 
 //初始化仓库，添加文件到仓库以及提交文件到仓库
 $ git init --创建本地仓库
 $ git add . --把所有文件添加到仓库
 $ git add file --把修改过的文件添加到暂存区
 $ git commit -m "" --文件提交到仓库,-m 的后面输入的是本次提交的说明
 $ git commit -m "" --把暂存区的的内容提交到当前所在的分支上去
 $ git status -- 查看文件的动态是否被修改
 $ git diff --查看文件被修改内容
 $ git checkout --file 丢弃工作区的修改
 $ git reset HEAD file 把暂存区的修改撤销，重新放回到工作区
 
 
 可以重新提交
 例如，提交后发现忘记了暂存某些需要的修改，可以像下面这样操作：
  $ git commit -m 'initial commit'
  $ git add forgotten_file
  $ git commit --amend
 最终你只会有一个提交 - 第二次提交将代替第一次提交的结果。
 
// 隐藏
    现在，要切换分支以进行客户升级，但不想提交一直在做的工作; 那么可以把当前工作的改变隐藏起来。 要将一个新的存根推到堆栈上，运行 $ git stash 命令。
    假设您已经解决了客户升级问题，想要重新开始新的功能的代码编写，查找上次没有写完成的代码，只需执行 $ git stash pop 命令即可从堆栈中把stash内容也删了：并将其放置在当前工作目录中。
 
 
 //版本回退:
 
 $ git log --查看从近到远的提交的各版本
 $ git log --pretty=oneline --省略版查看版本命令
 
 $ git reset --hard HEAD^ --退回到上一个版本
 $ git reset --hard id号 -- 退回到指定版本
 $ git reflog --查看历史命令
 
 
 
 $ git rm 文件名  -- 删除文件
 
 $ git checkout -- 文件名 --用版本库里的版本替换工作区的版本
 
 
 $ git clone 远程连接 --从远程仓库克隆一份到本地
 
 $ git remote rm origin -- 删除远程的origin
 
 
 说明:
    1.当文件被修改后，需要再次 执行 git add . 和 git commit -m ""
    2.用 HEAD 表示当前版本，也就是最新提交的版本
 
    3.工作区和暂存区
        工作区：就是我们所看到的文件区域部分。
        暂存区:在隐藏的.git文件中。
        但我们执行命令 git add . 后其实是把修改的部分方法暂存区，执行 git commit -m "" 后，就把暂存区修改的东西全部提交到master分支中去了
    每次修改，如果不add到暂存区，那就不会加入到commit中
 
    4.撤销操作:
 
     场景1：当你改乱了工作区某个文件的内容，想直接丢弃工作区的修改时，用命令git checkout -- file。
     
     场景2：当你不但改乱了工作区某个文件的内容，还添加到了暂存区时，想丢弃修改，分两步，第一步用命令git reset HEAD file，就回到了场景1，第二步按场景1操作。
     
     场景3：已经提交了不合适的修改到版本库时，想要撤销本次提交，参考版本回退一节，不过前提是没有推送到远程库。
 
 // 创建与合并分支:
    
    $ git checkout -b 分支名 --创建了一个新的分支，并切换到了新的分支上，相当于以下两条命令：
         git branch dev
         git checkout dev
    $ git branch --命令查看当前分支
    $ git merge 分支名 --命令用于合并指定分支到当前分支
    $ git branch -d 分支名 --删除分支
    $ git push origin --delete <branchName>删除远程分支
    $ git checkout 分支名 切换分支
    $ git push 推送到远程分支
 
    $ git branch -m new_branch(oldName) wchar_support(newName) --重命名分支
 
 合并:
    $ git merge 分支名 --命令用于合并指定分支到当前分支 是 快进模式 的合并方式
 
    $ git merge --no-ff -m "merge with no-ff" dev  合并分支时，加上--no-ff参数就可以用普通模式合并，合并后的历史有分支，能看出来曾经做过合并，而fast forward合并就看不出来曾经做过合并。
 
 
 注意:
    一直提示有未提交的文件，发现UserInterfaceState.xcuserstate这个文件一直在自动更新，即使我的代码没改变，提交时也有它。后来百度到这是Xcode自带的文件，不应该被提交到版本管理中
     
     git rm --cached [YourProjectName].xcworkspace/xcuserdata/[YourUsername].xcuserdatad/UserInterfaceState.xcuserstate
     git commit -m "Removed file that shouldn't be tracked"
     git push
 
想要往.gitignore文件中添加新的忽略文件,先必须把这个要忽略的文件删除，然后在往.gitignore文件中添加这个文件 如：
    *.DS_Store
 打开.gitignore文件、编辑、退出的步骤如下:
    1. vim .gitignore
    2. 按下 i 键 进入输入模式，就可以使用方向键进行移动，并可以输入
    3. 先按 ESC 键,退出输入模式，然后 按  shift+：键，并输入wq 并 敲 回车，就可以退出vim编辑器了
 

给分支打标签：tag
  首先我们了解下 git 的 tag 功能:
     
     git 下打标签其实有2种情况
      (1): 轻量级的
      它其实是一个独立的分支,或者说是一个不可变的分支.指向特定提交对象的引用.
     
     
      (2):带附注的
      实际上是存储在仓库中的一个独立对象，它有自身的校验和信息，包含着标签的名字，标签说明，标签本身也允许使用 GNU Privacy Guard (GPG) 来签署或验证,电子邮件地址和日期，一般我们都建议使用含附注型的标签，以便保留相关信息.
 
      所以我们推荐使用第二种标签形式.
 
 eg：
     $git tag -a V1.2 -m 'WebSite version 1.2'   
        上面的命令我们成功创建了本地一个版本 V1.2 ,并且添加了附注信息 'WebSite version 1.2'
    $ git tag  --查看标签
    $ git show V1.2 --显示标签的附加信息
    $ git push origin --tags  --这样我们就把本地版本推送到了远程代码仓库.
    $ git tag -d V1.2  --删除某个标签(本地的)
    $ git push origin :refs/tags/V1.2  --删除远程的某个标签
    $ git fetch origin tag V1.2  -- 获取远程标签
 
 注意:
 先 git clone 整个仓库，然后 git checkout tag_name 就可以取得 tag 对应的代码了。
 但是这时候 git 可能会提示你当前处于一个“detached HEAD" 状态，因为 tag 相当于是一个快照，是不能更改它的代码的，如果要在 tag 代码的基础上做修改，你需要一个分支：
 git checkout -b branch_name tag_name
 这样会从 tag 创建一个分支，然后就和普通的 git 操作一样了。
 
 多人协作开发大概过程：
 
     首先，可以试图用git push origin branch-name推送自己的修改；
 
     如果推送失败，则因为远程分支比你的本地更新，需要先用git pull试图合并；
 
     如果合并有冲突，则解决冲突，并在本地提交；
 
     没有冲突或者解决掉冲突后，再用git push origin branch-name推送就能成功！
 
     如果git pull提示“no tracking information”，则说明本地分支和远程分支的链接关系没有创建，用命令git branch --set-upstream branch-name origin/branch-name。
 
 
 注意：
     查看远程库信息，使用git remote -v；
 
     本地新建的分支如果不推送到远程，对其他人就是不可见的；
 
     从本地推送分支，使用git push origin branch-name，如果推送失败，先用git pull抓取远程的新提交；
 
     在本地创建和远程分支对应的分支，使用git checkout -b branch-name origin/branch-name，本地和远程分支的名称最好一致；
 
     建立本地分支和远程分支的关联，使用git branch --set-upstream branch-name origin/branch-name；
 
     从远程抓取分支，使用git pull，如果有冲突，要先处理冲突。
 
 冲突:
    当Git无法自动合并分支时，就必须首先解决冲突。解决冲突后，再提交，合并完成
     用git log --graph命令可以看到分支合并图
 
 ****========    当项目没有git源时，怎么为项目添加git源   =====**************
        1.切换到项目所在的路径
        2. git init --初始化了一个空的源。
        3. git add . --当前目录所有的内容就被添加到源里面去了。
        4. git commit -m "Initial commit" --提交到本地的仓底
 
 */
