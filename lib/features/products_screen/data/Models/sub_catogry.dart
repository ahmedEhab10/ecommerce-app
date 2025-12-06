class Subcategory {
  final String? sId;
  final String? name;
  final String? slug;
  final String? category;

  Subcategory({this.sId, this.name, this.slug, this.category});

  factory Subcategory.fromJson(Map<String, dynamic> json) {
    return Subcategory(
      sId: json['_id'],
      name: json['name'],
      slug: json['slug'],
      category: json['category'],
    );
  }
}
