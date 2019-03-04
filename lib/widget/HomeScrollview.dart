/**
 * PackageName：judouapp
 * Author     ：songjinwei
 * Date       ：2019/3/4 23:45
 * Email      ：songjinwei007@gmail.com
 * Version    ：1.0
 * Description：首页滑动的 scrollView
 */
import 'package:flutter/material.dart';
import 'package:judouapp/pages/hompage/model/home_model.dart';

class HomeScrollView extends StatefulWidget {
  const HomeScrollView({Key key, this.dataList,@required this.onPress}) : super(key: key);
  final List<HomeModel> dataList;
  final Function onPress;

  @override
  _HomeScrollViewState createState() => _HomeScrollViewState();
}

class _HomeScrollViewState extends State<HomeScrollView>
    with SingleTickerProviderStateMixin {
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
    return Stack(
      children: <Widget>[
        PageView(
          children: widget.dataList.map((item) {
            return Image.network(item.image.url);
          }).toList(),
          onPageChanged: onPageChanged,
        )
      ],
    );
  }
  onPageChanged (index){
    widget.onPress(index);
  }
}
