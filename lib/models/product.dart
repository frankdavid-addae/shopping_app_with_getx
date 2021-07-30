import 'package:get/state_manager.dart';

class Product {
  late final int? id;
  late final String? productName;
  late final String? productImage;
  late final String? productDescription;
  late final double? productPrice;

  Product(
      {this.id,
      this.productName,
      this.productImage,
      this.productDescription,
      this.productPrice});

  final isFavorite = false.obs;
}
