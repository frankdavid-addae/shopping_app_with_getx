import 'package:get/get.dart';
import 'package:shopping_app_with_getx/models/product.dart';

class CartController extends GetxController {
  // Observing the cartItems list for data changes using .obs from GetX
  var cartItems = List<Product>.filled(0, Product(), growable: true)
      .obs; // Observable cartItems list
  int get count => cartItems.length;
  double get totalPrice =>
      cartItems.fold(0.0, (sum, item) => sum + item.productPrice!);

  addToCart(Product product) {
    cartItems.add(product);
  }
}
