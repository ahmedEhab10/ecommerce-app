class CatogryItemModel {
  final String id;
  final String name;
  final String? image;
  final String? slug;

  CatogryItemModel({
    required this.id,
    required this.name,
    this.image,
    this.slug,
  });

  static List<CatogryItemModel> listofcatogryItemModel = [
    CatogryItemModel(
      id: '6439d5b90049ad0b52b90048',
      name: 'Men\'s Fashion',
      slug: 'Men\'s Fashion',
      image: '',
    ),
    CatogryItemModel(
      id: '6439d58a0049ad0b52b9003f',
      name: 'Women\'s Fashion',
      slug: 'Women\'s Fashion',
      image: '',
    ),
    CatogryItemModel(
      id: '6439d41c67d9aa4ca97064d5',
      name: 'SuperMarket',
      slug: 'SuperMarket',
      image: '',
    ),
    CatogryItemModel(
      id: '6439d40367d9aa4ca97064cc',
      name: 'Baby & Toys',
      slug: 'Baby & Toys',
      image: '',
    ),
    CatogryItemModel(
      id: '6439d3e067d9aa4ca97064c3',
      name: 'Home',
      slug: 'Home',
      image: '',
    ),
    CatogryItemModel(
      id: '6439d61c0049ad0b52b9005',
      name: 'Books',
      slug: 'Books',
      image: '',
    ),
    CatogryItemModel(
      id: '6439d3c867d9aa4ca97064ba',
      name: 'Beauty & Health',
      slug: 'Beauty & Health',
      image: '',
    ),
    CatogryItemModel(
      id: '6439d30b67d9aa4ca97064b1',
      name: 'Mobiles',
      slug: 'Mobiles',
      image: '',
    ),
    CatogryItemModel(
      id: '6439d2f467d9aa4ca97064a8',
      name: 'Electronics',
      slug: 'Electronics',
      image: '',
    ),
  ];
}
