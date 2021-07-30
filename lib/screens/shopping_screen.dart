import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app_with_getx/controllers/cart_controller.dart';
import 'package:shopping_app_with_getx/controllers/shopping_controller.dart';

class ShoppingScreen extends StatelessWidget {
  ShoppingScreen({Key? key}) : super(key: key);

  // Creating an instance of the Controllers and initializing them using
  // the Get dependency injector
  final ShoppingController shoppingController = Get.put(ShoppingController());
  final CartController cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.shade100,
      body: SafeArea(
        child: Column(
          children: [
            Flexible(
              child: GetX<ShoppingController>(builder: (shoppingController) {
                return ListView.builder(
                  itemCount: shoppingController.products.length,
                  itemBuilder: (context, index) {
                    return Card(
                      color: Colors.grey[300],
                      margin: const EdgeInsets.all(12),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${shoppingController.products[index].productName}',
                                      style: TextStyle(
                                        fontSize: 24,
                                      ),
                                    ),
                                    Text(
                                      '${shoppingController.products[index].productDescription}',
                                    ),
                                  ],
                                ),
                                Text(
                                  '\$${shoppingController.products[index].productPrice}',
                                  style: TextStyle(fontSize: 24),
                                ),
                              ],
                            ),
                            RaisedButton(
                              onPressed: () {
                                cartController.addToCart(
                                  shoppingController.products[index],
                                );
                              },
                              color: Colors.teal,
                              textColor: Colors.white,
                              child: Text('Add to Cart'),
                            ),
                            Obx(
                              () => IconButton(
                                icon: shoppingController
                                        .products[index].isFavorite.value
                                    ? Icon(Icons.check_box_rounded)
                                    : Icon(
                                        Icons.check_box_outline_blank_outlined),
                                onPressed: () {
                                  shoppingController.products[index].isFavorite
                                      .toggle();
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }),
            ),
            // GetX<CartController>(builder: (cartController) {
            //   return Text('Total amount: \$ ${cartController.totalPrice}');
            // }),
            Obx(() {
              return Text('Total amount: \$ ${cartController.totalPrice}');
            }),
            SizedBox(
              height: 100.0,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: GetX<CartController>(builder: (cartController) {
          return Text(cartController.count.toString());
        }),
        icon: Icon(Icons.add_shopping_cart_rounded),
        backgroundColor: Colors.teal,
      ),
    );
  }
}
