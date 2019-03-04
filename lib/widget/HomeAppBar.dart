/**
 * PackageName：judouapp
 * Author     ：songjinwei
 * Date       ：2019/3/3 23:15
 * Email      ：songjinwei007@gmail.com
 * Version    ：1.0
 * Description：自定义 AppBar
 */
import 'package:flutter/material.dart';

class HomeAppBar extends StatefulWidget implements PreferredSizeWidget {

  HomeAppBar({@required this.child}) : assert(child != null);
  final Widget child;

  @override
  Size get preferredSize {
    return Size.fromHeight(56.0);
  }

  @override
  _HomeAppBarState createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: widget.child);
  }
}

/*自定义图片+文字*/
class CustomerTextAndImage extends StatelessWidget {
  const CustomerTextAndImage({Key key, this.imagePath, this.title})
      : super(key: key);

  final String imagePath;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 100.0),
      child: Row(
        children: <Widget>[
          Image.asset(
            imagePath,
            height: 30.0,
            width: 30.0,
          ),
          Text(title)
        ],
      ),
    );
  }
}
