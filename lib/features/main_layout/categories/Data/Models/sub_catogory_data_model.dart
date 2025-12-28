import 'package:ecommerce_app/features/main_layout/categories/domain/Entities/sub_catogory_entity.dart';

class sub_catogory_data {
  final String? sId;
  final String? name;
  final String? slug;
  final String? category;
  final String? createdAt;
  final String? updatedAt;

  sub_catogory_data(
      {this.sId,
      this.name,
      this.slug,
      this.category,
      this.createdAt,
      this.updatedAt});

  factory sub_catogory_data.fromJson(Map<String, dynamic> json) {
    return sub_catogory_data(
      sId: json['_id'],
      name: json['name'],
      slug: json['slug'],
      category: json['category'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }

  SubCatogoryEntity toEntity() {
    return SubCatogoryEntity(
      sId: sId,
      name: name,
      slug: slug,
    );
  }
}
