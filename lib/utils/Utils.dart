/**
 * PackageName：judouapp
 * Author     ：songjinwei
 * Date       ：2019/3/1 23:32
 * Email      ：songjinwei007@gmail.com
 * Version    ：1.0
 * Description：
 */
import 'package:flutter/material.dart';

/*将数字转换成缩写 eg: 1200 ➡ 1.2k*/
class LongString2shortString {

  static transForm(String numString) {
    int num = int.parse(numString.isEmpty ? '0' :numString);
    if (num > 1000 && num < 10000) {
      return (num / 1000).toStringAsFixed(1)+'k';
    } else if (num > 10000) {
      return (num / 10000).toStringAsFixed(1)+'w';
    } else
      return num > 0 ? num.toString() : '';
  }
}
