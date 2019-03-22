/**
 * PackageName：judouapp
 * Author     ：songjinwei
 * Date       ：2019/3/22 19:28
 * Email      ：songjinwei007@gmail.com
 * Version    ：1.0
 * Description：日记列表 cell的详情
 */
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:judouapp/pages/moments/view/DiariesCell.dart';
import 'package:judouapp/utils/AdaptDevice.dart';

class DiariesDetailPage extends StatefulWidget {
  DiariesDetailPage(
      {Key key,
      this.avatar,
      this.nickname,
      this.publishedAt,
      this.uuid,
      this.content,
      this.picUrl})
      : super(key: key);

  final String avatar;
  final String nickname;
  final String publishedAt;
  final String uuid;
  final String content;
  final String picUrl;

  @override
  _DiariesDetailPageState createState() => _DiariesDetailPageState();
}

class _DiariesDetailPageState extends State<DiariesDetailPage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

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
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('详情'),
      ),
      body: Container(
        child: createChild(),
        color: Color.fromARGB(255, 240, 241, 242),
        height: AdaptDevice.screenH(),
      ),
    );
  }

  createChild() {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            color: Color.fromARGB(255, 249, 249, 249),
            child: DiariesCell(
              avatar: widget.avatar,
              nickname: widget.nickname,
              publishedAt: //设置为东八区
                  (int.parse(widget.publishedAt)).toString(),
              uuid: widget.uuid,
              content: widget.content,
              picUrl: widget.picUrl,
            ),
          ),
          Container(
            height: AdaptDevice.px(200),
            width: AdaptDevice.screenW(),
            alignment: Alignment.topCenter,
            child: Text(''),
            padding: EdgeInsets.only(
              top: AdaptDevice.px(130),
            ),
          ),
        ],
      ),
    );
  }
}
