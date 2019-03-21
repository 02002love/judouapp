/**
 * PackageName：judouapp
 * Author     ：songjinwei
 * Date       ：2019/3/2 21:53
 * Email      ：songjinwei007@gmail.com
 * Version    ：1.0
 * Description：公共配置文件
 */

class Config {
  static const String BaseUrl = 'https://judouapp.com/api';

  //首页请求URL
  static const String homeUrl =
      '/v6/op/sentences/daily?app_key=af66b896-665e-415c-a119-6ca5233a6963&channel=App%20Store&device_id=4e8a064b770d7c32ad0df01e8f9c0a83&device_type=iPhone9%2C1&page=1&per_page=45&platform=ios&signature=905e4a858fa60c57a4f7a139425fafa3&system_version=12.1.4&timestamp=1553143415&version=3.7.0&version_code=45';

  //广场列表
  static const String moments_squareUrl =
      '/v5/statuses?app_key=af66b896-665e-415c-a119-6ca5233a6963&channel=App%20Store&device_id=4e8a064b770d7c32ad0df01e8f9c0a83&device_type=iPhone9%2C1&pagesign=&per_page=200&platform=ios&signature=246c3cbaba595cc3c77febc2b4a827f7&system_version=12.1.4&timestamp=1553143656&version=3.7.0&version_code=45';

  //广场列表的详情
  static const String moments_squareDetailUrl = '/v6/op/sentences/';
  static const String moments_squareDetailUrlPart =
      '?app_key=af66b896-665e-415c-a119-6ca5233a6963&channel=App%20Store&device_id=4e8a064b770d7c32ad0df01e8f9c0a83&device_type=iPhone9%2C1&platform=ios&signature=aeb2b4523e6d377e32d4fc39ed3eacd8&system_version=12.1.4&timestamp=1552979797&version=3.7.0&version_code=45';

  //老黄历接口
  static const String chinaDate =
      'https://www.sojson.com/open/api/lunar/json.shtml?date=';
}
