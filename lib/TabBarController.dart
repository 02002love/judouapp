/**
 * PackageName：judouapp
 * Author     ：songjinwei
 * Date       ：2019/3/1 23:15
 * Email      ：songjinwei007@gmail.com
 * Version    ：1.0
 * Description：
 */
import 'package:flutter/material.dart';
import 'package:judouapp/pages/hompage/HomePage.dart';
import 'package:judouapp/pages/discover/DiscoverPage.dart';
import 'package:judouapp/pages/moments/MomentsPage.dart';
import 'package:judouapp/pages/mine/MinePage.dart';

class TabBarController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      theme: ThemeData(
        primaryColor: const Color(0xffF69409),
      ),
      debugShowCheckedModeBanner: false,
      home: MainPageWidget(),
    );
  }
}

class MainPageWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MainPageState();
  }
}

class MainPageState extends State<MainPageWidget> {
  int _tabIndex = 0;
  var tabImages;
  var tabTitles = ['首页', '发现', '动态', '我的'];
  var pageList; //页面数组声明

  Image getTabIcon(int currentIndex) {
    if (currentIndex == _tabIndex) {
      return tabImages[currentIndex][1];
    }
    return tabImages[currentIndex][0];
  }

  Text getTabTitle(int currentIndex) {
    if (currentIndex == _tabIndex) {
      return Text(
        tabTitles[currentIndex],
        style: TextStyle(
          fontSize: 14.0,
          color: const Color(0xffF69409),
        ),
      );
    } else {
      return Text(
        tabTitles[currentIndex],
        style: TextStyle(fontSize: 14.0, color: const Color(0xff515151)),
      );
    }
  }

  Image getTabImage(path) {
    return Image.asset(
      path,
      width: 24.0,
      height: 24.0,
    );
  }

  void initData() {
    tabImages = [
      [
        getTabImage('images/tab/tab_home.png'),
        getTabImage('images/tab/tab_home_selected.png')
      ],
      [
        getTabImage('images/tab/tab_discover.png'),
        getTabImage('images/tab/tab_discover_selected.png')
      ],
      [
        getTabImage('images/tab/tab_moments.png'),
        getTabImage('images/tab/tab_moments_selected.png')
      ],
      [
        getTabImage('images/tab/tab_mine.png'),
        getTabImage('images/tab/tab_mine_selected.png')
      ]
    ];

    pageList = [
      HomePage(),
      DiscoverPage(),
      MomentsPage(),
      MinePage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //初始化数据
    initData();

    return Scaffold(
      body: pageList[_tabIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: getTabIcon(0),
            title: getTabTitle(0),
          ),
          BottomNavigationBarItem(
            icon: getTabIcon(1),
            title: getTabTitle(1),
          ),
          BottomNavigationBarItem(
            icon: getTabIcon(2),
            title: getTabTitle(2),
          ),
          BottomNavigationBarItem(
            icon: getTabIcon(3),
            title: getTabTitle(3),
          ),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: _tabIndex,
        iconSize: 24.0,
        onTap: (index) {
          setState(() {
            _tabIndex = index;
          });
        },
      ),
    );
  }
}
