class FavProductEntity {
  final String? id;
  final String? title;
  final String? description;
  final String? image;
  final num? price;
  final num? quantity;
  final String? imageCover;
  final num? ratingsAverage;

  FavProductEntity(
      {required this.id,
      required this.title,
      required this.description,
      required this.image,
      required this.price,
      required this.quantity,
      required this.imageCover,
      required this.ratingsAverage});
}
