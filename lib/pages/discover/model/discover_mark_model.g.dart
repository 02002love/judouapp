// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'discover_mark_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DiscoverMarkModel _$DiscoverMarkModelFromJson(Map<String, dynamic> json) {
  return new DiscoverMarkModel(
      json['uuid'] as String,
      json['content'] as String,
      json['reference'] == null
          ? null
          : new Reference.fromJson(json['reference'] as Map<String, dynamic>),
      json['author'] == null
          ? null
          : new Author.fromJson(json['author'] as Map<String, dynamic>),
      json['subheading'] as String,
      json['likes_count'] as int,
      json['comment_count'] as int,
      json['favourite_count'] as int,
      json['like_count'] as int,
      json['state'] as String,
      json['is_ugc'] as bool,
      json['is_suggest'] as bool,
      json['published_at'] as String,
      json['is_original'] as bool,
      json['is_private'] as bool,
      json['is_used_by_wechat'] as bool,
      json['is_used_by_weibo'] as bool,
      json['randomable'] as bool,
      json['share_url'] as String,
      json['is_liked'] as bool,
      json['is_collected'] as bool,
      json['is_editable'] as bool,
      json['is_ad'] as bool,
      json['user'] == null
          ? null
          : new User.fromJson(json['user'] as Map<String, dynamic>),
      json['image'] == null
          ? null
          : new Image.fromJson(json['image'] as Map<String, dynamic>),
      (json['pictures'] as List)
          ?.map((e) => e == null
              ? null
              : new Pictures.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['is_disabled_comment'] as bool);
}

abstract class _$DiscoverMarkModelSerializerMixin {
  String get uuid;
  String get content;
  Reference get reference;
  Author get author;
  String get subheading;
  int get likesCount;
  int get commentCount;
  int get favouriteCount;
  int get likeCount;
  String get state;
  bool get isUgc;
  bool get isSuggest;
  String get publishedAt;
  bool get isOriginal;
  bool get isPrivate;
  bool get isUsedByWechat;
  bool get isUsedByWeibo;
  bool get randomable;
  String get shareUrl;
  bool get isLiked;
  bool get isCollected;
  bool get isEditable;
  bool get isAd;
  User get user;
  Image get image;
  List<Pictures> get pictures;
  bool get isDisabledComment;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'uuid': uuid,
        'content': content,
        'reference': reference,
        'author': author,
        'subheading': subheading,
        'likes_count': likesCount,
        'comment_count': commentCount,
        'favourite_count': favouriteCount,
        'like_count': likeCount,
        'state': state,
        'is_ugc': isUgc,
        'is_suggest': isSuggest,
        'published_at': publishedAt,
        'is_original': isOriginal,
        'is_private': isPrivate,
        'is_used_by_wechat': isUsedByWechat,
        'is_used_by_weibo': isUsedByWeibo,
        'randomable': randomable,
        'share_url': shareUrl,
        'is_liked': isLiked,
        'is_collected': isCollected,
        'is_editable': isEditable,
        'is_ad': isAd,
        'user': user,
        'image': image,
        'pictures': pictures,
        'is_disabled_comment': isDisabledComment
      };
}

Reference _$ReferenceFromJson(Map<String, dynamic> json) {
  return new Reference(
      json['id'] as int,
      json['uuid'] as String,
      json['name'] as String,
      json['description'] as String,
      json['state'] as String,
      json['type'] as String,
      json['cover'] as String,
      json['sentences_count'] as int,
      json['subscriptions_count'] as int,
      json['reference_type'] as String,
      json['ref_type_icon'] as String,
      json['is_verified'] as bool,
      json['is_locked'] as bool,
      json['is_hot'] as bool,
      json['is_suggest'] as bool);
}

abstract class _$ReferenceSerializerMixin {
  int get id;
  String get uuid;
  String get name;
  String get description;
  String get state;
  String get type;
  String get cover;
  int get sentencesCount;
  int get subscriptionsCount;
  String get referenceType;
  String get refTypeIcon;
  bool get isVerified;
  bool get isLocked;
  bool get isHot;
  bool get isSuggest;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'uuid': uuid,
        'name': name,
        'description': description,
        'state': state,
        'type': type,
        'cover': cover,
        'sentences_count': sentencesCount,
        'subscriptions_count': subscriptionsCount,
        'reference_type': referenceType,
        'ref_type_icon': refTypeIcon,
        'is_verified': isVerified,
        'is_locked': isLocked,
        'is_hot': isHot,
        'is_suggest': isSuggest
      };
}

Author _$AuthorFromJson(Map<String, dynamic> json) {
  return new Author(
      json['id'] as int,
      json['uuid'] as String,
      json['name'] as String,
      json['description'] as String,
      json['state'] as String,
      json['type'] as String,
      json['cover'] as String,
      json['sentences_count'] as int,
      json['subscriptions_count'] as int,
      json['is_hot'] as bool,
      json['is_verified'] as bool,
      json['is_locked'] as bool,
      json['is_suggest'] as bool,
      json['created_at'] as String);
}

abstract class _$AuthorSerializerMixin {
  int get id;
  String get uuid;
  String get name;
  String get description;
  String get state;
  String get type;
  String get cover;
  int get sentencesCount;
  int get subscriptionsCount;
  bool get isHot;
  bool get isVerified;
  bool get isLocked;
  bool get isSuggest;
  String get createdAt;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'uuid': uuid,
        'name': name,
        'description': description,
        'state': state,
        'type': type,
        'cover': cover,
        'sentences_count': sentencesCount,
        'subscriptions_count': subscriptionsCount,
        'is_hot': isHot,
        'is_verified': isVerified,
        'is_locked': isLocked,
        'is_suggest': isSuggest,
        'created_at': createdAt
      };
}

User _$UserFromJson(Map<String, dynamic> json) {
  return new User(
      json['uid'] as int,
      json['uid2'] as int,
      json['uuid'] as String,
      json['nickname'] as String,
      json['avatar'] as String,
      json['is_member'] as bool);
}

abstract class _$UserSerializerMixin {
  int get uid;
  int get uid2;
  String get uuid;
  String get nickname;
  String get avatar;
  bool get isMember;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'uid': uid,
        'uid2': uid2,
        'uuid': uuid,
        'nickname': nickname,
        'avatar': avatar,
        'is_member': isMember
      };
}

Image _$ImageFromJson(Map<String, dynamic> json) {
  return new Image(json['id'] as int, json['url'] as String,
      json['title'] as String, json['copyright'] as String);
}

abstract class _$ImageSerializerMixin {
  int get id;
  String get url;
  String get title;
  String get copyright;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'url': url,
        'title': title,
        'copyright': copyright
      };
}

Pictures _$PicturesFromJson(Map<String, dynamic> json) {
  return new Pictures(json['id'] as int, json['url'] as String,
      json['title'] as String, json['copyright'] as String);
}

abstract class _$PicturesSerializerMixin {
  int get id;
  String get url;
  String get title;
  String get copyright;
  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'url': url,
        'title': title,
        'copyright': copyright
      };
}
