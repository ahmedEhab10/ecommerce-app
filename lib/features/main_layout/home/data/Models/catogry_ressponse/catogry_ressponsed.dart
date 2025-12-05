import 'package:ecommerce_app/features/main_layout/home/data/Models/catogry_ressponse/Metadata.dart';
import 'package:ecommerce_app/features/main_layout/home/data/Models/catogry_ressponse/catogry_data.dart';

class Catogry_ressponse {
  int? results;
  Metadata? metadata;
  List<CatogryData>? catories;

  Catogry_ressponse({this.results, this.metadata, this.catories});

  Catogry_ressponse.fromJson(Map<String, dynamic> json) {
    results = json['results'];
    metadata = json['metadata'] != null
        ? new Metadata.fromJson(json['metadata'])
        : null;
    if (json['data'] != null) {
      catories = <CatogryData>[];
      json['data'].forEach((v) {
        catories!.add(new CatogryData.fromJson(v));
      });
    }
  }
}
