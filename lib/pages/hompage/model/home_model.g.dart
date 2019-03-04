// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeModel _$HomeModelFromJson(Map<String, dynamic> json) {
  return new HomeModel(
      json['is_private'] as bool,
      json['daily_date'] as String,
      json['published_at'] as String,
      json['is_ad'] as bool,
      json['is_used_by_wechat'] as bool,
      json['is_editable'] as bool,
      json['author'] == null
          ? null
          : new Author.fromJson(json['author'] as Map<String, dynamic>),
      json['is_original'] as bool,
      json['user'] == null
          ? null
          : new User.fromJson(json['user'] as Map<String, dynamic>),
      json['image'] == null
          ? null
          : new Image1.fromJson(json['image'] as Map<String, dynamic>),
      json['is_collected'] as bool,
      json['like_count'] as int,
      json['is_used_by_weibo'] as bool,
      json['share_url'] as String,
      json['mask_color'] as String,
      json['tips'] as String,
      (json['pictures'] as List)
          ?.map((e) => e == null
              ? null
              : new Pictures.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['is_liked'] as bool,
      json['is_randomable'] as bool,
      json['content'] as String,
      json['comment_count'] as int,
      json['is_disabled_comment'] as bool,
      json['mask_transparent'] as String,
      json['weibo_used_at'] as String,
      json['uuid'] as String,
      json['subheading'] as String,
      json['is_ugc'] as bool);
}

abstract class _$HomeModelSerializerMixin {
  bool get isPrivate;
  String get dailyDate;
  String get publishedAt;
  bool get isAd;
  bool get isUsedByWechat;
  bool get isEditable;
  Author get author;
  bool get isOriginal;
  User get user;
  Image1 get image;
  bool get isCollected;
  int get likeCount;
  bool get isUsedByWeibo;
  String get shareUrl;
  String get maskColor;
  String get tips;
  List<Pictures> get pictures;
  bool get isLiked;
  bool get isRandomable;
  String get content;
  int get commentCount;
  bool get isDisabledComment;
  String get maskTransparent;
  String get weiboUsedAt;
  String get uuid;
  String get subheading;
  bool get isUgc;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'is_private': isPrivate,
        'daily_date': dailyDate,
        'published_at': publishedAt,
        'is_ad': isAd,
        'is_used_by_wechat': isUsedByWechat,
        'is_editable': isEditable,
        'author': author,
        'is_original': isOriginal,
        'user': user,
        'image': image,
        'is_collected': isCollected,
        'like_count': likeCount,
        'is_used_by_weibo': isUsedByWeibo,
        'share_url': shareUrl,
        'mask_color': maskColor,
        'tips': tips,
        'pictures': pictures,
        'is_liked': isLiked,
        'is_randomable': isRandomable,
        'content': content,
        'comment_count': commentCount,
        'is_disabled_comment': isDisabledComment,
        'mask_transparent': maskTransparent,
        'weibo_used_at': weiboUsedAt,
        'uuid': uuid,
        'subheading': subheading,
        'is_ugc': isUgc
      };
}

Author _$AuthorFromJson(Map<String, dynamic> json) {
  return new Author(
      json['is_verified'] as bool,
      json['created_at'] as String,
      json['id'] as int,
      json['name'] as String,
      json['sentences_count'] as int,
      json['is_locked'] as bool,
      json['forbided_at'] as String,
      json['description'] as String,
      json['type'] as String,
      json['cover'] as String);
}

abstract class _$AuthorSerializerMixin {
  bool get isVerified;
  String get createdAt;
  int get id;
  String get name;
  int get sentencesCount;
  bool get isLocked;
  String get forbidedAt;
  String get description;
  String get type;
  String get cover;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'is_verified': isVerified,
        'created_at': createdAt,
        'id': id,
        'name': name,
        'sentences_count': sentencesCount,
        'is_locked': isLocked,
        'forbided_at': forbidedAt,
        'description': description,
        'type': type,
        'cover': cover
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

Image1 _$ImageFromJson(Map<String, dynamic> json) {
  return new Image1(json['url'] as String, json['copyright'] as String,
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
