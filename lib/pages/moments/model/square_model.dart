/**
 * PackageName：judouapp
 * Author     ：songjinwei
 * Date       ：2019/3/2 23:05
 * Email      ：songjinwei007@gmail.com
 * Version    ：1.0
 * Description：
 */
import 'package:json_annotation/json_annotation.dart';

part 'square_model.g.dart';


@JsonSerializable()
class SquareModel extends Object with _$SquareModelSerializerMixin{

  @JsonKey(name: 'uuid')
  String uuid;

  @JsonKey(name: 'timestamp')
  String timestamp;

  @JsonKey(name: 'content')
  String content;

  @JsonKey(name: 'comment_count')
  int commentCount;

  @JsonKey(name: 'like_count')
  int likeCount;

  @JsonKey(name: 'created_at')
  int createdAt;

  @JsonKey(name: 'published_at')
  String publishedAt;

  @JsonKey(name: 'is_private')
  bool isPrivate;

  @JsonKey(name: 'is_original')
  bool isOriginal;

  @JsonKey(name: 'share_url')
  String shareUrl;

  @JsonKey(name: 'is_liked')
  bool isLiked;

  @JsonKey(name: 'is_collected')
  bool isCollected;

  @JsonKey(name: 'is_ad')
  bool isAd;

  @JsonKey(name: 'user')
  User user;

  @JsonKey(name: 'pictures')
  List<dynamic> pictures;

  @JsonKey(name: 'is_editable')
  bool isEditable;

  SquareModel(this.uuid,this.timestamp,this.content,this.commentCount,this.likeCount,this.createdAt,this.publishedAt,this.isPrivate,this.isOriginal,this.shareUrl,this.isLiked,this.isCollected,this.isAd,this.user,this.pictures,this.isEditable,);

  factory SquareModel.fromJson(Map<String, dynamic> srcJson) => _$SquareModelFromJson(srcJson);

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

  User(this.uid,this.uid2,this.uuid,this.nickname,this.avatar,);

  factory User.fromJson(Map<String, dynamic> srcJson) => _$UserFromJson(srcJson);

}