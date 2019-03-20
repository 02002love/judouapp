/**
 * PackageName：judouapp
 * Author     ：songjinwei
 * Date       ：2019/3/20 14:57
 * Email      ：songjinwei007@gmail.com
 * Version    ：1.0
 * Description：
 */
import 'package:json_annotation/json_annotation.dart';

part 'square_detail_model.g.dart';


@JsonSerializable()
class SquareDetailModel extends Object with _$SquareDetailModelSerializerMixin{

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

  @JsonKey(name: 'is_liked')
  bool isLiked;

  @JsonKey(name: 'user')
  User user;

  @JsonKey(name: 'image')
  Image image;

  @JsonKey(name: 'is_collected')
  bool isCollected;

  @JsonKey(name: 'like_count')
  int likeCount;

  @JsonKey(name: 'is_used_by_weibo')
  bool isUsedByWeibo;

  @JsonKey(name: 'share_url')
  String shareUrl;

  @JsonKey(name: 'tips')
  String tips;

  @JsonKey(name: 'pictures')
  List<Pictures> pictures;

  @JsonKey(name: 'is_randomable')
  bool isRandomable;

  @JsonKey(name: 'content')
  String content;

  @JsonKey(name: 'comment_count')
  int commentCount;

  @JsonKey(name: 'is_disabled_comment')
  bool isDisabledComment;

  @JsonKey(name: 'weibo_used_at')
  String weiboUsedAt;

  @JsonKey(name: 'subheading')
  String subheading;

  @JsonKey(name: 'uuid')
  String uuid;

  @JsonKey(name: 'is_ugc')
  bool isUgc;

  @JsonKey(name: 'is_original')
  bool isOriginal;

  SquareDetailModel(this.isPrivate,this.dailyDate,this.publishedAt,this.isAd,this.isUsedByWechat,this.isEditable,this.isLiked,this.user,this.image,this.isCollected,this.likeCount,this.isUsedByWeibo,this.shareUrl,this.tips,this.pictures,this.isRandomable,this.content,this.commentCount,this.isDisabledComment,this.weiboUsedAt,this.subheading,this.uuid,this.isUgc,this.isOriginal,);

  factory SquareDetailModel.fromJson(Map<String, dynamic> srcJson) => _$SquareDetailModelFromJson(srcJson);

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
class Image extends Object with _$ImageSerializerMixin{

  @JsonKey(name: 'url')
  String url;

  @JsonKey(name: 'copyright')
  String copyright;

  @JsonKey(name: 'color')
  String color;

  @JsonKey(name: 'id')
  int id;

  Image(this.url,this.copyright,this.color,this.id,);

  factory Image.fromJson(Map<String, dynamic> srcJson) => _$ImageFromJson(srcJson);

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


