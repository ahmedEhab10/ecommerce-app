import 'package:ecommerce_app/features/main_layout/home/data/Models/Brand_ressponse/Brand.dart';
import 'package:ecommerce_app/features/main_layout/home/data/Models/catogry_ressponse/Metadata.dart';

class Brand_ressponse {
  final int? results;
  final Metadata? metadata;
  final List<Brand>? brands;

  Brand_ressponse({this.results, this.metadata, this.brands});

  factory Brand_ressponse.fromJson(Map<String, dynamic> json) {
    return Brand_ressponse(
      results: json['results'],
      metadata: json['metadata'] != null
          ? new Metadata.fromJson(json['metadata'])
          : null,
      brands: json['data'] != null
          ? (json['data'] as List).map((i) => Brand.fromJson(i)).toList()
          : null,
    );
  }
}
