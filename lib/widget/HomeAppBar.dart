/**
 * PackageName：judouapp
 * Author     ：songjinwei
 * Date       ：2019/3/3 23:15
 * Email      ：songjinwei007@gmail.com
 * Version    ：1.0
 * Description：自定义 AppBar
 */
import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomerTextAndImage(
        imagePath: 'images/tab/tab_mine.png',
        title: '112',
      ),
    );
  }
}

/*自定义图片+文字*/
class CustomerTextAndImage extends StatelessWidget {
  const CustomerTextAndImage({Key key, this.imagePath, this.title})
      : super(key: key);
  final String title;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[Image.asset(imagePath), Text(title)],
      ),
    );
  }
}
