import 'package:flutter/material.dart';
import 'package:judouapp/TabBarController.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    //设置适配尺寸 (填入设计稿中设备的屏幕尺寸) 假如设计稿是按iPhone6的尺寸设计的(iPhone6 750*1334)


    // TODO: implement build
    return TabBarController();
  }
}