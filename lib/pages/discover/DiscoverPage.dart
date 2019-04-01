/**
 * PackageName：judouapp
 * Author     ：songjinwei
 * Date       ：2019/3/1 23:29
 * Email      ：songjinwei007@gmail.com
 * Version    ：1.0
 * Description：发现
 */
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter_swiper/flutter_swiper.dart';

import 'package:judouapp/utils/HttpRequest.dart';
import 'package:judouapp/utils/Config.dart';
import 'package:judouapp/utils/AdaptDevice.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:judouapp/pages/hompage/model/home_detail_model.dart';
import 'package:judouapp/pages/moments/view/SquareCell.dart';

class DiscoverPage extends StatefulWidget {
  @override
  _DiscoverPageState createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  List banners = []; //banner的数组
  List marksData = []; //mark的数组
  List<Tab> marksTab = <Tab>[]; //mark的Tab数组
  List<HomeDetailModel> otherListData = []; //列表的公共数组

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    super.initState();
    _fetchFindPageMarkData();
    _fetchFindPageBannerData();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return marksTab.length == 0
        ? Container()
        : DefaultTabController(
      length: marksTab.length,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          bottom: TabBar(
            unselectedLabelColor: Color.fromARGB(255, 143, 148, 149),
            labelStyle: TextStyle(
              fontSize: AdaptDevice.px(35),
            ),
            tabs: marksTab,
            isScrollable: true,
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
          children: _createDiscoverTabBarItem(marksTab),
        ),
      ),
    );
  }

  /*创建 mark 的 itemPage*/
  _createDiscoverTabBarItem(List<Tab> tabs) {
    List<Widget> marksTabs = <Widget>[];
    for (var i = 0; i < tabs.length; ++i) {
      var o = tabs[i];
      if (i == 0) {
        marksTabs.add(
          _createSingleFindMark(),
        );
      } else {
        try {
          _createOtherList(marksData[i - 1]['id']);
        } catch (e) {
          print('异常:$e');
        }
      }
    }
    return marksTabs;
  }

  /*创建 发现标签的页面*/
  _createSingleFindMark() {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          _initBannerView(),
        ],
      ),
    );
  }

  /*创建 其他页面的listView*/
  _createOtherList(int id) {
    _fetchFindPageOtherMarkData(id);
    if (otherListData.length == 0) {
      return CupertinoActivityIndicator();
    } else {
      return ListView.builder(
//      physics: physics,
//      controller: controller,
        itemCount: otherListData.length,
        itemBuilder: (BuildContext context, int position) {
          return _createListCell(otherListData[position]); //0 : 广场 list
        },
      );
    }
  }

  _createListCell(HomeDetailModel model) {
    //公用首页的 cell
    return SquareCell(
      isFromHomePage: true,
      isVerified:
      model.author == null ? false : model.author.isVerified,
      avatar: model.author == null
          ? model.reference.cover
          : (model.author.cover.length == 0
          ? Config.defaultIconImage
          : model.author.cover),
      nickname: model.author == null
          ? model.reference.name
          : model.author.name,
      publishedAt: //设置为东八区
      (int.parse(model.publishedAt) + 28800).toString(),
      uuid: model.uuid,
      content: model.content,
      picUrl: model.pictures.length == 0 ? '' : model.pictures[0].url,
      likeCount: model.likeCount.toString(),
      commentCount: model.commentCount.toString(),
    );
  }

  /*banner图*/
  _initBannerView() {
    return banners.length > 0
        ? Container(
      height: AdaptDevice.screenW() * .5,
      width: AdaptDevice.screenW(),
      child: Swiper(
        itemCount: banners.length,
        itemBuilder: (BuildContext ctx, int index) {
          return CachedNetworkImage(
            imageUrl: banners[index]['cover'],
            fit: BoxFit.cover,
            height: AdaptDevice.screenW() * .5,
            width: AdaptDevice.screenW(),
          );
        },
        autoplay: true,
        duration: 500,
        autoplayDisableOnInteraction: false,
        pagination: SwiperPagination(
          builder: DotSwiperPaginationBuilder(
            color: Colors.white70,
            activeColor: Colors.white,
            activeSize: AdaptDevice.px(22),
          ),
        ),
      ),
    )
        : Container();
  }

  /* 加载发现-标签数据 */
  _fetchFindPageMarkData() async {
    var result = await HttpRequest.request(Config.findMarkUrl);
    if (result != null) {
      List temp = result['data'];
      marksTab.add(
        Tab(
          text: '发现',
        ),
      );
      setState(() {
        for (Map map in temp) {
          marksData = temp;
          marksTab.add(
            Tab(
              text: map['name'],
            ),
          );
        }
      });
    }
  }

  /* 加载发现-banner数据 */
  _fetchFindPageBannerData() async {
    var result = await HttpRequest.request(Config.findBannerUrl);
    print(result);
    if (result != null) {
      List temp = result['data'];
      setState(() {
        banners = temp;
      });
    }
  }

  /* 加载发现之外的 mark 的数据 */
  _fetchFindPageOtherMarkData(int id) async {
    var result = await HttpRequest.request(
        Config.findSingleMarkUrl + id.toString() +
            Config.findSingleMarkUrlPart);
    if (result != null) {
      List temp = result['data'];
      setState(() {
        for (var item in temp) {
          HomeDetailModel model = HomeDetailModel.fromJson(item);
          otherListData.add(model);
        }
      });
    }
  }
}
