/**
 * PackageName：judouapp
 * Author     ：songjinwei
 * Date       ：2019/3/19 17:03
 * Email      ：songjinwei007@gmail.com
 * Version    ：1.0
 * Description：
 */
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:judouapp/pages/moments/view/MomentsCell.dart';
import 'package:judouapp/utils/HttpRequest.dart';
import 'package:judouapp/utils/Config.dart';
import 'package:judouapp/pages/moments/model/square_detail_model.dart';

class MomentsDetailPage extends StatefulWidget {
  MomentsDetailPage({Key key, @required this.momentId}) : super(key: key);
  final String momentId;

  @override
  _MomentsDetailPageState createState() => _MomentsDetailPageState();
}

class _MomentsDetailPageState extends State<MomentsDetailPage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  SquareDetailModel model;

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
        title: Text('详情'),
      ),
      body: Container(child: createChild()),
    );
  }

  createChild() {
    if (model == null) {
      return CupertinoActivityIndicator();
    } else {
      return MomentsCell(
          avatar: model.user.avatar,
          nickname: model.user.nickname,
          publishedAt: model.publishedAt,
          uuid: model.uuid,
          content: model.content,
          picUrl: model.pictures.length == 0 ? '' : model.pictures[0].url,
          likeCount: model.likeCount.toString(),
          commentCount: model.commentCount.toString());
    }
  }

  /*加载广场详情数据*/
  fetchSquareDetailData() async {
    var result = await HttpRequest.request(Config.moments_squareDetailUrl +
        widget.momentId +
        Config.moments_squareDetailUrlPart);
    setState(() {
      model = SquareDetailModel.fromJson(result);
    });
  }
}
