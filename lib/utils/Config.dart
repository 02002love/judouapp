/**
 * PackageName：judouapp
 * Author     ：songjinwei
 * Date       ：2019/3/2 21:53
 * Email      ：songjinwei007@gmail.com
 * Version    ：1.0
 * Description：公共配置文件
 */

class Config{
  static const String BaseUrl = 'https://judouapp.com/api';
  //首页请求URL
  static const String homeUrl = '/v6/op/sentences/daily?page=1&per_page=45';
  static const String moments_squareUrl = '/v5/statuses?app_key=af66b896-665e-415c-a119-6ca5233a6963&per_page=20&signature=50439eaa36be2fe5fc43d6dbf2104d27&timestamp=';



  //老黄历接口
  static const String chinaDate = 'https://www.sojson.com/open/api/lunar/json.shtml?date=';
}