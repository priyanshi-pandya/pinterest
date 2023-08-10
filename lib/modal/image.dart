import 'package:json_annotation/json_annotation.dart';

part 'image.g.dart';

@JsonSerializable(explicitToJson:true)
class Images {
  String? id;
  // String? slug;
  // DateTime createdAt;
  // DateTime updatedAt;
  // DateTime? promotedAt;
  // int width;
  int? height;
  // String? color;
  // String? blurHash;
  String? description;
  String? altDescription;
  // List<dynamic> breadcrumbs;
  Urls? urls;
  // ImageLinks links;
  int likes;
  // bool likedByUser;
  // List<dynamic> currentUserCollections;
  User user;

  Images({
    required this.id,
    // required this.slug,
    // required this.createdAt,
    // required this.updatedAt,
    // this.promotedAt,
    // required this.width,
    required this.height,
    // required this.color,
    // required this.blurHash,
    this.description,
    required this.altDescription,
    // required this.breadcrumbs,
    required this.urls,
    // required this.links,
    required this.likes,
    // required this.likedByUser,
    // required this.currentUserCollections,
    required this.user,
  });

  factory Images.fromJson(Map<String, dynamic> json) => _$ImagesFromJson(json);
  Map<String?, dynamic> toJson() => _$ImagesToJson(this);

}


@JsonSerializable(explicitToJson: true)
class User {
  String? id;
  DateTime? updatedAt;
  String? username;
  String? name;
  String? firstName;
  String? lastName;
  String? twitterUsername;
  String? portfolioUrl;
  String? bio;
  String? location;
  UserLinks? links;
  ProfileImage? profileImage;
  String? instagramUsername;
  int? totalCollections;
  int? totalLikes;
  int? totalPhotos;
  bool? acceptedTos;
  bool? forHire;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  User({
    required this.id,
    required this.updatedAt,
    required this.username,
    required this.name,
    required this.firstName,
    this.lastName,
    this.twitterUsername,
    this.portfolioUrl,
    this.bio,
    this.location,
    this.links,
    this.profileImage,
    this.instagramUsername,
    this.totalCollections,
    this.totalLikes,
    this.totalPhotos,
    this.acceptedTos,
    this.forHire,
  });
  Map<String?, dynamic> toJson() => _$UserToJson(this);
}


@JsonSerializable()
class UserLinks {
  String? photos;
  String? following;
  String? followers;

  UserLinks({
    required this.photos,

    required this.following,
    required this.followers,
  });

  factory UserLinks.fromJson(Map<String, dynamic> json) => _$UserLinksFromJson(json);
  Map<String?, dynamic> toJson() => _$UserLinksToJson(this);
}

@JsonSerializable()
class ProfileImage {
  String? small;
  String? medium;
  String? large;

  ProfileImage({
    required this.small,
    required this.medium,
    required this.large,
  });

  factory ProfileImage.fromJson(Map<String, dynamic> json) => _$ProfileImageFromJson(json);
  Map<String?, dynamic> toJson() => _$ProfileImageToJson(this);
}

@JsonSerializable()
class Urls {
  String? raw;
  String? full;
  String? regular;
  String? small;
  // String? thumb;
  // String? smallS3;

  Urls({
    this.raw,
    this.full,
    this.regular,
    this.small,
    // required this.thumb,
    // required this.smallS3,
  });

  factory Urls.fromJson(Map<String, dynamic> json) => _$UrlsFromJson(json);
  Map<String?, dynamic> toJson() => _$UrlsToJson(this);
}
