import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zilmoney_task/model/login_model.dart';

class LoginController extends GetxController {
  RxBool isChecked = false.obs;
  RxBool isClicked = false.obs;

  toggleCheckbox() {
    isChecked.value = !isChecked.value;
  }

  Future<String?> loginPost(String username, String password) async {
    String baseUrl = "https://fakestoreapi.com/auth/login";
    try {
      Uri url = Uri.parse(baseUrl);
      final response = await http.post(
        url,
        body: {
          "username": username,
          "password": password,
        },
      );
      if (response.statusCode == 200) {
        final data = LoginModel.fromJson(jsonDecode(response.body));
        final token = data.token;
        return token;
      }
    } catch (e) {
      throw Exception('$e');
    }
    return null;
  }

  Future<void> storeToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }

  Future<void> clearToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
  }
}
