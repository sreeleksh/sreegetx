import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:sreegetx/Apiservice.dart';
import 'package:sreegetx/Products.dart';


class ProductController extends GetxController {
  final products = <Products>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  Future<void> fetchData() async {
   ApiService apiService=ApiService();
   var productList=await apiService.fetchproducts().then((value)  {
     products.assignAll(value);
   });
  }
}