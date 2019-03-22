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
import 'package:judouapp/pages/moments/view/MomentsCell.dart';
import 'package:judouapp/utils/HttpRequest.dart';
import 'package:judouapp/utils/Config.dart';
import 'package:judouapp/pages/hompage/model/home_detail_model.dart';
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
        title: Text('详情'),
      ),
      body: Container(
        child: createChild(),
        color: Color.fromARGB(255, 240, 241, 242),
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
              child: MomentsCell(
                  isFromHomePage: true,
                  isVerified:
                      model.author == null ? false : model.author.isVerified,
                  avatar: model.author == null
                      ? model.reference.cover
                      : (model.author.cover.length == 0
                          ? 'http://judou.b0.upaiyun.com/uploads/authors/2018/05/367eb2cd-ab3e-4720-8b48-c3d64272f8b8.png'
                          : model.author.cover),
                  nickname: model.author == null
                      ? model.reference.name
                      : model.author.name,
                  publishedAt: //设置为东八区
                      (int.parse(model.publishedAt) + 28800).toString(),
                  uuid: model.uuid,
                  content: model.content,
                  picUrl:
                      model.pictures.length == 0 ? '' : model.pictures[0].url,
                  likeCount: model.likeCount.toString(),
                  commentCount: model.commentCount.toString()),
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

  /*加载广场详情数据*/
  fetchSquareDetailData() async {
    var result = await HttpRequest.request(Config.moments_squareDetailUrl +
        widget.momentId +
        Config.moments_squareDetailUrlPart);
    setState(() {
      model = HomeDetailModel.fromJson(result);
    });
  }
}
