//
//  1起步.h
//  iOS开发中常用知识点及代码
//
//  Created by apple on 2018/3/5.
//  Copyright © 2018年 apple. All rights reserved.
//

/**
 1.3基础
    每个项目都有一个 Git 目录（译注：如果 git clone 出来的话，就是其中 .git 的目录；如果 git clone --bare 的话，新建的目录本身就是 Git 目录。），它是 Git 用来保存元数据和对象数据库的地方。该目录非常重要，每次克隆镜像仓库的时候，实际拷贝的就是这个目录里面的数据。
 
   基本的 Git 工作流程如下：
     1.在工作目录中修改某些文件。
     2.对修改后的文件进行快照，然后保存到暂存区域。
     3.提交更新，将保存在暂存区域的文件快照永久转储到 Git 目录中。
 
 
1.5 使用前的配置工作
  1.git config 的工具，专门用来配置或读取相应的工作环境变量，变量可以存放在以下三个不同的地方
    1. /etc/gitconfig 文件：系统中对所有用户都普遍适用的配置。若使用 git config 时用 --system 选项，读写的就是这个文件。
      解释：配置在这个文件的变量对所有用户都会有作用
    2. ~/.gitconfig 文件：用户目录下的配置文件只适用于该用户。若使用 git config 时用 --global 选项，读写的就是这个文件。
     解释:这个是配置在当前用户目录下的，只会针对当前这个用户起作用
    3.当前项目的 Git 目录中的配置文件（也就是工作目录中的 .git/config 文件）：这里的配置仅仅针对当前项目有效。每一个级别的配置都会覆盖上层的相同配置，所以 .git/config 里的配置会覆盖 /etc/gitconfig 中的同名变量。
      解释：当前项目的配置
    注意：配置的变量相同时，项目中的配置会覆盖掉用户目录下的配置，也会覆盖系统下的目录中的配置
 
  需要配置的相应信息：
  2.第一个要配置的是你个人的用户名称和电子邮件地址。这两条配置很重要，每次 Git 提交时都会引用这两条信息，说明是谁提交了更新，所以会随更新内容一起被永久纳入历史记录：
    $ git config --global user.name "John Doe"
    $ git config --global user.email johndoe@example.com
    如果用了 --global 选项，那么更改的配置文件就是位于你用户主目录下的那个，以后你所有的项目都会默认使用这里配置的用户信息。如果要在某个特定的项目中使用其他名字或者电邮，只要去掉 --global 选项重新配置即可，新的设定保存在当前项目的 .git/config 文件里。
 
 3.接下来要设置的是默认使用的文本编辑器。Git 需要你输入一些额外消息的时候，会自动调用一个外部文本编辑器给你用。默认会使用操作系统指定的默认编辑器，一般可能会是 Vi 或者 Vim。如果你有其他偏好，比如 Emacs 的话，可以重新设置：
     $ git config --global core.editor emacs
 
 4.差异分析工具
     还有一个比较常用的是，在解决合并冲突时使用哪种差异分析工具。比如要改用 vimdiff 的话：
     $ git config --global merge.tool vimdiff
     Git 可以理解 kdiff3，tkdiff，meld，xxdiff，emerge，vimdiff，gvimdiff，ecmerge，和 opendiff 等合并工具的输出信息。当然，你也可以指定使用自己开发的工具，具体怎么做可以参阅第七章。
 
 5. 查看配置信息
    git config --list     全部的配置信息
    git config user.name  查看指定的配置信息
 
 
 */
