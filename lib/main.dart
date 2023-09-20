import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sreegetx/productctrlr.dart';




void main() {
  runApp(GetMaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
      ),
      body: Center(
        child: ProductListView(),
      ),
    ),
  ));
}

class ProductListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productController = Get.put(ProductController());

    return Obx(() {
      if (productController.products.isEmpty) {
        return CircularProgressIndicator();
      } else {
        return ListView.builder(
          itemCount: productController.products.length,
          itemBuilder: (context, index) {
            final product = productController.products[index];
            return ListTile(
              leading: Image.network('${product.thumbnail}',height: 50,width: 50,fit:BoxFit.cover ,),
              title: Text(product.title),
              subtitle: Text(product.description),
              trailing: Text('\$${product.price.toStringAsFixed(2)}'),
            );
          },
        );
      }
    });
  }
}
