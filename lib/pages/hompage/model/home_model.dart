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

  @JsonKey(name: 'uuid')
  String uuid;

  @JsonKey(name: 'content')
  String content;

  @JsonKey(name: 'published_at')
  int publishedAt;

  @JsonKey(name: 'comment_count')
  int commentCount;

  @JsonKey(name: 'like_count')
  int likeCount;

  @JsonKey(name: 'is_private')
  bool isPrivate;

  @JsonKey(name: 'pictures')
  List<Pictures> pictures;

  @JsonKey(name: 'is_collected')
  bool isCollected;

  @JsonKey(name: 'is_liked')
  bool isLiked;

  @JsonKey(name: 'is_editable')
  bool isEditable;

  @JsonKey(name: 'is_original')
  bool isOriginal;

  @JsonKey(name: 'is_disabled_comment')
  bool isDisabledComment;

  @JsonKey(name: 'share_url')
  String shareUrl;

  @JsonKey(name: 'subheading')
  String subheading;

  @JsonKey(name: 'is_used_by_wechat')
  bool isUsedByWechat;

  @JsonKey(name: 'is_used_by_weibo')
  bool isUsedByWeibo;

  @JsonKey(name: 'user')
  User user;

  @JsonKey(name: 'author')
  Author author;

  HomeModel(this.uuid,this.content,this.publishedAt,this.commentCount,this.likeCount,this.isPrivate,this.pictures,this.isCollected,this.isLiked,this.isEditable,this.isOriginal,this.isDisabledComment,this.shareUrl,this.subheading,this.isUsedByWechat,this.isUsedByWeibo,this.user,this.author,);

  factory HomeModel.fromJson(Map<String, dynamic> srcJson) => _$HomeModelFromJson(srcJson);

}

  
@JsonSerializable()
  class Pictures extends Object with _$PicturesSerializerMixin{

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'url')
  String url;

  @JsonKey(name: 'color')
  String color;

  @JsonKey(name: 'copyright')
  String copyright;

  Pictures(this.id,this.url,this.color,this.copyright,);

  factory Pictures.fromJson(Map<String, dynamic> srcJson) => _$PicturesFromJson(srcJson);

}

  
@JsonSerializable()
  class User extends Object with _$UserSerializerMixin{

  @JsonKey(name: 'uid')
  int uid;

  @JsonKey(name: 'nickname')
  String nickname;

  @JsonKey(name: 'avatar')
  String avatar;

  @JsonKey(name: 'is_member')
  bool isMember;

  User(this.uid,this.nickname,this.avatar,this.isMember,);

  factory User.fromJson(Map<String, dynamic> srcJson) => _$UserFromJson(srcJson);

}

  
@JsonSerializable()
  class Author extends Object with _$AuthorSerializerMixin{

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'cover')
  String cover;

  @JsonKey(name: 'is_verified')
  bool isVerified;

  @JsonKey(name: 'type')
  String type;

  Author(this.id,this.name,this.cover,this.isVerified,this.type,);

  factory Author.fromJson(Map<String, dynamic> srcJson) => _$AuthorFromJson(srcJson);

}

  
