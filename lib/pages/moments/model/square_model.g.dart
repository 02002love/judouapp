// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'square_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SquareModel _$SquareModelFromJson(Map<String, dynamic> json) {
  return new SquareModel(
      json['uuid'] as String,
      json['timestamp'] as String,
      json['content'] as String,
      json['comment_count'] as int,
      json['like_count'] as int,
      json['created_at'] as int,
      json['published_at'] as String,
      json['is_private'] as bool,
      json['is_original'] as bool,
      json['share_url'] as String,
      json['is_liked'] as bool,
      json['is_collected'] as bool,
      json['is_ad'] as bool,
      json['user'] == null
          ? null
          : new User.fromJson(json['user'] as Map<String, dynamic>),
      json['pictures'] as List,
      json['is_editable'] as bool);
}

abstract class _$SquareModelSerializerMixin {
  String get uuid;
  String get timestamp;
  String get content;
  int get commentCount;
  int get likeCount;
  int get createdAt;
  String get publishedAt;
  bool get isPrivate;
  bool get isOriginal;
  String get shareUrl;
  bool get isLiked;
  bool get isCollected;
  bool get isAd;
  User get user;
  List<dynamic> get pictures;
  bool get isEditable;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'uuid': uuid,
        'timestamp': timestamp,
        'content': content,
        'comment_count': commentCount,
        'like_count': likeCount,
        'created_at': createdAt,
        'published_at': publishedAt,
        'is_private': isPrivate,
        'is_original': isOriginal,
        'share_url': shareUrl,
        'is_liked': isLiked,
        'is_collected': isCollected,
        'is_ad': isAd,
        'user': user,
        'pictures': pictures,
        'is_editable': isEditable
      };
}

User _$UserFromJson(Map<String, dynamic> json) {
  return new User(
      json['uid'] as int,
      json['uid2'] as int,
      json['uuid'] as String,
      json['nickname'] as String,
      json['avatar'] as String);
}

abstract class _$UserSerializerMixin {
  int get uid;
  int get uid2;
  String get uuid;
  String get nickname;
  String get avatar;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'uid': uid,
        'uid2': uid2,
        'uuid': uuid,
        'nickname': nickname,
        'avatar': avatar
      };
}
