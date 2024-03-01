class BlogResponse {
  bool success;
  String detail;
  int count;
  dynamic next;
  dynamic previous;
  List<BlogData> data;
  BlogResponse(
      {required this.success,
      required this.detail,
      required this.count,
      required this.next,
      required this.previous,
      required this.data});
}

class BlogData {
  int id;
  String title;
  LastModifiedBy user;
  DateTime createdAt;
  DateTime updatedAt;
  String thumbnail;
  String status;
  String slug;
  Category category;
  Category subcategory;
  String seoDescription;
  List<SeoKeyword> tags;
  List<SeoKeyword> seoKeywords;
  int minutesToRead;
  LastModifiedBy lastModifiedBy;
  int likesCount;
  int lovesCount;
  List<LastModifiedBy> contributors;
  LastModifiedBy publisher;
  String textContent;
  BlogData(
      {required this.id,
      required this.title,
      required this.user,
      required this.createdAt,
      required this.updatedAt,
      required this.thumbnail,
      required this.status,
      required this.slug,
      required this.category,
      required this.subcategory,
      required this.seoDescription,
      required this.tags,
      required this.seoKeywords,
      required this.minutesToRead,
      required this.lastModifiedBy,
      required this.likesCount,
      required this.lovesCount,
      required this.contributors,
      required this.publisher,
      required this.textContent});
}

class Category {
  int id;
  String name;
  String slug;
  Category({required this.id, required this.name, required this.slug});
}

class LastModifiedBy {
  String? id;
  String firstName;
  String lastName;
  String email;
  String profilePhoto;
  bool isStaff;
  LastModifiedBy(
      {this.id,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.isStaff,
      required this.profilePhoto});
}

class SeoKeyword {
  int id;
  String name;
  SeoKeyword({required this.id, required this.name});
}
