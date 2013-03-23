===================
Marboo插件安装指南
===================

.. Author: your_name 
.. title:: this is the real title in Jekyll.
.. |date| date:: 2013-03-17 22:38:09
.. publish:: NO
..  This file is created from ~/.marboo/source/media/bin/default.init.rst
.. 本文件由 ~/.marboo/source/media/bin/default.init.rst 复制而来

.. contents:: 目录

运行要求
=========

Google Chrome 25.0.1364.172 运行正常。低版本可能有问题。

下载
=====

插件下载地址：http://markbook.googlecode.com/files/marboo_v0.1.crx

安装
=====

.. image:: /media/images/marboo/crx-install-0.png
.. image:: /media/images/marboo/crx-install-1.png
.. image:: /media/images/marboo/crx-install-2.png
.. image:: /media/images/marboo/crx-install-3.png
.. image:: /media/images/marboo/crx-install-4.png
.. image:: /media/images/marboo/crx-install-5.png
.. image:: /media/images/marboo/crx-install-6.png

Google Chrome浏览器地址栏输入： chrome://extensions 来进入扩展程序管理页。

将下载的crx文件拖入该页来安装。

安装完毕，注意勾选：Allow access to file URLs(允许访问文件网址)

初始化配置
===========

配置markdown模板
------------------

新建一个模板文件，名字为md.template.html，输入如下内容：

.. code-block:: html

    <!DOCTYPE html>
    <html>
      <head>
        <meta charset="utf-8" />
      </head>
      <body>
        <textarea id="source" style="display:none">%s</textarea>
        <div id="preview" />
        <script src="http://marboo.biz/media/lib/markdown.js" type="text/javascript"></script>
        <script>
            var source=document.getElementById("source").value;
            document.getElementById("preview").innerHTML = markdown.toHTML(source);
        </script>
      </body>
    </html>

Windows用户
************

* XP：放到目录

.. code-block:: cmd

      C:\Documents And Settings\[User Name]\marboo\source\media\templates

* Win7: 放到目录

.. code-block:: cmd

  C:\Users\[User Name]\marboo\source\media\templates

如果修改过USERPROFILE环境变量，那么放到目录

.. code-block:: cmd

    %USERPROFILE%\marboo\source\media\templates

上述目录不存在的话手工建立

Linux用户
**********

放到目录

.. code-block:: console

    ~/.marboo/source/media/templates

配置默认编辑器
---------------

Windows下： media/bin/default_editor.bat

示例：

.. code-block:: bat

    notepad.exe %1

Linux下： media/bin/default_editor.sh

示例：

.. code-block:: shell

    gvim $1

使用说明
=========

目前实现的功能
---------------

* 左栏自动同步文件/目录的增删
* 双击左栏文件，调用本地编辑器编辑
* 右栏实时预览markdown文件

Marboo微群
===========

http://q.weibo.com/1656864

常见问题
=========

左栏为空
---------

#. 确保已经 初始化配置_

#. 右键->审查元素，点左下角第二个图标，进入javascript控制台

首先确认插件是否正确加载：

预期结果（看到TypeError莫惊慌）：

.. code-block:: console

    > core()
      "TypeError"

可能出现的错误结果：

.. code-block:: console

    > core()
      <object id="marboo-core" type="application/x-marboo" width="0" height="0" ></object>

解决方法：联系amoblin。

其次确认Marboo的目录：

.. code-block:: console

    > core().root
      "C:\Documents and Settings\Administrator/marboo/build"

若执行结果里面的marboo路径和 初始化配置_ 里面的marboo路径不符，那么将配置文件转移到这里的marboo路径下即可。

最后确认listDir函数正常工作：

.. code-block:: console

    > core().listDir("/")
      [ Object , Object , Object , Object , Object , Object , Object , Object ]

如果执行没有结果，请联系amoblin来进一步解决。

右栏无法显示预览
-----------------

请确认在插件管理页是否已勾选：允许访问文件网址。
