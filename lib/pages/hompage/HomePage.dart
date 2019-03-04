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
import 'model/home_model.dart';
import 'package:judouapp/utils/Config.dart';

import 'package:flutter_refresh/flutter_refresh.dart';
import 'package:judouapp/widget/HomeScrollItem.dart';
import 'package:judouapp/widget/CustomButton.dart';

//import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:carousel_slider/carousel_slider.dart';

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
            margin: EdgeInsets.only(left: 10),
            child: ImageIcon(AssetImage('images/home/home_title.png')),
          ),
          actions: <Widget>[
            CustomButton(
              iconPath: 'images/home/icon_home_comment.png',
              title: commentCount,
            ),
            CustomButton(
              iconPath: 'images/home/icon_home_like.png',
              title: likeCount,
            ),
            Container(
              padding: EdgeInsets.only(right: 10),
              child: CustomButton(
                iconPath: 'images/home/icon_home_share.png',
                title: '',
              ),
            )
          ],
        ),
        body: createListView());
  }

  /*创建 listView*/
  createListView() {
    return CarouselSlider(
      aspectRatio: 1,
      enlargeCenterPage: true,
      items: dataList.map((item) {
        return Builder(builder: (BuildContext context) {
          return Container(
            width: MediaQuery.of(context).size.width,
            decoration: new BoxDecoration(color: Colors.white),
            child: Image.network(
              item.image.url,
              fit: BoxFit.fill,
              width: MediaQuery.of(context).size.width,
              height: 200.0,
            ),
          );
        });
      }).toList(),
      height: 300.0,
      onPageChanged: (){
        print('变了');
      },
    );
  }

  createListViewItem(HomeModel item, index, cxt) {
    var row = Center(
      child: Container(
        child: Image.network(
          item.image.url,
          width: MediaQuery.of(context).size.width,
        ),
      ),
    );
    return Card(
      child: InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext ctx) {
            return;
          }));
        },
        child: row,
      ),
    );
  }

  /*加载数据*/
  fetchHomePageData() {
    HttpRequest.get(Config.homeUrl, (result) {
      List data = result['data'];
      setState(() {
        for (var item in data) {
          HomeModel model = HomeModel.fromJson(item);
          if (model.isAd) {
          } else
            dataList.add(model);
        }
        HomeModel firstModel = dataList[0];
        commentCount = firstModel.commentCount.toString();
        likeCount = firstModel.likeCount.toString();
      });
    });
  }
}
