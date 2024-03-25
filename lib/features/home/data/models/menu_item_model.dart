import '../../domain/entities/menu_item.dart';

class MenuItemModel extends MenuItem {
  MenuItemModel({
    required String image,
    required String name,
    required String next,
  }) : super(image: image, name: name, next: next);

  factory MenuItemModel.fromJson(Map<String, dynamic> json) {
    return MenuItemModel(
      image: json['image'],
      name: json['name'],
      next: json['next'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'name': name,
      'next': next,
    };
  }
}
