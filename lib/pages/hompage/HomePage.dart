/**
 * PackageName：judouapp
 * Author     ：songjinwei
 * Date       ：2019/3/1 23:23
 * Email      ：songjinwei007@gmail.com
 * Version    ：1.0
 * Description：
 */
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:judouapp/utils/HttpRequest.dart';
import 'package:judouapp/pages/hompage/model/home_model.dart';
import 'package:judouapp/utils/Config.dart';

import 'package:flutter_refresh/flutter_refresh.dart';
import 'package:judouapp/widget/HomeScrollview.dart';
import 'package:judouapp/widget/CustomButton.dart';

import 'package:judouapp/utils/AdaptDevice.dart';

//import 'package:flutter_swiper/flutter_swiper.dart';
//import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  List<HomeModel> dataList = []; //数据源
  String commentCount = '';
  String likeCount = '';

  int btnWH = 50;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchHomePageData();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: Container(
          margin: EdgeInsets.only(
            left: AdaptDevice.px(20),
          ),
          child: ImageIcon(
            AssetImage('images/home/home_title.png'),
            size: AdaptDevice.px(btnWH),
          ),
        ),
        actions: <Widget>[
          CustomButton(
            iconPath: 'images/home/icon_home_comment.png',
            title: commentCount,
            btnHeight: AdaptDevice.px(btnWH),
            btnWidth: AdaptDevice.px(btnWH),
            titleHeight: 40,
          ),
          CustomButton(
            iconPath: 'images/home/icon_home_like.png',
            title: likeCount,
            btnHeight: AdaptDevice.px(btnWH),
            btnWidth: AdaptDevice.px(btnWH),
            titleHeight: 40,
          ),
          Container(
            padding: EdgeInsets.only(
              right: AdaptDevice.px(20),
            ),
            child: CustomButton(
              iconPath: 'images/home/icon_home_share.png',
              title: '',
              btnHeight: AdaptDevice.px(btnWH),
              btnWidth: AdaptDevice.px(btnWH),
              titleHeight: 40,
            ),
          )
        ],
      ),
      body: createListView(),
    );
  }

  /*创建 scrollView*/
  createListView() {
    return HomeScrollView(
        onPress: (index) {
          setState(() {
            commentCount = dataList[index].commentCount.toString();
            likeCount = dataList[index].likeCount.toString();
          });
        },
        dataList: dataList);
  }

  /*加载数据*/
  fetchHomePageData() async {
    var result =
        await HttpRequest.request(Config.homeUrl, method: HttpRequest.GET);
    List data = result['data'];
    setState(() {
      for (var item in data) {
        HomeModel model = HomeModel.fromJson(item);
        dataList.add(model);
      }
      HomeModel firstModel = dataList[0];
      commentCount = firstModel.commentCount.toString();
      likeCount = firstModel.likeCount.toString();
    });
  }
}
