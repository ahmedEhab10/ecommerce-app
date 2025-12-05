import 'package:ecommerce_app/features/main_layout/home/domain/Entities/Brand_Entity.dart';

class Brand {
  final String? id;
  final String? name;
  final String? slug;
  final String? image;
  final String? createdAt;
  final String? updatedAt;

  Brand(
      {this.id,
      this.name,
      this.slug,
      this.image,
      this.createdAt,
      this.updatedAt});

  factory Brand.fromJson(Map<String, dynamic> json) {
    return Brand(
      id: json['_id'],
      name: json['name'],
      slug: json['slug'],
      image: json['image'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }
  BrandEntity toBrandEntity() {
    return BrandEntity(id: id!, name: name!, image: image!);
  }
}
