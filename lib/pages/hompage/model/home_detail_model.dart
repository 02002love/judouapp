/**
 * PackageName：judouapp
 * Author     ：songjinwei
 * Date       ：2019/3/22 10:56
 * Email      ：songjinwei007@gmail.com
 * Version    ：1.0
 * Description：
 */
import 'package:flutter/material.dart';

import 'package:json_annotation/json_annotation.dart';

part 'home_detail_model.g.dart';


@JsonSerializable()
class HomeDetailModel extends Object with _$HomeDetailModelSerializerMixin{

  @JsonKey(name: 'is_private')
  bool isPrivate;

  @JsonKey(name: 'tags')
  List<Tags> tags;

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

  @JsonKey(name: 'reference')
  Reference reference;

  @JsonKey(name: 'subheading')
  String subheading;

  @JsonKey(name: 'uuid')
  String uuid;

  @JsonKey(name: 'is_ugc')
  bool isUgc;

  @JsonKey(name: 'is_original')
  bool isOriginal;

  HomeDetailModel(this.isPrivate,this.tags,this.dailyDate,this.publishedAt,this.isAd,this.isUsedByWechat,this.isEditable,this.author,this.isLiked,this.user,this.image,this.isCollected,this.likeCount,this.isUsedByWeibo,this.shareUrl,this.tips,this.pictures,this.isRandomable,this.content,this.commentCount,this.isDisabledComment,this.weiboUsedAt,this.reference,this.subheading,this.uuid,this.isUgc,this.isOriginal,);

  factory HomeDetailModel.fromJson(Map<String, dynamic> srcJson) => _$HomeDetailModelFromJson(srcJson);

}


@JsonSerializable()
class Tags extends Object with _$TagsSerializerMixin{

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'id')
  int id;

  Tags(this.name,this.id,);

  factory Tags.fromJson(Map<String, dynamic> srcJson) => _$TagsFromJson(srcJson);

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


@JsonSerializable()
class Reference extends Object with _$ReferenceSerializerMixin{

  @JsonKey(name: 'is_verified')
  bool isVerified;

  @JsonKey(name: 'created_at')
  String createdAt;

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'subscriptions_count')
  int subscriptionsCount;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'sentences_count')
  int sentencesCount;

  @JsonKey(name: 'reference_type')
  String referenceType;

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

  Reference(this.isVerified,this.createdAt,this.id,this.subscriptionsCount,this.name,this.sentencesCount,this.referenceType,this.isLocked,this.forbidedAt,this.description,this.type,this.cover,);

  factory Reference.fromJson(Map<String, dynamic> srcJson) => _$ReferenceFromJson(srcJson);

}


