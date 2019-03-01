/**
 * PackageName：judouapp
 * Author     ：songjinwei
 * Date       ：2019/3/1 23:23
 * Email      ：songjinwei007@gmail.com
 * Version    ：1.0
 * Description：
 */
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:flutter_refresh/flutter_refresh.dart';
//import 'package:DoubanTop250/page/homepage/movieDetailPage.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  List dataList = []; //数据源
  String title = '';
  int startNo = 0;
  int countPrePage = 20; //每页多少个 item

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData(startNo);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        title: Text(
          '豆瓣评分 Top250',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: new Refresh(
        onFooterRefresh: onFooterRefresh,
        onHeaderRefresh: onHeaderRefresh,
        childBuilder: (BuildContext context,
            {ScrollController controller, ScrollPhysics physics}) {
          return Container(
            child: createList(controller, physics, context),
          );
        },
      ),
    );
  }

  /*创建 listView*/
  createList(controller, physics, context) {
//    if (dataList.length == 0) {
//      return CupertinoActivityIndicator();
//    } else {
    return ListView.builder(
      physics: physics,
      controller: controller,
      itemCount: dataList.length,
      itemBuilder: (BuildContext context, int position) {
        return createItem(dataList[position], position, context);
      },
    );
//    }
  }

  /*创建 item*/
  createItem(var item, index, context) {
    //头像
    var avatars = List.generate(
      item['casts'].length,
          (int index) => Container(
        margin: EdgeInsets.only(left: index.toDouble() == 0.0 ? 0.0 : 16.0),
        child: CircleAvatar(
          backgroundColor: Colors.white10,
          backgroundImage: NetworkImage(item['casts'][index]['avatars'] !=
              null
              ? item['casts'][index]['avatars']['small']
              : 'http://img.hb.aicdn.com/51e3174f2b3151c5ca7d107f169c45853e29b98692b-kAuWEp_fw658'),
        ),
      ),
    );

    var row = Container(
      margin: EdgeInsets.all(4.0),
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(5.0),
            child: Image.network(
              item['images']['large'],
              width: 128.0,
              height: 170.0,
              fit: BoxFit.fill,
            ),
          ),
          Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 8.0),
                height: 170.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(right: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          //电影名称
                          Text(
                            item['title'],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          //排名
                          Text(
                            index < 3 ? 'No.${index + 1}' : '${index + 1}',
                            style: TextStyle(
                              fontSize: 40.0,
                              fontWeight:
                              index < 2 ? FontWeight.w900 : FontWeight.normal,
                              fontFamily: 'NotoSansCJKsc-Light',
                              color: index == 0
                                  ? Color.fromARGB(255, 239, 44, 54)
                                  : (index == 1
                                  ? Color.fromARGB(255, 252, 111, 55)
                                  : (index == 2
                                  ? Color.fromARGB(255, 253, 156, 43)
                                  : Color.fromARGB(255, 0, 0, 0))),
                            ),
                          ),
                        ],
                      ),
                    ),
                    //评分
                    Text(
                      '豆瓣评分: ${item['rating']['average']}',
                      style: TextStyle(fontSize: 16.0),
                    ),
                    //类型
                    Text('类型: ${item['genres'].join('、')}'),
                    //导演
                    Text(
                      '导演: ${item['directors'][0]['name']}',
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 8.0),
                      child: Row(
                        children: <Widget>[
                          Text('主演: '),
                          Row(
                            children: avatars,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ))
        ],
      ),
    );
    return Card(
      child: InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext ctx) {
//                return MovieDetailPage();
              }));
        },
        child: row,
      ),
    );
  }

  /*加载数据*/
  fetchData(int startNo) async {
    String url =
        'https://api.douban.com/v2/movie/top250?start=$startNo&&count=$countPrePage';
    http.Response response = await http.get(url);
    var result = json.decode(response.body);
    List newRecord = result['subjects'];
    setState(() {
      for (int i = 0; i < newRecord.length; i++) {
        dataList.add(newRecord[i]);
      }
    });
  }

  Future<Null> onFooterRefresh() {
    return new Future.delayed(new Duration(seconds: 1), () {
      setState(() {
        fetchData(startNo += countPrePage);
      });
    });
  }

  Future<Null> onHeaderRefresh() {
    return new Future.delayed(new Duration(seconds: 1), () {
      setState(() {
        //清空数据,重新请求前20
        if (dataList != null) {
          dataList.clear();
        }
        fetchData(0);
      });
    });
  }
}
