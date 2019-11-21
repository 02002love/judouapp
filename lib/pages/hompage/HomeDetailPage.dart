import 'package:common_utils/common_utils.dart';
/**
 * PackageName：judouapp
 * Author     ：songjinwei
 * Date       ：2019/3/22 11:09
 * Email      ：songjinwei007@gmail.com
 * Version    ：1.0
 * Description：
 */
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:judouapp/pages/moments/view/SquareCell.dart';
import 'package:judouapp/pages/hompage/model/home_detail_model.dart';

import 'package:judouapp/utils/HttpRequest.dart';
import 'package:judouapp/utils/Config.dart';
import 'package:judouapp/utils/AdaptDevice.dart';

class HomeDetailPage extends StatefulWidget {
  HomeDetailPage({Key key, @required this.momentId}) : super(key: key);
  final String momentId;

  @override
  _HomeDetailPageState createState() => _HomeDetailPageState();
}

class _HomeDetailPageState extends State<HomeDetailPage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  HomeDetailModel model;

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    super.initState();
    fetchSquareDetailData();
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
        title: Text('金句'),
      ),
      body: Container(
        child: createChild(),
        color: Color.fromARGB(255, 240, 241, 242),
        height: AdaptDevice.screenH(),
      ),
    );
  }

  createChild() {
    if (model == null) {
      return Center(
        child: CupertinoActivityIndicator(),
      );
    } else {
      return SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              color: Color.fromARGB(255, 249, 249, 249),
              child: SquareCell(
                isFromHomePage: true,
                isVerified:
                    model.author == null ? false : model.author.isVerified,
                avatar: model.author == null || model.author.cover == null
                    ? Config.defaultIconImage
                    : model.author.cover,
                nickname: model.author == null ? '佚名' : model.author.name,
                publishedAt: //设置为东八区
                    DateUtil.getDateStrByMs(model.publishedAt * 1000,
                        format: DateFormat.YEAR_MONTH),
                uuid: model.uuid,
                content: model.content,
                picUrl: model.pictures.length == 0 ? '' : model.pictures[0].url,
                likeCount: model.likeCount.toString(),
                commentCount: model.commentCount.toString(),
              ),
            ),
            Container(
              height: AdaptDevice.px(550),
              width: AdaptDevice.screenW(),
              alignment: Alignment.topCenter,
              child: Text(
                '快来添加第一条评论吧',
                style: TextStyle(
                    fontSize: AdaptDevice.px(30),
                    fontFamily: 'NotoSansCJKsc-Light',
                    color: Colors.black38),
              ),
              padding: EdgeInsets.only(
                top: AdaptDevice.px(130),
              ),
            )
          ],
        ),
      );
    }
  }

  /* 加载首页详情数据-和广场数据一致 */
  fetchSquareDetailData() async {
    var result = await HttpRequest.request(Config.moments_squareDetailUrl +
        widget.momentId +
        Config.moments_squareDetailUrlPart);
    setState(() {
      model = HomeDetailModel.fromJson(result);
    });
  }
}
