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
import 'package:judouapp/widget/VerticalText.dart';

class HomeScrollView extends StatefulWidget {
  const HomeScrollView({Key key, this.dataList, @required this.onPress})
      : super(key: key);
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
            return HomeScrollItem(item: item);
          }).toList(),
          onPageChanged: onPageChanged,
        )
      ],
    );
  }

  onPageChanged(index) {
    widget.onPress(index);
  }
}

/*  scrollView的 Item  */
class HomeScrollItem extends StatefulWidget {
  const HomeScrollItem({Key key, this.item}) : super(key: key);
  final HomeModel item;

  @override
  _HomeScrollItemState createState() => _HomeScrollItemState();
}

class _HomeScrollItemState extends State<HomeScrollItem>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(0),
        child: Stack(
          children: <Widget>[
            Image.network(
              widget.item.image.url,
              fit: BoxFit.fitWidth,
              height: 300,
              width: MediaQuery.of(context).size.width,
            ),
            Container(
                margin: EdgeInsets.only(top: 20.0, right: 10.0),
                child: CustomPaint(
                  painter: VerticalText(
                      text: '己亥猪年丙寅月戊戌日',
                      textStyle: TextStyle(fontSize: 12.0, color: Colors.white),
                      width: 100,
                      height: 150),
                )),
          ],
        ));
    ;
  }
}
