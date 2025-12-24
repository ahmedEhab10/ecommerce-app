class Category {
  final String? sId;
  final String? name;
  final String? slug;
  final String? image;

  Category({this.sId, this.name, this.slug, this.image});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      sId: json['_id'],
      name: json['name'],
      slug: json['slug'],
      image: json['image'],
    );
  }
}
