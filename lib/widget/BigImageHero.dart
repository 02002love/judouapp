/**
 * PackageName：judouapp
 * Author     ：songjinwei
 * Date       ：2019/3/21 14:26
 * Email      ：songjinwei007@gmail.com
 * Version    ：1.0
 * Description：Hero 共享-动画
 */
import 'package:flutter/material.dart';
import 'package:judouapp/utils/AdaptDevice.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:judouapp/utils/HttpRequest.dart';
import 'dart:typed_data';

class BigImageHero extends StatelessWidget {
  BigImageHero(
      {Key key,
      @required this.imgUrl,
      this.tap,
      this.sHeight,
      this.isCanClick = true,
      this.isShowSaveBtn = false})
      : super(key: key);
  final String imgUrl;
  final VoidCallback tap;
  final double sHeight;
  final bool isCanClick; //是否能点击, 列表页面不能点击, 详情页面可以点击
  final bool isShowSaveBtn; //是否显示保存按钮, 当为 大图 是显示此按钮

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: sHeight,
      child: Hero(
        tag: imgUrl,
        child: Material(
          color: Colors.black,
          child: isCanClick
              ? InkWell(
                  onTap: tap,
                  child: isShowSaveBtn
                      ? Stack(
                          children: <Widget>[
                            makeImage(),
                            Container(
                              alignment: Alignment.bottomCenter,
                              padding:
                                  EdgeInsets.only(bottom: AdaptDevice.px(200)),
                              child: FlatButton(
                                color: Color.fromARGB(255, 59, 60, 62),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  '保存图片',
                                  style: TextStyle(
                                    fontSize: AdaptDevice.px(30),
                                    fontFamily: 'NotoSansCJKsc-Light',
                                    color: Colors.white,
                                  ),
                                ),
                                onPressed: () {
                                  print('保存图片');
                                  saveImage();
                                },
                              ),
                            )
                          ],
                        )
                      : makeImage(),
                )
              : makeImage(),
        ),
      ),
    );
  }

  makeImage() {
    return CachedNetworkImage(
      imageUrl: imgUrl,
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
      height: sHeight ?? AdaptDevice.screenW() * 0.5,
    );
  }

  /*保存图片到相册*/
  saveImage() async {
//    ByteData byteData = await HttpRequest.request('http://upload.art.ifeng.com/2017/0425/1493105660290.jpg');
//    final result = await ImageGallerySaver.save(byteData.buffer.asUint8List());


  }
}
