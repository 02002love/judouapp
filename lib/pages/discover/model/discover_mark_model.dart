import 'package:json_annotation/json_annotation.dart';

part 'discover_mark_model.g.dart';


@JsonSerializable()
class DiscoverMarkModel extends Object with _$DiscoverMarkModelSerializerMixin{

  @JsonKey(name: 'uuid')
  String uuid;

  @JsonKey(name: 'content')
  String content;

  @JsonKey(name: 'reference')
  Reference reference;

  @JsonKey(name: 'author')
  Author author;

  @JsonKey(name: 'subheading')
  String subheading;

  @JsonKey(name: 'likes_count')
  int likesCount;

  @JsonKey(name: 'comment_count')
  int commentCount;

  @JsonKey(name: 'favourite_count')
  int favouriteCount;

  @JsonKey(name: 'like_count')
  int likeCount;

  @JsonKey(name: 'state')
  String state;

  @JsonKey(name: 'is_ugc')
  bool isUgc;

  @JsonKey(name: 'is_suggest')
  bool isSuggest;

  @JsonKey(name: 'published_at')
  String publishedAt;

  @JsonKey(name: 'is_original')
  bool isOriginal;

  @JsonKey(name: 'is_private')
  bool isPrivate;

  @JsonKey(name: 'is_used_by_wechat')
  bool isUsedByWechat;

  @JsonKey(name: 'is_used_by_weibo')
  bool isUsedByWeibo;

  @JsonKey(name: 'randomable')
  bool randomable;

  @JsonKey(name: 'share_url')
  String shareUrl;

  @JsonKey(name: 'is_liked')
  bool isLiked;

  @JsonKey(name: 'is_collected')
  bool isCollected;

  @JsonKey(name: 'is_editable')
  bool isEditable;

  @JsonKey(name: 'is_ad')
  bool isAd;

  @JsonKey(name: 'user')
  User user;

  @JsonKey(name: 'image')
  Image image;

  @JsonKey(name: 'pictures')
  List<Pictures> pictures;

  @JsonKey(name: 'is_disabled_comment')
  bool isDisabledComment;

  DiscoverMarkModel(this.uuid,this.content,this.reference,this.author,this.subheading,this.likesCount,this.commentCount,this.favouriteCount,this.likeCount,this.state,this.isUgc,this.isSuggest,this.publishedAt,this.isOriginal,this.isPrivate,this.isUsedByWechat,this.isUsedByWeibo,this.randomable,this.shareUrl,this.isLiked,this.isCollected,this.isEditable,this.isAd,this.user,this.image,this.pictures,this.isDisabledComment,);

  factory DiscoverMarkModel.fromJson(Map<String, dynamic> srcJson) => _$DiscoverMarkModelFromJson(srcJson);

}


@JsonSerializable()
class Reference extends Object with _$ReferenceSerializerMixin{

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'uuid')
  String uuid;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'description')
  String description;

  @JsonKey(name: 'state')
  String state;

  @JsonKey(name: 'type')
  String type;

  @JsonKey(name: 'cover')
  String cover;

  @JsonKey(name: 'sentences_count')
  int sentencesCount;

  @JsonKey(name: 'subscriptions_count')
  int subscriptionsCount;

  @JsonKey(name: 'reference_type')
  String referenceType;

  @JsonKey(name: 'ref_type_icon')
  String refTypeIcon;

  @JsonKey(name: 'is_verified')
  bool isVerified;

  @JsonKey(name: 'is_locked')
  bool isLocked;

  @JsonKey(name: 'is_hot')
  bool isHot;

  @JsonKey(name: 'is_suggest')
  bool isSuggest;

  Reference(this.id,this.uuid,this.name,this.description,this.state,this.type,this.cover,this.sentencesCount,this.subscriptionsCount,this.referenceType,this.refTypeIcon,this.isVerified,this.isLocked,this.isHot,this.isSuggest,);

  factory Reference.fromJson(Map<String, dynamic> srcJson) => _$ReferenceFromJson(srcJson);

}


@JsonSerializable()
class Author extends Object with _$AuthorSerializerMixin{

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'uuid')
  String uuid;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'description')
  String description;

  @JsonKey(name: 'state')
  String state;

  @JsonKey(name: 'type')
  String type;

  @JsonKey(name: 'cover')
  String cover;

  @JsonKey(name: 'sentences_count')
  int sentencesCount;

  @JsonKey(name: 'subscriptions_count')
  int subscriptionsCount;

  @JsonKey(name: 'is_hot')
  bool isHot;

  @JsonKey(name: 'is_verified')
  bool isVerified;

  @JsonKey(name: 'is_locked')
  bool isLocked;

  @JsonKey(name: 'is_suggest')
  bool isSuggest;

  @JsonKey(name: 'created_at')
  String createdAt;

  Author(this.id,this.uuid,this.name,this.description,this.state,this.type,this.cover,this.sentencesCount,this.subscriptionsCount,this.isHot,this.isVerified,this.isLocked,this.isSuggest,this.createdAt,);

  factory Author.fromJson(Map<String, dynamic> srcJson) => _$AuthorFromJson(srcJson);

}


@JsonSerializable()
class User extends Object with _$UserSerializerMixin{

  @JsonKey(name: 'uid')
  int uid;

  @JsonKey(name: 'uid2')
  int uid2;

  @JsonKey(name: 'uuid')
  String uuid;

  @JsonKey(name: 'nickname')
  String nickname;

  @JsonKey(name: 'avatar')
  String avatar;

  @JsonKey(name: 'is_member')
  bool isMember;

  User(this.uid,this.uid2,this.uuid,this.nickname,this.avatar,this.isMember,);

  factory User.fromJson(Map<String, dynamic> srcJson) => _$UserFromJson(srcJson);

}


@JsonSerializable()
class Image extends Object with _$ImageSerializerMixin{

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'url')
  String url;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'copyright')
  String copyright;

  Image(this.id,this.url,this.title,this.copyright,);

  factory Image.fromJson(Map<String, dynamic> srcJson) => _$ImageFromJson(srcJson);

}


@JsonSerializable()
class Pictures extends Object with _$PicturesSerializerMixin{

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'url')
  String url;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'copyright')
  String copyright;

  Pictures(this.id,this.url,this.title,this.copyright,);

  factory Pictures.fromJson(Map<String, dynamic> srcJson) => _$PicturesFromJson(srcJson);

}


