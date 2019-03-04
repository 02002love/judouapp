/**
 * PackageName：judouapp
 * Author     ：songjinwei
 * Date       ：2019/3/4 14:37
 * Email      ：songjinwei007@gmail.com
 * Version    ：1.0
 * Description：
 */
import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({Key key, this.iconPath, this.title, this.isSelected})
      : super(key: key);

  final String iconPath;
  final String title;
  final String isSelected;

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
              height: 25,
              width: 25,
            ),
            Container(
              height: 40,
              child: Text(
                widget.title,
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'NotoSansCJKsc-Light',
                ),
              ),
            )
          ],
        ),
        onTap: () {
          print('哈哈哈哈️');
        },
      ),
    );
  }
}
