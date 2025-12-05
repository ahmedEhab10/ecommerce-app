import 'package:ecommerce_app/features/main_layout/home/domain/Entities/category_entity.dart';

class CatogryData {
  final String id;
  final String name;
  final String slug;
  final String image;
  final String createdAt;
  final String updatedAt;

  CatogryData(
      {required this.id,
      required this.name,
      required this.slug,
      required this.image,
      required this.createdAt,
      required this.updatedAt});

  factory CatogryData.fromJson(Map<String, dynamic> json) {
    return CatogryData(
      id: json['_id'],
      name: json['name'],
      slug: json['slug'],
      image: json['image'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }

  CategoryEntity toEntity() {
    return CategoryEntity(
      name: name,
      image: image,
      id: id,
    );
  }
}
