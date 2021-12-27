class HomeModel {
  HomeModel();

  bool? status;
  HomeDataModel? data;

  HomeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = HomeDataModel.fromJson(json['data']);
  }
}

class HomeDataModel {
  List<BannerModels>? banners = [];
  List<ProductModel>? products = [];

  HomeDataModel.fromJson(Map<String, dynamic> json) {
    json['banners'].forEach((element) {
      banners?.add(BannerModels.fromJson(element));
    });
    json['products'].forEach((element) {
      products?.add(ProductModel.fromJson(element));
    });
  }
}

class BannerModels {
  int? id;
  String? image;

  BannerModels.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
  }
}

class ProductModel {
  int? id;
  dynamic price;
  dynamic oldprice;
  dynamic discount;
  String? image;
  String? name;
  bool? infavorites;
  bool? incart;

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    oldprice = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
    infavorites = json['in_favorites'];
    incart = json['in_cart'];
  }
}
