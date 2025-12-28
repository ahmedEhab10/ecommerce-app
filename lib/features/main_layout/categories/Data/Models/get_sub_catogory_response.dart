import 'package:ecommerce_app/features/main_layout/categories/Data/Models/sub_catogory_data_model.dart';

class gat_sub_catogory_response {
  final int? results;
  final Metadata? metadata;
  final List<sub_catogory_data>? data;

  gat_sub_catogory_response({this.results, this.metadata, this.data});

  factory gat_sub_catogory_response.fromJson(Map<String, dynamic> json) {
    return gat_sub_catogory_response(
      results: json['results'],
      metadata: json['metadata'] != null
          ? new Metadata.fromJson(json['metadata'])
          : null,
      data: json['data'] != null
          ? (json['data'] as List)
              .map((i) => sub_catogory_data.fromJson(i))
              .toList()
          : null,
    );
  }
}

class Metadata {
  int? currentPage;
  int? numberOfPages;
  int? limit;

  Metadata({this.currentPage, this.numberOfPages, this.limit});

  Metadata.fromJson(Map<String, dynamic> json) {
    currentPage = json['currentPage'];
    numberOfPages = json['numberOfPages'];
    limit = json['limit'];
  }
}
