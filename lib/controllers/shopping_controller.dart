import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:shopping_app_with_getx/models/product.dart';
import 'package:get/get.dart';

class ShoppingController extends GetxController {
  // Observing the products list for data changes using .obs from GetX
  var products = List<Product>.filled(0, Product(), growable: true)
      .obs; // Observable products list

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
    await Future.delayed(Duration(seconds: 1));
    var productsResponse = [
      Product(
        id: 1,
        productPrice: 30.0,
        productDescription: 'some description about product',
        productImage: 'abd',
        productName: 'FirstProd',
      ),
      Product(
        id: 2,
        productPrice: 40.0,
        productDescription: 'some description about product',
        productImage: 'abd',
        productName: 'SecProd',
      ),
      Product(
        id: 3,
        productPrice: 49.5,
        productDescription: 'some description about product',
        productImage: 'abd',
        productName: 'ThirdProd',
      ),
      Product(
        id: 4,
        productPrice: 35.0,
        productDescription: 'some description about product',
        productImage: 'abd',
        productName: 'FourthProd',
      ),
    ];

    products.assignAll(productsResponse);
  }
}
