/**
 * PackageName：judouapp
 * Author     ：songjinwei
 * Date       ：2019/3/1 23:29
 * Email      ：songjinwei007@gmail.com
 * Version    ：1.0
 * Description：
 */
import 'package:flutter/material.dart';

class DiscoverPage extends StatefulWidget {
  @override
  _DiscoverPageState createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> with SingleTickerProviderStateMixin {
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
    return Container();
  }
}
