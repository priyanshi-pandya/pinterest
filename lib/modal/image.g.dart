// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Images _$ImagesFromJson(Map<String, dynamic> json) => Images(
      id: json['id'] as String?,
      height: json['height'] as int?,
      description: json['description'] as String?,
      altDescription: json['altDescription'] as String?,
      urls: json['urls'] == null
          ? null
          : Urls.fromJson(json['urls'] as Map<String, dynamic>),
      likes: json['likes'] as int,
      user: User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ImagesToJson(Images instance) => <String, dynamic>{
      'id': instance.id,
      'height': instance.height,
      'description': instance.description,
      'altDescription': instance.altDescription,
      'urls': instance.urls?.toJson(),
      'likes': instance.likes,
      'user': instance.user.toJson(),
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as String?,
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      username: json['username'] as String?,
      name: json['name'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      twitterUsername: json['twitterUsername'] as String?,
      portfolioUrl: json['portfolioUrl'] as String?,
      bio: json['bio'] as String?,
      location: json['location'] as String?,
      links: json['links'] == null
          ? null
          : UserLinks.fromJson(json['links'] as Map<String, dynamic>),
      profileImage: json['profileImage'] == null
          ? null
          : ProfileImage.fromJson(json['profileImage'] as Map<String, dynamic>),
      instagramUsername: json['instagramUsername'] as String?,
      totalCollections: json['totalCollections'] as int?,
      totalLikes: json['totalLikes'] as int?,
      totalPhotos: json['totalPhotos'] as int?,
      acceptedTos: json['acceptedTos'] as bool?,
      forHire: json['forHire'] as bool?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'username': instance.username,
      'name': instance.name,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'twitterUsername': instance.twitterUsername,
      'portfolioUrl': instance.portfolioUrl,
      'bio': instance.bio,
      'location': instance.location,
      'links': instance.links?.toJson(),
      'profileImage': instance.profileImage?.toJson(),
      'instagramUsername': instance.instagramUsername,
      'totalCollections': instance.totalCollections,
      'totalLikes': instance.totalLikes,
      'totalPhotos': instance.totalPhotos,
      'acceptedTos': instance.acceptedTos,
      'forHire': instance.forHire,
    };

UserLinks _$UserLinksFromJson(Map<String, dynamic> json) => UserLinks(
      photos: json['photos'] as String?,
      following: json['following'] as String?,
      followers: json['followers'] as String?,
    );

Map<String, dynamic> _$UserLinksToJson(UserLinks instance) => <String, dynamic>{
      'photos': instance.photos,
      'following': instance.following,
      'followers': instance.followers,
    };

ProfileImage _$ProfileImageFromJson(Map<String, dynamic> json) => ProfileImage(
      small: json['small'] as String?,
      medium: json['medium'] as String?,
      large: json['large'] as String?,
    );

Map<String, dynamic> _$ProfileImageToJson(ProfileImage instance) =>
    <String, dynamic>{
      'small': instance.small,
      'medium': instance.medium,
      'large': instance.large,
    };

Urls _$UrlsFromJson(Map<String, dynamic> json) => Urls(
      raw: json['raw'] as String?,
      full: json['full'] as String?,
      regular: json['regular'] as String?,
      small: json['small'] as String?,
    );

Map<String, dynamic> _$UrlsToJson(Urls instance) => <String, dynamic>{
      'raw': instance.raw,
      'full': instance.full,
      'regular': instance.regular,
      'small': instance.small,
    };
