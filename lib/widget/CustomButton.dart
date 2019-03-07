/**
 * PackageName：judouapp
 * Author     ：songjinwei
 * Date       ：2019/3/4 14:37
 * Email      ：songjinwei007@gmail.com
 * Version    ：1.0
 * Description：
 */
import 'package:flutter/material.dart';
import '../utils/Utils.dart';
import '../utils/AdaptDevice.dart';

class CustomButton extends StatefulWidget {
  const CustomButton(
      {Key key,
      this.iconPath,
      this.title,
      this.isSelected,
      @required this.btnHeight,
      @required this.btnWidth})
      : super(key: key);

  final String iconPath;
  final String title;
  final String isSelected;
  final double btnWidth;
  final double btnHeight;

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 8.0),
      child: InkWell(
        child: Row(
          children: <Widget>[
            Image.asset(
              widget.iconPath,
              height: widget.btnWidth,
              width: widget.btnHeight,
            ),
            Container(
              height: 40,
              child: Text(
                LongString2shortString.transForm(widget.title),
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'NotoSansCJKsc-Light',
                ),
              ),
            )
          ],
        ),
        onTap: () {
          print('哈哈哈️');
        },
      ),
    );
  }
}
