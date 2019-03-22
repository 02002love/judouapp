/**
 * PackageName：judouapp
 * Author     ：songjinwei
 * Date       ：2019/3/22 16:49
 * Email      ：songjinwei007@gmail.com
 * Version    ：1.0
 * Description：
 */
import 'package:flutter/material.dart';
import 'package:judouapp/utils/AdaptDevice.dart';
import 'package:judouapp/widget/CustomButton.dart';
import 'package:common_utils/common_utils.dart';
import 'package:judouapp/widget/BigImageHero.dart';
import 'package:cached_network_image/cached_network_image.dart';

class DiariesCell extends StatefulWidget {
  DiariesCell({
    Key key,
    @required this.avatar,
    @required this.nickname,
    @required this.publishedAt,
    @required this.uuid,
    @required this.content,
    @required this.picUrl,
  }) : super(key: key);

  final String avatar;
  final String nickname;
  final String publishedAt;
  final String uuid;
  final String content;
  final String picUrl;

  @override
  _DiariesCellState createState() => _DiariesCellState();
}

class _DiariesCellState extends State<DiariesCell> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          //上部: 头像,昵称,时间,向下箭头
          TopOfItem(
            avatar: widget.avatar,
            nickname: widget.nickname,
            publishedAt: widget.publishedAt,
          ),
          //文本内容
          MiddleOfItem(
            content: widget.content,
            picUrl: widget.picUrl,
          ),
        ],
      ),
    );
  }
}

//上部: 头像,昵称,时间,向下箭头
class TopOfItem extends StatelessWidget {
  const TopOfItem(
      {Key key,
      @required this.avatar,
      @required this.nickname,
      @required this.publishedAt,
      @required this.isVerified,
      @required this.isFromHomePage})
      : super(key: key);
  final String avatar;
  final String nickname;
  final String publishedAt;
  final bool isVerified; //是否为认证身份
  final bool isFromHomePage; //是否来自首页 list

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          left: AdaptDevice.px(20),
          right: AdaptDevice.px(20),
          top: AdaptDevice.px(20)),
      child: Row(
        children: <Widget>[
          //头像
          Container(
            margin: EdgeInsets.only(right: 10),
            child: CircleAvatar(
                backgroundColor: Colors.white10,
                backgroundImage: NetworkImage(avatar)),
          ),
          Expanded(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              //昵称,时间
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(
                        nickname,
                        style: TextStyle(
                          fontSize: AdaptDevice.px(30),
                          fontFamily: 'NotoSansCJKsc-Light',
                        ),
                      ),
                    ],
                  ),
                  Text(
                      //日期中文显示: 五分钟前
                      TimelineUtil.format(int.parse(publishedAt) * 1000,
                              locTimeMillis:
                                  DateTime.now().millisecondsSinceEpoch,
                              locale: 'zh',
                              dayFormat: DayFormat.Full) +
                          '发布',
                      style: TextStyle(
                          fontFamily: 'NotoSansCJKsc-Light',
                          fontSize: AdaptDevice.px(20),
                          color: Color.fromARGB(255, 210, 215, 223)))
                ],
              ),
              CustomButton(
                //更多按钮: 举报, 复制内容, 取消
                title: '',
                iconPath: 'images/moments/square/cell_more.png',
                btnWidth: AdaptDevice.px(60),
                btnHeight: AdaptDevice.px(60),
                onTap: () {
                  print('举报, 复制内容, 取消');
                  customActionSheet(context);
                },
              ),
            ],
          ))
        ],
      ),
    );
  }
}

//中部: 文本内容, 配图
class MiddleOfItem extends StatelessWidget {
  const MiddleOfItem({
    Key key,
    @required this.content,
    @required this.picUrl,
  }) : super(key: key);

  final String content;
  final String picUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(AdaptDevice.px(20)),
      alignment: Alignment.centerLeft,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          picUrl.length == 0
              ? Container()
              : Container(
                  child: ArticlePicture(url: picUrl),
                ),
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(top: AdaptDevice.px(20)),
            child: Text(
              content,
              style: TextStyle(fontFamily: 'NotoSansCJKsc-Light'),
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
    );
  }
}

//文章的配图
class ArticlePicture extends StatelessWidget {
  const ArticlePicture({Key key, @required this.url}) : super(key: key);
  final String url;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: BigImageHero(
        imgUrl: url,
        tap: () {
          //自定义动画, 跳转大图页面
          Navigator.push(
            context,
            PageRouteBuilder(pageBuilder: (BuildContext context, _, __) {
              return BigImageHero(
                imgUrl: url,
                sHeight: AdaptDevice.screenH(),
                tap: () {
                  Navigator.pop(context);
                },
              );
            }, transitionsBuilder:
                (___, Animation<double> animation, ____, Widget child) {
              return new FadeTransition(
                opacity: animation,
                child: new RotationTransition(
                  turns: new Tween<double>(begin: 0.5, end: 1.0)
                      .animate(animation),
                  child: child,
                ),
              );
            }),
          );
        },
      ),
    );
  }
}

//举报, 复制内容, 取消的 ActionSheet弹出
void customActionSheet(BuildContext context) {
  showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            InkWell(
              child: Container(
                height: AdaptDevice.px(100),
                width: AdaptDevice.screenW(),
                alignment: Alignment.center,
                child: Text(
                  "举报",
                  style: TextStyle(
                      fontFamily: 'NotoSansCJKsc-Light',
                      color: Colors.red,
                      fontSize: AdaptDevice.px(32)),
                ),
              ),
              onTap: () {
                print('111举报 事件添加在这里');
                Navigator.pop(context);
              },
            ),
            Divider(
              height: AdaptDevice.px(1),
            ),
            InkWell(
              child: Container(
                height: AdaptDevice.px(100),
                width: AdaptDevice.screenW(),
                alignment: Alignment.center,
                child: Text(
                  "复制文字",
                  style: TextStyle(
                      fontFamily: 'NotoSansCJKsc-Light',
                      fontSize: AdaptDevice.px(32)),
                ),
              ),
              onTap: () {
                print('222复制文字 事件添加在这里');
                Navigator.pop(context);
              },
            ),
            Container(
              //灰色的分割线
              color: Color.fromARGB(255, 240, 241, 242),
              height: AdaptDevice.px(16),
            ),
            InkWell(
              child: Container(
                height: AdaptDevice.px(100),
                width: AdaptDevice.screenW(),
                alignment: Alignment.center,
                child: Text(
                  "取消",
                  style: TextStyle(
                      fontFamily: 'NotoSansCJKsc-Light',
                      fontSize: AdaptDevice.px(32)),
                ),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ));
      }).then((val) {
    print('val: $val');
  });
}
