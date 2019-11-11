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

 - 2,错误如下:
 > [INFO] Checking for unexpected pre-existing outputs....
[INFO] Found 14 declared outputs which already exist on disk. This is likely because the`.dart_tool/build` folder was deleted, or you are submitting generated files to your source repository.
[SEVERE] Conflicting outputs were detected and the build is unable to prompt for permission to remove them. These outputs must be removed manually or the build can be run with `--delete-conflicting-o
utputs`. The outputs are: lib/data/http/rsp/BaseRsp.g.dart
 
[INFO] Generating build script...
[INFO] Generating build script completed, took 246ms
[SEVERE] Nothing can be built, yet a build was requested.
pub finished with exit code 78

解决方法: 
> //清除之前生成的文件，如果直接运行下面的不行。可以先尝试运行这个
> flutter packages pub run build_runner clean
> //可以直接运行这个
> flutter packages pub run build_runner build --delete-conflicting-outputs
