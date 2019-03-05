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
import '../utils/HttpRequest.dart';
import '../utils/Config.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
  String cyclicalYear = ''; //己亥年
  String animal = ''; //猪
  String cyclicalMonth = ''; //丙寅月
  String cyclicalDay = ''; //辛丑日
  String cnmonth = ''; //正月
  String cnday = ''; //廿九

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchChinaDateData(widget.item.dailyDate);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(0),
        //
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
//配图
                Image.network(
                  widget.item.image.url,
                  fit: BoxFit.fitWidth,
                  height: ScreenUtil().setHeight(400),
                  width: MediaQuery.of(context).size.width,
                ),
//中国黄历
                Container(
                  width: 40,
                  margin: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width - 120, top: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      CustomPaint(
                        painter: VerticalText(
                            text: '$cnmonth月$cnday',
                            textStyle: TextStyle(
                              fontSize: 12.0,
                              color: Colors.white,
                              fontFamily: 'NotoSansCJKsc-Light',
                            ),
                            width: 20,
                            height: 150),
                      ),
                      CustomPaint(
                        painter: VerticalText(
                            text: '$cyclicalMonth月$cyclicalDay日',
                            textStyle: TextStyle(
                              fontSize: 12.0,
                              color: Colors.white,
                              fontFamily: 'NotoSansCJKsc-Light',
                            ),
                            width: 20,
                            height: 150),
                      ),
                      CustomPaint(
                        painter: VerticalText(
                            text: '$cyclicalYear$animal年',
                            textStyle: TextStyle(
                              fontSize: 12.0,
                              color: Colors.white,
                              fontFamily: 'NotoSansCJKsc-Light',
                            ),
                            width: 20,
                            height: 150),
                      )
                    ],
                  ),
                ),
//日期的号
                Container(
                    margin: EdgeInsets.only(
                        top: ScreenUtil().setHeight(220),
                        left: ScreenUtil().setHeight(20)),
                    child: Container(
                      child: Text(
                          widget.item.dailyDate
                              .substring(widget.item.dailyDate.length - 2),
                          style: TextStyle(
                            height: 1,
                            color: Colors.white,
                            fontSize: 110,
                            shadows: [
                              Shadow(
                                  // bottomLeft
                                  offset: Offset(-.5, -.5),
                                  color: Colors.black),
                              Shadow(
                                  // bottomRight
                                  offset: Offset(.5, -.5),
                                  color: Colors.black),
                              Shadow(
                                  // topRight
                                  offset: Offset(.5, .5),
                                  color: Colors.black),
                              Shadow(
                                  // topLeft
                                  offset: Offset(-.5, .5),
                                  color: Colors.black),
                            ],
                          )),
                    )),
//日期 + 周末
                Container(
                  width: ScreenUtil().setHeight(150),
                  margin: EdgeInsets.only(
                      left: ScreenUtil().setHeight(
                          int.parse(MediaQuery.of(context).size.width.toStringAsFixed(0)) - 120),
                      right: 10,
                      top: ScreenUtil().setHeight(300)),
                  child: Text(
                    widget.item.dailyDate.substring(0, 7).replaceAll('-', '.'),
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      fontFamily: 'NotoSansCJKsc-Light',
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
//经典内容
            Container(
              height: ScreenUtil().setHeight(120),
              margin: EdgeInsets.only(
                  left: ScreenUtil().setHeight(30),
                  right: ScreenUtil().setHeight(30)),
              child: Text(
                widget.item.content,
                style: TextStyle(
                  fontFamily: 'NotoSansCJKsc-Light',
                  fontSize: ScreenUtil().setSp(36),
                ),
              ),
            ),
//摘抄或者出处
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(
                  top: 1,
                  left: ScreenUtil().setHeight(30),
                  right: ScreenUtil().setHeight(30)),
              child: Text(
                widget.item.subheading,
                textAlign: TextAlign.end,
                style: TextStyle(
                  fontFamily: 'NotoSansCJKsc-Light',
                  fontSize: ScreenUtil().setSp(36),
                ),
              ),
            )
          ],
        ));
    ;
  }

  /*请求中国黄历数据*/
  fetchChinaDateData(dateString) {
    HttpRequest.getChinaDate(Config.chinaDate + dateString, (result) {
      Map chinaDateData = result['data'];
      print('打印:$chinaDateData');
      setState(() {
        cyclicalYear = chinaDateData['cyclicalYear']; //己亥年
        animal = chinaDateData['animal']; //猪
        cyclicalMonth = chinaDateData['cyclicalMonth']; //丙寅月
        cyclicalDay = chinaDateData['cyclicalDay']; //辛丑日
        cnmonth = chinaDateData['cnmonth']; //正月
        cnday = chinaDateData['cnday']; //廿九
      });
    });
  }
}
