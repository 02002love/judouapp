/**
 * PackageName：judouapp
 * Author     ：songjinwei
 * Date       ：2019/3/1 23:30
 * Email      ：songjinwei007@gmail.com
 * Version    ：1.0
 * Description：动态
 */
import 'package:flutter/material.dart';
import 'package:judouapp/utils/AdaptDevice.dart';
import 'package:judouapp/utils/HttpRequest.dart';
import 'package:judouapp/utils/Config.dart';
import 'package:judouapp/pages/moments/model/square_model.dart';
import 'package:judouapp/pages/moments/MomentsDetailPage.dart';
import 'package:judouapp/pages/moments/view/MomentsCell.dart';

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
  int nowSince1970 = DateTime.now().millisecondsSinceEpoch; //现在时间距离1970年的秒数

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
                  fontWeight: FontWeight.w900,
                  fontFamily: 'NotoSansCJKsc-Light',
                  color: Colors.black),
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
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (BuildContext ctx) {
          return MomentsDetailPage();
        }));
      },
      child: Column(
        children: <Widget>[
          MomentsCell(model: item),
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
