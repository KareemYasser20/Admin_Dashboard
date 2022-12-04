
class ProductModel {
  final int productId;
  final String productName;
  final String productDescription;
  final String productImage;
  final double productPrice;
  // product offer ==> 1 this product have offer otherwise 0
  final int productOffer;
  final double productRate;
  // product Favourite ==> 1 this product in Favourite list otherwise 0
  final int productFavourite;
  // product FirstShow ==> 1 this product shown in  home screen otherwise 0
  final int productFirstShow;
  final int productQuantity;

  ProductModel({
    required this.productId,
    required this.productName,
    required this.productDescription,
    required this.productImage,
    required this.productPrice,
    required this.productOffer,
    required this.productRate,
    required this.productFavourite,
    required this.productFirstShow,
    required this.productQuantity,
  });


  factory ProductModel.fromJson(Map<String, dynamic> json){
    return ProductModel(
      productId: json[''],
      productName: json[''],
      productDescription: json[''],
      productImage: json[''],
      productPrice: json[''],
      productOffer: json[''],
      productRate: json[''],
      productFavourite: json[''],
      productFirstShow: json[''],
      productQuantity: json[''],
    );
  }





}
