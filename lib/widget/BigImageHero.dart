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

class BigImageHero extends StatelessWidget {
  BigImageHero({Key key, @required this.imgUrl, this.tap, this.sHeight}) : super(key: key);
  final String imgUrl;
  final VoidCallback tap;
  final double sHeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: sHeight,
        child: Hero(
          tag: imgUrl,
          child: Material(
            color: Colors.black,
            child: InkWell(
              onTap: tap,
              child: CachedNetworkImage(
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
              ),
            ),
          ),
        ));
  }
}
