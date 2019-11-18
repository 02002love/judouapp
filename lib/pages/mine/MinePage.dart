/**
 * PackageName：judouapp
 * Author     ：songjinwei
 * Date       ：2019/3/1 23:30
 * Email      ：songjinwei007@gmail.com
 * Version    ：1.0
 * Description：
 */
import 'package:flutter/material.dart';
import 'package:judouapp/utils/AdaptDevice.dart';

import 'VideoPlayer.dart';

class MinePage extends StatefulWidget {
  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  List datas = [
    {'name': '荒野生存', 'url': 'https://mhbobo.com/share/ZhCoVuBDApeZbC19'},
    {'name': '致命虫灾', 'url': 'https://mhbobo.com/share/nMsUADuFkdR9oi2E'},
    {'name': '夕阳天使', 'url': 'https://youku.mhyunbo.com/share/xFMFimlwmO8OGSRb'},
    {'name': '谍影重重3', 'url': 'https://mhbobo.com/share/AuNQTOIPZ5XkR7IJ'},
  ];

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: datas.length,
      itemBuilder: (BuildContext context, int index) {
        return itemCreate(datas[index], context, index);
      },
    );
  }

  itemCreate(Map item, BuildContext context, int index) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (BuildContext ctx) {
            return VideoPlayer(url: item['url'],);
          }),
        );
      },
      child: Container(
        height: AdaptDevice.px(100),
        child: Center(
          child: Text(
            item['name'],
            style: TextStyle(
              fontSize: 20,
              color: Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}
