// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'square_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SquareDetailModel _$SquareDetailModelFromJson(Map<String, dynamic> json) {
  return new SquareDetailModel(
      json['is_private'] as bool,
      json['daily_date'] as String,
      json['published_at'] as String,
      json['is_ad'] as bool,
      json['is_used_by_wechat'] as bool,
      json['is_editable'] as bool,
      json['is_liked'] as bool,
      json['user'] == null
          ? null
          : new User.fromJson(json['user'] as Map<String, dynamic>),
      json['image'] == null
          ? null
          : new Image.fromJson(json['image'] as Map<String, dynamic>),
      json['is_collected'] as bool,
      json['like_count'] as int,
      json['is_used_by_weibo'] as bool,
      json['share_url'] as String,
      json['tips'] as String,
      (json['pictures'] as List)
          ?.map((e) => e == null
              ? null
              : new Pictures.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['is_randomable'] as bool,
      json['content'] as String,
      json['comment_count'] as int,
      json['is_disabled_comment'] as bool,
      json['weibo_used_at'] as String,
      json['subheading'] as String,
      json['uuid'] as String,
      json['is_ugc'] as bool,
      json['is_original'] as bool);
}

abstract class _$SquareDetailModelSerializerMixin {
  bool get isPrivate;
  String get dailyDate;
  String get publishedAt;
  bool get isAd;
  bool get isUsedByWechat;
  bool get isEditable;
  bool get isLiked;
  User get user;
  Image get image;
  bool get isCollected;
  int get likeCount;
  bool get isUsedByWeibo;
  String get shareUrl;
  String get tips;
  List<Pictures> get pictures;
  bool get isRandomable;
  String get content;
  int get commentCount;
  bool get isDisabledComment;
  String get weiboUsedAt;
  String get subheading;
  String get uuid;
  bool get isUgc;
  bool get isOriginal;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'is_private': isPrivate,
        'daily_date': dailyDate,
        'published_at': publishedAt,
        'is_ad': isAd,
        'is_used_by_wechat': isUsedByWechat,
        'is_editable': isEditable,
        'is_liked': isLiked,
        'user': user,
        'image': image,
        'is_collected': isCollected,
        'like_count': likeCount,
        'is_used_by_weibo': isUsedByWeibo,
        'share_url': shareUrl,
        'tips': tips,
        'pictures': pictures,
        'is_randomable': isRandomable,
        'content': content,
        'comment_count': commentCount,
        'is_disabled_comment': isDisabledComment,
        'weibo_used_at': weiboUsedAt,
        'subheading': subheading,
        'uuid': uuid,
        'is_ugc': isUgc,
        'is_original': isOriginal
      };
}

User _$UserFromJson(Map<String, dynamic> json) {
  return new User(json['nickname'] as String, json['avatar'] as String,
      json['uid'] as String);
}

abstract class _$UserSerializerMixin {
  String get nickname;
  String get avatar;
  String get uid;
  Map<String, dynamic> toJson() =>
      <String, dynamic>{'nickname': nickname, 'avatar': avatar, 'uid': uid};
}

Image _$ImageFromJson(Map<String, dynamic> json) {
  return new Image(json['url'] as String, json['copyright'] as String,
      json['color'] as String, json['id'] as int);
}

abstract class _$ImageSerializerMixin {
  String get url;
  String get copyright;
  String get color;
  int get id;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'url': url,
        'copyright': copyright,
        'color': color,
        'id': id
      };
}

Pictures _$PicturesFromJson(Map<String, dynamic> json) {
  return new Pictures(json['url'] as String, json['copyright'] as String,
      json['color'] as String, json['id'] as int);
}

abstract class _$PicturesSerializerMixin {
  String get url;
  String get copyright;
  String get color;
  int get id;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'url': url,
        'copyright': copyright,
        'color': color,
        'id': id
      };
}
