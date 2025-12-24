import 'package:ecommerce_app/features/main_layout/favourite/data/Models/fav_product_data.dart';

class get_fav_ressponse {
  final String? status;
  final int? count;
  final List<FavProductData>? productdata;

  get_fav_ressponse({this.status, this.count, this.productdata});

  factory get_fav_ressponse.fromJson(Map<String, dynamic> json) {
    return get_fav_ressponse(
      status: json['status'],
      count: json['count'],
      productdata: json['data'] != null
          ? new List<FavProductData>.from(
              json['data'].map((x) => FavProductData.fromJson(x)))
          : null,
    );
  }
}
