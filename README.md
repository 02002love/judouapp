# judouapp

句读App 的 Flutter 版本

json生成实体的步骤: 
- 1.json生成实体: https://caijinglong.github.io/json2dart/index_ch.html
- 2.json 生产.g.dart的命令: flutter packages pub run build_runner build

问题总结: 
- 1,/Users/.../Library/Flutter/flutter/bin/flutter --no-color packages get
Waiting for another flutter command to release the startup lock...
解决方法: 
>1：关闭 AndroidStudio

>2：CTRL+ALT+DEL 关闭所有 dart进程和android进程,注意adb这个别忘了关
 
>3：打开 flutter 安装目录  如：...\flutter\flutter\bin\cache,删除里面的 lockfile
 
 >4：打开 AndroidStudio 先点击下面的 Invalidate 再打开此窗口 点击 Just Restart