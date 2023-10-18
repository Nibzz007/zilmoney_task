import 'package:get/get.dart';
import 'package:zilmoney_task/model/products_model.dart';
import 'package:http/http.dart' as http;

class ProductController extends GetxController {
  RxBool isLoading = false.obs;
  var allProducts = <AllProductsModel>[].obs;

   @override
  void onInit() {
    super.onInit();
    getAllProducts();
  }

  getAllProducts() async {
    try {
      isLoading(true);
      String baseUrl = "https://fakestoreapi.com/products";
      Uri url = Uri.parse(baseUrl);
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final products = allProductsModelFromJson(response.body);
        allProducts.assignAll(products);
      }
    } catch (e) {
      throw Exception(e);
    } finally {
      isLoading(false);
    }
  }
}
