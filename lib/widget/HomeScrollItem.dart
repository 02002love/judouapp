/**
 * PackageName：judouapp
 * Author     ：songjinwei
 * Date       ：2019/3/3 22:57
 * Email      ：songjinwei007@gmail.com
 * Version    ：1.0
 * Description：首页 scrollview 的 item
 */
import 'package:flutter/material.dart';

class HomeScrollItem extends StatefulWidget {
  @override
  _HomeScrollItemState createState() => _HomeScrollItemState();
}

class _HomeScrollItemState extends State<HomeScrollItem> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('这是一个头'),
    );
  }
}


