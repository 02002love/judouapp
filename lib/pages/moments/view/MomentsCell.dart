/**
 * PackageName：judouapp
 * Author     ：songjinwei
 * Date       ：2019/3/19 17:27
 * Email      ：songjinwei007@gmail.com
 * Version    ：1.0
 * Description：
 */
import 'package:flutter/material.dart';
import 'package:judouapp/pages/moments/model/square_model.dart';
import 'package:judouapp/utils/AdaptDevice.dart';
import 'package:judouapp/widget/CustomButton.dart';
import 'package:common_utils/common_utils.dart';
import 'package:cached_network_image/cached_network_image.dart';

class MomentsCell extends StatefulWidget {
  MomentsCell({Key key, @required this.model}):super(key:key);

  final SquareModel model;
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
          TopOfItem(model: widget.model),
          //文本内容
          MiddleOfItem(
            model: widget.model,
          ),
          //下部: 四个按钮
          BottomOfItem(
            likeCount: widget.model.likeCount,
            commentCount: widget.model.commentCount,
          )
        ],
      ),
    );
  }
}

//上部: 头像,昵称,时间,向下箭头
class TopOfItem extends StatelessWidget {
  const TopOfItem({Key key, @required this.model}) : super(key: key);
  final SquareModel model;

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
                backgroundImage: NetworkImage(model.user.avatar)),
          ),
          Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  //昵称,时间
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        model.user.nickname,
                        style: TextStyle(
                          fontSize: AdaptDevice.px(30),
                          fontFamily: 'NotoSansCJKsc-Light',
                        ),
                      ),
                      Text(
                        //日期中文显示: 五分钟前
                          TimelineUtil.format(model.createdAt * 1000,
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
  const MiddleOfItem({Key key, @required this.model}) : super(key: key);
  final SquareModel model;

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
              model.content,
              style: TextStyle(fontFamily: 'NotoSansCJKsc-Light'),
              textAlign: TextAlign.left,
            ),
          ),
          model.pictures.length == 0
              ? Container()
              : Container(
            child: ArticlePicture(url: model.pictures[0]['url']),
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
        this.likeCount: 0,
        this.commentCount: 0})
      : super(key: key);
  final List iconPaths;
  final int commentCount;
  final int likeCount;

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
                            ? likeCount.toString()
                            : (index == 1 ? commentCount.toString() : ''),
                      ),
                    ))),
          ],
        ));
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
      child: CachedNetworkImage(
        imageUrl: url,
        placeholder: (context, url) => ClipRRect(
          child: Container(
            child: Image.asset(
              'images/moments/big_image_placeholder.png',
              fit: BoxFit.fill,
              width: AdaptDevice.screenW(),
              height: AdaptDevice.screenW() * 0.5,
            ),
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        errorWidget: (context, url, error) {
          return Container(
            alignment: Alignment.center,
            child: Column(
              children: <Widget>[
                Icon(
                  Icons.error_outline,
                  size: 50,
                  color: Colors.red,
                ),
                Text('美图跑丢了️╮(╯_╰)╭️'),
              ],
            ),
          );
        },
        fit: BoxFit.fitWidth,
        width: AdaptDevice.screenW(),
        height: AdaptDevice.screenW() * 0.5,
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
                Divider(height: AdaptDevice.px(1),),
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
