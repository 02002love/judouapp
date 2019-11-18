/**
 * PackageName：judouapp
 * Author     ：songjinwei
 * Date       ：2019/3/1 23:30
 * Email      ：songjinwei007@gmail.com
 * Version    ：1.0
 * Description：动态
 */
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:judouapp/utils/AdaptDevice.dart';
import 'package:judouapp/utils/HttpRequest.dart';
import 'package:judouapp/utils/Config.dart';
import 'package:judouapp/pages/moments/model/square_model.dart';

import 'package:judouapp/pages/moments/SquareDetailPage.dart';
import 'package:judouapp/pages/moments/DiariesDetailPage.dart';

import 'package:judouapp/pages/moments/view/SquareCell.dart';
import 'package:judouapp/pages/moments/view/DiariesCell.dart';

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
  List<SquareModel> diariesDataList = []; //日记数据源
  String title = '';
  int startNo = 0;
  int countPrePage = 20; //每页多少个 item
  int nowSince1970 = DateTime.now().millisecondsSinceEpoch; //现在时间距离1970年的秒数

  List<Widget> topOfItem = [];

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    super.initState();
    fetchSquareData();
    fetchDiariesData();
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
          elevation: 0,
          title: Text(
            '动态',
            style: TextStyle(
                fontWeight: FontWeight.w900,
                fontFamily: 'NotoSansCJKsc-Light',
                color: Colors.black
                ),
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
                            height: AdaptDevice.px(40),
                          ),
                          Text('摘抄句子')
                        ],
                      ),
                      value: 'ZLJZ',
                    ),
                    PopupMenuItem(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Image.asset(
                            'images/moments/icon_create_status.png',
                            width: AdaptDevice.px(40),
                            height: AdaptDevice.px(
                              40,
                            ),
                          ),
                          Text('发表动态')
                        ],
                      ),
                      value: 'FBDT',
                    ),
                    PopupMenuItem(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Image.asset(
                            'images/moments/icon_create_diary.png',
                            width: AdaptDevice.px(40),
                            height: AdaptDevice.px(40),
                          ),
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
            labelStyle: TextStyle(
              fontSize: AdaptDevice.px(35),
            ),
            tabs: tabsList,
            indicatorSize: TabBarIndicatorSize.label,
            indicator: UnderlineTabIndicator(
              insets: EdgeInsets.only(
                bottom: AdaptDevice.px(10),
                left: AdaptDevice.px(14),
                right: AdaptDevice.px(14),
              ),
              borderSide: BorderSide(
                  color: Color.fromARGB(255, 194, 199, 212),
                  width: AdaptDevice.px(5),
                  style: BorderStyle.solid),
            ),
          ),
        ),
        body: TabBarView(
          children: createTabBarItem(tabsList),
        ),
      ),
    );
  }

/*页面跳转*/
  move2Page(String pathString) {
    print('路由是: ' + pathString);
  }

/*创建 tabBar 的内容*/
  createTabBarItem(List<Tab> tabs) {
    List tabBarItems = List<Widget>();
    for (int i = 0; i < tabs.length; i++) {
      if (i == 0) {
        tabBarItems.add(
          Center(
            child: createSquareList(),
          ),
        );
      } else if (i == 1) {
        tabBarItems.add(
          Center(
            child: Text(
              '登录才能订阅哦',
              style: TextStyle(
                  fontSize: AdaptDevice.px(30),
                  fontFamily: 'NotoSansCJKsc-Light',
                  color: Colors.black38),
            ),
          ),
        );
        ;
      } else {
        tabBarItems.add(
          createDiariesList(),
        );
      }
    }
    return tabBarItems;
  }

  /*创建 广场的listView*/
  createSquareList() {
    if (squareDataList.length == 0) {
      return CupertinoActivityIndicator();
    } else {
      return ListView.builder(
//      physics: physics,
//      controller: controller,
        itemCount: squareDataList.length,
        itemBuilder: (BuildContext context, int position) {
          return createItem(squareDataList[position], 0, context); //0 : 广场 list
        },
      );
    }
  }

  /*创建 日记的listView*/
  createDiariesList() {
    if (diariesDataList.length == 0) {
      return CupertinoActivityIndicator();
    } else {
      return ListView.builder(
//      physics: physics,
//      controller: controller,
        itemCount: diariesDataList.length,
        itemBuilder: (BuildContext context, int position) {
          return createItem(diariesDataList[position], 2, context); //2: 日记 list
        },
      );
    }
  }

  /*创建 item
  * index  0:广场, 2:日记
  * */
  createItem(SquareModel item, index, context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (BuildContext ctx) {
            return index == 0
                ? SquareDetailPage(momentId: item.uuid)
                : DiariesDetailPage(
                    avatar: item.user.avatar,
                    nickname: item.user.nickname,
                    publishedAt: item.createdAt.toString(),
                    uuid: item.user.uuid,
                    content: item.content,
                    picUrl: item.pictures.length == 0
                        ? ''
                        : item.pictures[0]['url'],
                  );
          }),
        );
      },
      child: Column(
        children: <Widget>[
          index == 0
              ? SquareCell(
                  isListCell: true,
                  avatar: item.user.avatar,
                  nickname: item.user.nickname,
                  publishedAt: item.createdAt.toString(),
                  uuid: item.uuid,
                  content: item.content,
                  picUrl:
                      item.pictures.length == 0 ? '' : item.pictures[0]['url'],
                  likeCount: item.likeCount.toString(),
                  commentCount: item.commentCount.toString(),
                )
              : DiariesCell(
                  isListCell: true,
                  avatar: item.user.avatar,
                  nickname: item.user.nickname,
                  publishedAt: item.createdAt.toString(),
                  uuid: item.uuid,
                  content: item.content,
                  picUrl:
                      item.pictures.length == 0 ? '' : item.pictures[0]['url']),
          Container(
            //灰色的分割线
            color: Color.fromARGB(255, 240, 241, 242),
            height: AdaptDevice.px(20),
          ),
        ],
      ),
    );
  }

  /*加载广场数据*/
  fetchSquareData() async {
    var result = await HttpRequest.request(Config.moments_squareUrl);
    List data = result['data'];
    setState(() {
      for (var item in data) {
        SquareModel model = SquareModel.fromJson(item);
        if (model.isAd) {
        } else
          squareDataList.add(model);
      }
    });
  }

  /*加载日记数据*/
  fetchDiariesData() async {
    var result = await HttpRequest.request(Config.moments_diariesUrl);
    List data = result['data'];
    setState(() {
      for (var item in data) {
        SquareModel model = SquareModel.fromJson(item);
        diariesDataList.add(model);
      }
    });
  }
}
