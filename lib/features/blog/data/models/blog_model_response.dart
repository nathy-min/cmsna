// To parse this JSON data, do
//
//     final blogResponseModel = blogResponseModelFromJson(jsonString);

import 'dart:convert';

import 'package:cmsna/features/blog/domain/entities/blog_response.dart';

BlogResponseModel blogResponseModelFromJson(String str) =>
    BlogResponseModel.fromJson(json.decode(str));

// String blogResponseModelToJson(BlogResponseModel data) =>
//     json.encode(data.toJson());

class BlogResponseModel extends BlogResponse {
  BlogResponseModel({
    required super.success,
    required super.detail,
    required super.count,
    required super.next,
    required super.previous,
    required super.data,
  });

  factory BlogResponseModel.fromJson(Map<String, dynamic> json) =>
      BlogResponseModel(
        success: json["success"],
        detail: json["detail"],
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        data: List<BlogDataModel>.from(
            json["data"].map((x) => BlogDataModel.fromJson(x))),
      );

  // Map<String, dynamic> toJson() => {
  //       "success": success,
  //       "detail": detail,
  //       "count": count,
  //       "next": next,
  //       "previous": previous,
  //       "data": List<dynamic>.from(data.map((x) => x.toJson())),
  //     };
}

class BlogDataModel extends BlogData {
  BlogDataModel({
    required super.id,
    required super.title,
    required super.user,
    required super.createdAt,
    required super.updatedAt,
    required super.thumbnail,
    required super.status,
    required super.slug,
    required super.category,
    required super.subcategory,
    required super.seoDescription,
    required super.tags,
    required super.seoKeywords,
    required super.minutesToRead,
    required super.lastModifiedBy,
    required super.likesCount,
    required super.lovesCount,
    required super.contributors,
    required super.publisher,
    required super.textContent,
  });

  factory BlogDataModel.fromJson(Map<String, dynamic> json) => BlogDataModel(
        id: json["id"],
        title: json["title"],
        user: LastModifiedByModel.fromJson(json["user"]),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        thumbnail: json["thumbnail"],
        status: json["status"],
        slug: json["slug"],
        category: CategoryModel.fromJson(json["category"]),
        subcategory: CategoryModel.fromJson(json["subcategory"]),
        seoDescription: json["seo_description"],
        tags: List<SeoKeyword>.from(
            json["tags"].map((x) => SeoKeywordModel.fromJson(x))),
        seoKeywords: List<SeoKeyword>.from(
            json["seo_keywords"].map((x) => SeoKeywordModel.fromJson(x))),
        minutesToRead: json["minutes_to_read"],
        lastModifiedBy: LastModifiedByModel.fromJson(json["last_modified_by"]),
        likesCount: json["likes_count"],
        lovesCount: json["loves_count"],
        contributors: List<LastModifiedByModel>.from(
            json["contributors"].map((x) => LastModifiedByModel.fromJson(x))),
        publisher: LastModifiedByModel.fromJson(json["publisher"]),
        textContent: json["text_content"],
      );

  // Map<String, dynamic> toJson() => {
  //       "id": id,
  //       "title": title,
  //       "user": user.toJson(),
  //       "created_at": createdAt.toIso8601String(),
  //       "updated_at": updatedAt.toIso8601String(),
  //       "thumbnail": thumbnail,
  //       "status": status,
  //       "slug": slug,
  //       "category": category.toJson(),
  //       "subcategory": subcategory.toJson(),
  //       "seo_description": seoDescription,
  //       "tags": List<dynamic>.from(tags.map((x) => x.toJson())),
  //       "seo_keywords": List<dynamic>.from(seoKeywords.map((x) => x.toJson())),
  //       "minutes_to_read": minutesToRead,
  //       "last_modified_by": lastModifiedBy.toJson(),
  //       "likes_count": likesCount,
  //       "loves_count": lovesCount,
  //       "contributors": List<dynamic>.from(contributors.map((x) => x.toJson())),
  //       "publisher": publisher.toJson(),
  //       "text_content": textContent,
  //     };
}

class CategoryModel extends Category {
  CategoryModel({
    required super.id,
    required super.name,
    required super.slug,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
      };
}

class LastModifiedByModel extends LastModifiedBy {
  LastModifiedByModel({
    super.id,
    required super.firstName,
    required super.lastName,
    required super.email,
    required super.profilePhoto,
    required super.isStaff,
  });

  factory LastModifiedByModel.fromJson(Map<String, dynamic> json) =>
      LastModifiedByModel(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        profilePhoto: json["profile_photo"],
        isStaff: json["is_staff"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "profile_photo": profilePhoto,
        "is_staff": isStaff,
      };
}

class SeoKeywordModel extends SeoKeyword {
  SeoKeywordModel({
    required super.id,
    required super.name,
  });

  factory SeoKeywordModel.fromJson(Map<String, dynamic> json) =>
      SeoKeywordModel(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
