/**
 * PackageName：judouapp
 * Author     ：songjinwei
 * Date       ：2019/3/1 23:30
 * Email      ：songjinwei007@gmail.com
 * Version    ：1.0
 * Description：动态
 */
import 'package:flutter/material.dart';
import '../../utils/AdaptDevice.dart';

import 'package:judouapp/utils/HttpRequest.dart';
import 'package:judouapp/utils/Config.dart';

import 'model/square_model.dart';
import 'package:judouapp/widget/CustomButton.dart';
import 'package:common_utils/common_utils.dart';

class MomentsPage extends StatefulWidget {
  @override
  _MomentsPageState createState() => _MomentsPageState();
}

class _MomentsPageState extends State<MomentsPage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  final List<Tab> tabsList = <Tab>[
    Tab(
      text: '广场',
    ),
    Tab(
      text: '订阅',
    ),
    Tab(
      text: '日记',
    )
  ];

  List<SquareModel> squareDataList = []; //广场数据源
  String title = '';
  int startNo = 0;
  int countPrePage = 20; //每页多少个 item
  int nowSince1970 = DateTime.now().millisecondsSinceEpoch;

  List<Widget> topOfItem = [];

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    super.initState();
    fetchSquareData();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: tabsList.length,
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              '动态',
              style: TextStyle(
                  fontFamily: 'NotoSansCJKsc-Light', color: Colors.black),
            ),
            actions: <Widget>[
              PopupMenuButton(
                icon: Icon(Icons.add),
                itemBuilder: (BuildContext ctx) => <PopupMenuItem<String>>[
                      PopupMenuItem(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Image.asset(
                                'images/moments/icon_create_sentence.png',
                                width: AdaptDevice.px(40),
                                height: AdaptDevice.px(40)),
                            Text('摘抄句子')
                          ],
                        ),
                        value: 'ZLJZ',
                      ),
                      PopupMenuItem(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Image.asset('images/moments/icon_create_status.png',
                                width: AdaptDevice.px(40),
                                height: AdaptDevice.px(40)),
                            Text('发表动态')
                          ],
                        ),
                        value: 'FBDT',
                      ),
                      PopupMenuItem(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Image.asset('images/moments/icon_create_diary.png',
                                width: AdaptDevice.px(40),
                                height: AdaptDevice.px(40)),
                            Text('写日记')
                          ],
                        ),
                        value: 'XRJ',
                      ),
                    ],
                onSelected: (String value) {
                  switch (value) {
                    case 'ZLJZ':
                      move2Page('摘抄句子');
                      break;
                    case 'FBDT':
                      move2Page('发表动态');
                      break;
                    case 'XRJ':
                      move2Page('写日记');
                      break;
                  }
                },
              )
            ],
            bottom: TabBar(
              unselectedLabelColor: Color.fromARGB(255, 143, 148, 149),
              labelStyle: TextStyle(fontSize: AdaptDevice.px(35)),
              tabs: tabsList,
              indicatorSize: TabBarIndicatorSize.label,
              indicator: UnderlineTabIndicator(
                  insets: EdgeInsets.only(
                      bottom: AdaptDevice.px(10),
                      left: AdaptDevice.px(14),
                      right: AdaptDevice.px(14)),
                  borderSide: BorderSide(
                      color: Color.fromARGB(255, 194, 199, 212),
                      width: AdaptDevice.px(5),
                      style: BorderStyle.solid)),
            ),
          ),
          body: TabBarView(
              children: tabsList
                  .map((Tab tab) => Center(
                        child: createList(),
                      ))
                  .toList()),
        ));
  }

/*页面跳转*/
  move2Page(String pathString) {
    print('路由是: ' + pathString);
  }

  /*创建 listView*/
  createList() {
//    if (dataList.length == 0) {
//      return CupertinoActivityIndicator();
//    } else {
    return ListView.builder(
//      physics: physics,
//      controller: controller,
      itemCount: squareDataList.length,
      itemBuilder: (BuildContext context, int position) {
        return createItem(squareDataList[position], position, context);
      },
    );
//    }
  }

  /*创建 item*/
  createItem(SquareModel item, index, context) {
    var row = Container(
      margin: EdgeInsets.all(4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          //上部: 头像,昵称,时间,向下箭头
          TopOfItem(model: item),
          //文本内容
          Container(
            margin: EdgeInsets.all(AdaptDevice.px(20)),
            alignment: Alignment.centerLeft,
            child: Text(
              item.content,
              style: TextStyle(fontFamily: 'NotoSansCJKsc-Light'),
            ),
          ),
          BottomOfItem(),
        ],
      ),
    );
    return Card(
        child: InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (BuildContext ctx) {
          return Text('硕硕');
        }));
      },
      child: row,
    ));
  }

  /*加载广场数据*/
  fetchSquareData() {
    HttpRequest.get(Config.moments_squareUrl, (result) {
      List data = result['data'];
      print(data);
      setState(() {
        for (var item in data) {
          SquareModel model = SquareModel.fromJson(item);
          if (model.isAd) {
          } else
            squareDataList.add(model);
        }
      });
    });
  }
}

//上部: 头像,昵称,时间,向下箭头
class TopOfItem extends StatelessWidget {
  const TopOfItem({Key key, @required this.model}) : super(key: key);
  final SquareModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AdaptDevice.px(20)),
      child: Row(
        children: <Widget>[
          //头像
          Container(
            margin: EdgeInsets.only(right: 10),
            child: CircleAvatar(
                backgroundColor: Colors.white10,
                backgroundImage: NetworkImage(model.user.avatar)),
          ),
          Expanded(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              //昵称,时间
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    model.user.nickname,
                    style: TextStyle(
                      fontSize: AdaptDevice.px(30),
                      fontFamily: 'NotoSansCJKsc-Light',
                    ),
                  ),
                  Text(
                      //日期中文显示: 五分钟前
                      TimelineUtil.format(model.createdAt * 1000,
                          locTimeMillis: DateTime.now().millisecondsSinceEpoch,
                          locale: 'zh',
                          dayFormat: DayFormat.Full),
                      style: TextStyle(
                          fontFamily: 'NotoSansCJKsc-Light',
                          fontSize: AdaptDevice.px(20),
                          color: Color.fromARGB(255, 210, 215, 223)))
                ],
              ),
              CustomButton(
                title: '',
                iconPath: 'images/moments/square/cell_more.png',
                btnWidth: AdaptDevice.px(60),
                btnHeight: AdaptDevice.px(60),
              )
            ],
          ))
        ],
      ),
    );
  }
}

class BottomOfItem extends StatelessWidget {
  final List iconPaths = [
    'images/moments/square/icon_like.png',
    'images/moments/square/icon_comment.png',
    'images/moments/square/icon_collect.png',
    'images/moments/square/icon_share.png'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          EdgeInsets.only(left: AdaptDevice.px(20), right: AdaptDevice.px(20)),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
              iconPaths.length,
              (int index) => Container(
                    child: CustomButton(
                      btnHeight: AdaptDevice.px(40),
                      btnWidth: AdaptDevice.px(40),
                      iconPath: iconPaths[index],
                      title: '',
                    ),
                  ))),
    );
  }
}
