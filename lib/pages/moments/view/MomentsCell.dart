/**
 * PackageName：judouapp
 * Author     ：songjinwei
 * Date       ：2019/3/19 17:27
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

class MomentsCell extends StatefulWidget {
  MomentsCell({
    Key key,
    this.isVerified = false,
    @required this.avatar,
    @required this.nickname,
    @required this.publishedAt,
    @required this.uuid,
    @required this.content,
    @required this.picUrl,
    @required this.likeCount,
    @required this.commentCount,
    this.isListCell = false, //是否是广场的列表页
    this.isFromHomePage = false,
  }) : super(key: key);

  final bool isListCell; //是否为列表的 cell
  final String avatar;
  final String nickname;
  final String publishedAt;
  final String uuid;
  final String content;
  final String picUrl;
  final String likeCount;
  final String commentCount;
  final bool isVerified; //是否为认证身份
  final bool isFromHomePage; //是否来自首页

  @override
  _MomentsCellState createState() => _MomentsCellState();
}

class _MomentsCellState extends State<MomentsCell> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          //上部: 头像,昵称,时间,向下箭头
          TopOfItem(
            isFromHomePage: widget.isFromHomePage,
            avatar: widget.avatar,
            nickname: widget.nickname,
            publishedAt: widget.publishedAt,
            isVerified: widget.isVerified,
          ),
          //文本内容
          MiddleOfItem(
            content: widget.content,
            picUrl: widget.picUrl,
            isListCell: widget.isListCell,
          ),
          //下部: 四个按钮
          BottomOfItem(
              likeCount: widget.likeCount, commentCount: widget.commentCount)
        ],
      ),
    );
  }
}

//上部: 头像,昵称,时间,向下箭头
class TopOfItem extends StatelessWidget {
  const TopOfItem({
    Key key,
    @required this.avatar,
    @required this.nickname,
    @required this.publishedAt,
    @required this.isVerified,
    @required this.isFromHomePage
  }) : super(key: key);
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
            child: isFromHomePage
                ? ClipRRect(
                    child: CachedNetworkImage(
                      imageUrl: avatar,
                      width: AdaptDevice.px(80),
                      height: AdaptDevice.px(80),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  )
                : CircleAvatar(
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
                      isVerified
                          ? Image.asset(
                              'images/home/icon_author_reference_verified.png',
                              width: AdaptDevice.px(50),
                              height: AdaptDevice.px(50),
                            )
                          : Container()
                    ],
                  ),
                  isFromHomePage
                      ? Container()
                      : Text(
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
  const MiddleOfItem(
      {Key key,
      @required this.content,
      @required this.picUrl,
      @required this.isListCell})
      : super(key: key);

  final String content;
  final String picUrl;
  final bool isListCell; //是否为列表的 cell

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(AdaptDevice.px(20)),
      alignment: Alignment.centerLeft,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              content,
              style: TextStyle(fontFamily: 'NotoSansCJKsc-Light'),
              textAlign: TextAlign.left,
            ),
          ),
          picUrl.length == 0
              ? Container()
              : Container(
                  child: ArticlePicture(url: picUrl, isListCell: isListCell),
                  margin: EdgeInsets.only(top: AdaptDevice.px(20)),
                )
        ],
      ),
    );
  }
}

//下部: 四个按钮
class BottomOfItem extends StatelessWidget {
  const BottomOfItem(
      {Key key,
      this.iconPaths: const [
        'images/moments/square/icon_like.png',
        'images/moments/square/icon_comment.png',
        'images/moments/square/icon_collect.png',
        'images/moments/square/icon_share.png'
      ],
      @required this.likeCount,
      @required this.commentCount})
      : super(key: key);
  final List iconPaths;

  final String likeCount;
  final String commentCount;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(
            left: AdaptDevice.px(20), right: AdaptDevice.px(20)),
        child: Column(
          children: <Widget>[
            Divider(), //横线
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                    iconPaths.length,
                    (int index) => Container(
                          child: CustomButton(
                            btnHeight: AdaptDevice.px(40),
                            btnWidth: AdaptDevice.px(40),
                            iconPath: iconPaths[index],
                            title: index == 0
                                ? likeCount
                                : (index == 1 ? commentCount : ''),
                          ),
                        ))),
          ],
        ));
  }
}

//文章的配图
class ArticlePicture extends StatelessWidget {
  const ArticlePicture({Key key, @required this.url, @required this.isListCell})
      : super(key: key);
  final String url;
  final bool isListCell;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: BigImageHero(
        isCanClick: !isListCell,
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
