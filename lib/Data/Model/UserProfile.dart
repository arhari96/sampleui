// To parse this JSON data, do
//
//     final userProfile = userProfileFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<UserProfile> userProfileFromJson(List str) => List<UserProfile>.from(str.map((x) => UserProfile.fromJson(x)));

String userProfileToJson(List<UserProfile> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserProfile {
  final String id;
  final String slug;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int width;
  final int height;
  final String color;
  final Urls urls;
  final UserProfileLinks links;
  final int likes;
  final User user;

  UserProfile({
    required this.id,
    required this.slug,
    required this.createdAt,
    required this.updatedAt,
    required this.width,
    required this.height,
    required this.color,
    required this.urls,
    required this.links,
    required this.likes,
    required this.user,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) => UserProfile(
        id: json["id"],
        slug: json["slug"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        width: json["width"],
        height: json["height"],
        color: json["color"],
        urls: Urls.fromJson(json["urls"]),
        links: UserProfileLinks.fromJson(json["links"]),
        likes: json["likes"],
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "slug": slug,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "width": width,
        "height": height,
        "color": color,
        "urls": urls.toJson(),
        "links": links.toJson(),
        "likes": likes,
        "user": user.toJson(),
      };
}

class UserProfileLinks {
  final String self;
  final String html;
  final String download;
  final String downloadLocation;

  UserProfileLinks({
    required this.self,
    required this.html,
    required this.download,
    required this.downloadLocation,
  });

  factory UserProfileLinks.fromJson(Map<String, dynamic> json) => UserProfileLinks(
        self: json["self"],
        html: json["html"],
        download: json["download"],
        downloadLocation: json["download_location"],
      );

  Map<String, dynamic> toJson() => {
        "self": self,
        "html": html,
        "download": download,
        "download_location": downloadLocation,
      };
}

class User {
  final String id;
  final DateTime updatedAt;
  final String username;
  final String name;
  final String firstName;
  final String lastName;
  final UserLinks links;
  final ProfileImage profileImage;

  User({
    required this.id,
    required this.updatedAt,
    required this.username,
    required this.name,
    required this.firstName,
    required this.lastName,
    required this.links,
    required this.profileImage,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        updatedAt: DateTime.parse(json["updated_at"]),
        username: json["username"],
        name: json["name"],
        firstName: json["first_name"],
        lastName: json["last_name"] ?? 'User',
        links: UserLinks.fromJson(json["links"]),
        profileImage: ProfileImage.fromJson(json["profile_image"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "updated_at": updatedAt.toIso8601String(),
        "username": username,
        "name": name,
        "first_name": firstName,
        "last_name": lastName,
        "links": links.toJson(),
        "profile_image": profileImage.toJson(),
      };
}

class UserLinks {
  final String self;
  final String html;
  final String photos;
  final String likes;
  final String portfolio;
  final String following;
  final String followers;

  UserLinks({
    required this.self,
    required this.html,
    required this.photos,
    required this.likes,
    required this.portfolio,
    required this.following,
    required this.followers,
  });

  factory UserLinks.fromJson(Map<String, dynamic> json) => UserLinks(
        self: json["self"],
        html: json["html"],
        photos: json["photos"],
        likes: json["likes"],
        portfolio: json["portfolio"],
        following: json["following"],
        followers: json["followers"],
      );

  Map<String, dynamic> toJson() => {
        "self": self,
        "html": html,
        "photos": photos,
        "likes": likes,
        "portfolio": portfolio,
        "following": following,
        "followers": followers,
      };
}

class ProfileImage {
  final String small;
  final String medium;
  final String large;

  ProfileImage({
    required this.small,
    required this.medium,
    required this.large,
  });

  factory ProfileImage.fromJson(Map<String, dynamic> json) => ProfileImage(
        small: json["small"],
        medium: json["medium"],
        large: json["large"],
      );

  Map<String, dynamic> toJson() => {
        "small": small,
        "medium": medium,
        "large": large,
      };
}

class Nature {
  final String status;
  final DateTime approvedOn;

  Nature({
    required this.status,
    required this.approvedOn,
  });

  factory Nature.fromJson(Map<String, dynamic> json) => Nature(
        status: json["status"],
        approvedOn: DateTime.parse(json["approved_on"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "approved_on": approvedOn.toIso8601String(),
      };
}

class TexturesPatterns {
  final String status;

  TexturesPatterns({
    required this.status,
  });

  factory TexturesPatterns.fromJson(Map<String, dynamic> json) => TexturesPatterns(
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
      };
}

class Urls {
  final String raw;
  final String full;
  final String regular;
  final String small;
  final String thumb;
  final String smallS3;

  Urls({
    required this.raw,
    required this.full,
    required this.regular,
    required this.small,
    required this.thumb,
    required this.smallS3,
  });

  factory Urls.fromJson(Map<String, dynamic> json) => Urls(
        raw: json["raw"],
        full: json["full"],
        regular: json["regular"],
        small: json["small"],
        thumb: json["thumb"],
        smallS3: json["small_s3"],
      );

  Map<String, dynamic> toJson() => {
        "raw": raw,
        "full": full,
        "regular": regular,
        "small": small,
        "thumb": thumb,
        "small_s3": smallS3,
      };
}
