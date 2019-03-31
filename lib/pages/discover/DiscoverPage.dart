/**
 * PackageName：judouapp
 * Author     ：songjinwei
 * Date       ：2019/3/1 23:29
 * Email      ：songjinwei007@gmail.com
 * Version    ：1.0
 * Description：发现
 */
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'package:judouapp/utils/HttpRequest.dart';
import 'package:judouapp/utils/Config.dart';
import 'package:judouapp/utils/AdaptDevice.dart';

import 'package:cached_network_image/cached_network_image.dart';

class DiscoverPage extends StatefulWidget {
  @override
  _DiscoverPageState createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  List banners = []; //banner的数组

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    super.initState();
    fetchFindPageBannerData();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('发现'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _initBannerView(),
          ],
        ),
      ),
    );
  }

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

  /* 加载发现-banner数据 */
  fetchFindPageBannerData() async {
    var result = await HttpRequest.request(Config.findBannerUrl);
    print(result);
    if (result != null) {
      List temp = result['data'];
      setState(() {
        banners = temp;
      });
    }
  }
}
