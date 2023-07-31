import 'dart:convert';
import 'package:get/get.dart';
import 'package:zilmoney_task/model/products_model.dart';
import 'package:http/http.dart' as http;

class ProductController extends GetxController {
  RxBool isLoading = false.obs;
  List<AllProductsModel> allProductsModel = [];

  getAllProducts() async {
    
    String baseUrl = "https://fakestoreapi.com/products";
    
    try {
      Uri url = Uri.parse(baseUrl);
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = AllProductsModel.fromJson(
          jsonDecode(response.body),
        );
        return data;
      }
    } catch (e) {
      throw Exception(e);
    } finally {
      
    }
  }
}
