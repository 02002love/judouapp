/**
 * PackageName：judouapp
 * Author     ：songjinwei
 * Date       ：2019/3/2 21:53
 * Email      ：songjinwei007@gmail.com
 * Version    ：1.0
 * Description：公共配置文件
 */

class Config {
  //公共 - 默认图片
  static const String defaultIconImage =
      'https://upload-images.jianshu.io/upload_images/1155000-7351040983cb5451.png?imageMogr2/auto-orient/strip|imageView2/2/w/180/format/webp';
  //公共 - 基本 API
  static const String BaseUrl = 'https://judouapp.com/api';

  //首页 - 列表
  static const String homeUrl =
      '/v6/op/sentences/daily?app_key=af66b896-665e-415c-a119-6ca5233a6963&channel=App%20Store&device_id=4e8a064b770d7c32ad0df01e8f9c0a83&device_type=iPhone9%2C1&page=1&per_page=45&platform=ios&signature=905e4a858fa60c57a4f7a139425fafa3&system_version=12.1.4&timestamp=1553143415&version=3.7.0&version_code=45';

  //发现 - 所有 mark 数据
  static const String discoverMarkUrl =
      '/v5/tags/list?app_key=af66b896-665e-415c-a119-6ca5233a6963&channel=App%20Store&device_id=4e8a064b770d7c32ad0df01e8f9c0a83&device_type=iPhone9%2C1&platform=ios&signature=04b1955d3732b21f00ea0616a0ebe555&system_version=12.1.4&timestamp=1554059250&version=3.7.0&version_code=45';

  //发现 - banner 数据
  static const String discoverBannerUrl =
      '/v5/recommends/carousels?app_key=af66b896-665e-415c-a119-6ca5233a6963&channel=App%20Store&device_id=4e8a064b770d7c32ad0df01e8f9c0a83&device_type=iPhone9%2C1&platform=ios&signature=afbb8333c5b520ad3dc747d94853346e&system_version=12.1.4&timestamp=1554010765&version=3.7.0&version_code=45';

  //发现 - 单个 mark 的list 数据
  static const String discoverSingleMarkUrl = '/v5/tags/';
  static const String discoverSingleMarkUrlPart =
      '/time_sorted_sentences?app_key=af66b896-665e-415c-a119-6ca5233a6963&channel=App%20Store&device_id=4e8a064b770d7c32ad0df01e8f9c0a83&device_type=iPhone9%2C1&page=1&per_page=20&platform=ios&signature=5154d18863c45ea80b9e5a1f3fda6001&system_version=12.1.4&timestamp=1554072041&version=3.7.0&version_code=45';

  //动态 - 广场列表
  static const String moments_squareUrl =
      '/v5/statuses?app_key=af66b896-665e-415c-a119-6ca5233a6963&channel=App%20Store&device_id=4e8a064b770d7c32ad0df01e8f9c0a83&device_type=iPhone9%2C1&pagesign=&per_page=200&platform=ios&signature=246c3cbaba595cc3c77febc2b4a827f7&system_version=12.1.4&timestamp=1553143656&version=3.7.0&version_code=45';

  //动态 - 广场列表的详情 也是收益的详情
  static const String moments_squareDetailUrl = '/v6/op/sentences/';
  static const String moments_squareDetailUrlPart =
      '?app_key=af66b896-665e-415c-a119-6ca5233a6963&channel=App%20Store&device_id=4e8a064b770d7c32ad0df01e8f9c0a83&device_type=iPhone9%2C1&platform=ios&signature=aeb2b4523e6d377e32d4fc39ed3eacd8&system_version=12.1.4&timestamp=1552979797&version=3.7.0&version_code=45';

  //动态 - 日记列表
  static const String moments_diariesUrl =
      '/v5/diaries?app_key=af66b896-665e-415c-a119-6ca5233a6963&channel=App%20Store&device_id=4e8a064b770d7c32ad0df01e8f9c0a83&device_type=iPhone9%2C1&page=1&per_page=20&platform=ios&signature=f6f7fc4c2b8797c5b123f7f8da048c10&system_version=13.2.3&timestamp=1574382706&token=dab85b39d2c8adbc8b2c5887f9867900&version=3.9.1&version_code=61';

  //动态 - 日记列表的详情 也是首页的详情
  static const String moments_diariesDetailUrl = '/v6/op/sentences/';
  static const String moments_diariesDetailUrlPart =
      '?app_key=af66b896-665e-415c-a119-6ca5233a6963&channel=App%20Store&device_id=4e8a064b770d7c32ad0df01e8f9c0a83&device_type=iPhone9%2C1&platform=ios&signature=aeb2b4523e6d377e32d4fc39ed3eacd8&system_version=12.1.4&timestamp=1552979797&version=3.7.0&version_code=45';

  //首页 - 老黄历接口
  static const String chinaDate =
      'https://www.sojson.com/open/api/lunar/json.shtml?date=';
}
