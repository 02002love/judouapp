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
import 'package:judouapp/pages/discover/model/discover_mark_model.dart';
import 'package:judouapp/pages/moments/view/SquareCell.dart';

class DiscoverPage extends StatefulWidget {
  @override
  _DiscoverPageState createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  TabController currentTabController; //当前的 tabController
  int currentIndex; //当前的 tabController的 index

  List banners = []; //banner的数组
  List marksData = []; //mark的数组
  List<Tab> marksTab = <Tab>[]; //mark的Tab数组
  List<DiscoverMarkModel> otherListData = []; //列表的公共数组

  @override
  void initState() {
//    _controller = AnimationController(vsync: this);
    super.initState();
    _fetchDiscoverPageMarkData();
    _fetchDiscoverPageBannerData();

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
                  controller: currentTabController,
                  unselectedLabelColor: Color.fromARGB(255, 143, 148, 149),
                  labelStyle: TextStyle(
                    fontSize: AdaptDevice.px(35),
                  ),
                  tabs: marksTab,
                  onTap: (int index) {
                    _tabOnTap(index);
                  },
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
                controller: currentTabController,
                children: _createDiscoverTabBarItem(marksTab),
              ),
            ),
          );
  }

  _tabOnTap(int index) {
    if (index != 0) {
      _fetchDiscoverPageOtherMarkData(marksData[index - 1]['id']);
    }
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
          marksTabs.add(
            _createOtherList(),
          );
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
  _createOtherList() {
    if (otherListData.length == 0) {
      return CupertinoActivityIndicator();
    } else {
      return ListView.builder(
//      physics: physics,
//      controller: controller,
        itemCount: otherListData.length,
        itemBuilder: (BuildContext context, int position) {
          return _createListCell(otherListData[position], context); //0 : 广场 list
        },
      );
    }
  }

  _createListCell(DiscoverMarkModel item, context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (BuildContext ctx) {
            return;
            //SquareDetailPage(momentId: item.uuid);
          }),
        );
      },
      child: Column(
        children: <Widget>[
          SquareCell(
            isFromHomePage: true,
            isVerified: item.author == null ? false : item.author.isVerified,
            avatar: item.author == null ? item.reference.cover ?? Config.defaultIconImage : item.author.cover ?? Config.defaultIconImage,
            nickname: item.author == null ? item.reference.name : item.author.name,
            publishedAt: '',
            uuid: item.uuid,
            content: item.content,
            picUrl: item.pictures.length == 0 ? '' : item.pictures[0].url,
            likeCount: item.likeCount.toString(),
            commentCount: item.commentCount.toString(),
          ),
          Container(
            //灰色的分割线
            color: Color.fromARGB(255, 240, 241, 242),
            height: AdaptDevice.px(20),
          ),
        ],
      ),
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
  _fetchDiscoverPageMarkData() async {
    var result = await HttpRequest.request(Config.discoverMarkUrl);
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
      currentTabController = TabController(vsync: this, initialIndex: 0, length: temp.length + 1);
      currentTabController.addListener((){
        if(currentTabController.indexIsChanging){
          if(currentTabController.index != 0){
            _fetchDiscoverPageOtherMarkData(marksData[currentTabController.index - 1]['id']);
          }
        }
      });
    }
  }

  /* 加载发现-banner数据 */
  _fetchDiscoverPageBannerData() async {
    var result = await HttpRequest.request(Config.discoverBannerUrl);
    if (result != null) {
      List temp = result['data'];
      setState(() {
        banners = temp;
      });
    }
  }

  /* 加载发现之外的 mark 的数据 */
  _fetchDiscoverPageOtherMarkData(int id) async {
    var result = await HttpRequest.request(Config.discoverSingleMarkUrl +
        id.toString() +
        Config.discoverSingleMarkUrlPart);
    print('加载发现之外的 mark 的数据');
    if (result != null) {
      List temp = result['data'];
      setState(() {
        otherListData.clear();
        for (var item in temp) {
          DiscoverMarkModel model = DiscoverMarkModel.fromJson(item);
          if (model.isAd) {
          } else
            otherListData.add(model);
        }
      });
    }
  }
}
