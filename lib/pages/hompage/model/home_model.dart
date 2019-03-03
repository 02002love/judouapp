/**
 * PackageName：judouapp
 * Author     ：songjinwei
 * Date       ：2019/3/2 23:05
 * Email      ：songjinwei007@gmail.com
 * Version    ：1.0
 * Description：
 */
import 'package:json_annotation/json_annotation.dart';

part 'home_model.g.dart';


@JsonSerializable()
class HomeModel extends Object with _$HomeModelSerializerMixin{

  @JsonKey(name: 'is_private')
  bool isPrivate;

  @JsonKey(name: 'daily_date')
  String dailyDate;

  @JsonKey(name: 'published_at')
  String publishedAt;

  @JsonKey(name: 'is_ad')
  bool isAd;

  @JsonKey(name: 'is_used_by_wechat')
  bool isUsedByWechat;

  @JsonKey(name: 'is_editable')
  bool isEditable;

  @JsonKey(name: 'author')
  Author author;

  @JsonKey(name: 'is_original')
  bool isOriginal;

  @JsonKey(name: 'user')
  User user;

  @JsonKey(name: 'image')
  Image1 image;

  @JsonKey(name: 'is_collected')
  bool isCollected;

  @JsonKey(name: 'like_count')
  int likeCount;

  @JsonKey(name: 'is_used_by_weibo')
  bool isUsedByWeibo;

  @JsonKey(name: 'share_url')
  String shareUrl;

  @JsonKey(name: 'mask_color')
  String maskColor;

  @JsonKey(name: 'tips')
  String tips;

  @JsonKey(name: 'pictures')
  List<Pictures> pictures;

  @JsonKey(name: 'is_liked')
  bool isLiked;

  @JsonKey(name: 'is_randomable')
  bool isRandomable;

  @JsonKey(name: 'content')
  String content;

  @JsonKey(name: 'comment_count')
  int commentCount;

  @JsonKey(name: 'is_disabled_comment')
  bool isDisabledComment;

  @JsonKey(name: 'mask_transparent')
  String maskTransparent;

  @JsonKey(name: 'weibo_used_at')
  String weiboUsedAt;

  @JsonKey(name: 'uuid')
  String uuid;

  @JsonKey(name: 'subheading')
  String subheading;

  @JsonKey(name: 'is_ugc')
  bool isUgc;

  HomeModel(this.isPrivate,this.dailyDate,this.publishedAt,this.isAd,this.isUsedByWechat,this.isEditable,this.author,this.isOriginal,this.user,this.image,this.isCollected,this.likeCount,this.isUsedByWeibo,this.shareUrl,this.maskColor,this.tips,this.pictures,this.isLiked,this.isRandomable,this.content,this.commentCount,this.isDisabledComment,this.maskTransparent,this.weiboUsedAt,this.uuid,this.subheading,this.isUgc,);

  factory HomeModel.fromJson(Map<String, dynamic> srcJson) => _$HomeModelFromJson(srcJson);

}


@JsonSerializable()
class Author extends Object with _$AuthorSerializerMixin{

  @JsonKey(name: 'is_verified')
  bool isVerified;

  @JsonKey(name: 'created_at')
  String createdAt;

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'sentences_count')
  int sentencesCount;

  @JsonKey(name: 'is_locked')
  bool isLocked;

  @JsonKey(name: 'forbided_at')
  String forbidedAt;

  @JsonKey(name: 'description')
  String description;

  @JsonKey(name: 'type')
  String type;

  @JsonKey(name: 'cover')
  String cover;

  Author(this.isVerified,this.createdAt,this.id,this.name,this.sentencesCount,this.isLocked,this.forbidedAt,this.description,this.type,this.cover,);

  factory Author.fromJson(Map<String, dynamic> srcJson) => _$AuthorFromJson(srcJson);

}


@JsonSerializable()
class User extends Object with _$UserSerializerMixin{

  @JsonKey(name: 'nickname')
  String nickname;

  @JsonKey(name: 'avatar')
  String avatar;

  @JsonKey(name: 'uid')
  String uid;

  User(this.nickname,this.avatar,this.uid,);

  factory User.fromJson(Map<String, dynamic> srcJson) => _$UserFromJson(srcJson);

}


@JsonSerializable()
class Image1 extends Object with _$ImageSerializerMixin{

  @JsonKey(name: 'url')
  String url;

  @JsonKey(name: 'copyright')
  String copyright;

  @JsonKey(name: 'color')
  String color;

  @JsonKey(name: 'id')
  int id;

  Image1(this.url,this.copyright,this.color,this.id,);

  factory Image1.fromJson(Map<String, dynamic> srcJson) => _$ImageFromJson(srcJson);

}


@JsonSerializable()
class Pictures extends Object with _$PicturesSerializerMixin{

  @JsonKey(name: 'url')
  String url;

  @JsonKey(name: 'copyright')
  String copyright;

  @JsonKey(name: 'color')
  String color;

  @JsonKey(name: 'id')
  int id;

  Pictures(this.url,this.copyright,this.color,this.id,);

  factory Pictures.fromJson(Map<String, dynamic> srcJson) => _$PicturesFromJson(srcJson);

}


