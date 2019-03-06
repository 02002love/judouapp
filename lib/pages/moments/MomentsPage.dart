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
    return DefaultTabController(
        length: tabsList.length,
        child: Scaffold(
          appBar: AppBar(
            title: Text('动态'),
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
                        child: Text(tab.text + '页面'),
                      ))
                  .toList()),
        ));
  }

  move2Page(String pathString) {
    print('路由是: ' + pathString);
  }
}
