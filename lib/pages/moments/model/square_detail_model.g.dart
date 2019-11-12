// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'square_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SquareDetailModel _$SquareDetailModelFromJson(Map<String, dynamic> json) {
  return new SquareDetailModel(
      json['uuid'] as String,
      json['content'] as String,
      json['published_at'] as int,
      json['comment_count'] as int,
      json['like_count'] as int,
      json['is_private'] as bool,
      (json['pictures'] as List)
          ?.map((e) => e == null
              ? null
              : new Pictures.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['is_collected'] as bool,
      json['is_liked'] as bool,
      json['is_editable'] as bool,
      json['is_original'] as bool,
      json['is_disabled_comment'] as bool,
      json['share_url'] as String,
      json['user'] == null
          ? null
          : new User.fromJson(json['user'] as Map<String, dynamic>),
      json['tags'] as List);
}

abstract class _$SquareDetailModelSerializerMixin {
  String get uuid;
  String get content;
  int get publishedAt;
  int get commentCount;
  int get likeCount;
  bool get isPrivate;
  List<Pictures> get pictures;
  bool get isCollected;
  bool get isLiked;
  bool get isEditable;
  bool get isOriginal;
  bool get isDisabledComment;
  String get shareUrl;
  User get user;
  List<dynamic> get tags;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'uuid': uuid,
        'content': content,
        'published_at': publishedAt,
        'comment_count': commentCount,
        'like_count': likeCount,
        'is_private': isPrivate,
        'pictures': pictures,
        'is_collected': isCollected,
        'is_liked': isLiked,
        'is_editable': isEditable,
        'is_original': isOriginal,
        'is_disabled_comment': isDisabledComment,
        'share_url': shareUrl,
        'user': user,
        'tags': tags
      };
}

Pictures _$PicturesFromJson(Map<String, dynamic> json) {
  return new Pictures(json['id'] as int, json['url'] as String,
      json['color'] as String, json['copyright'] as String);
}

abstract class _$PicturesSerializerMixin {
  int get id;
  String get url;
  String get color;
  String get copyright;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'url': url,
        'color': color,
        'copyright': copyright
      };
}

User _$UserFromJson(Map<String, dynamic> json) {
  return new User(json['uid'] as int, json['nickname'] as String,
      json['avatar'] as String, json['is_member'] as bool);
}

abstract class _$UserSerializerMixin {
  int get uid;
  String get nickname;
  String get avatar;
  bool get isMember;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'uid': uid,
        'nickname': nickname,
        'avatar': avatar,
        'is_member': isMember
      };
}
