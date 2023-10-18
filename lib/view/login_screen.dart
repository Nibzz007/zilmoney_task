import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zilmoney_task/constants/const_color.dart';
import 'package:zilmoney_task/constants/const_size.dart';
import 'package:zilmoney_task/controller/login_controller.dart';
import 'package:zilmoney_task/view/product_screen.dart';
import 'widgets/textform_field_widget.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final controller = Get.put(LoginController());
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'The Online Shop',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                kHeight60,
                const Text(
                  'Login',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                kHeight50,
                const Text('Username'),
                TextFormFieldWidget(
                  validator: (value) {
                    if (value!.length < 5 && value != null) {
                      return 'Username must be at least 5 characters';
                    }
                    return null;
                  },
                  controller: usernameController,
                ),
                kHeight20,
                const Text('Password'),
                TextFormFieldWidget(
                  validator: (value) {
                    if (value!.length < 5 && value != null) {
                      return 'Password must be at least 5 characters';
                    }
                    return null;
                  },
                  obscureText: true,
                  controller: passwordController,
                ),
                kHeight20,
                Row(
                  children: [
                    Checkbox(
                      value: false,
                      onChanged: (value) {
                        
                      },
                    ),
                    const Text('Remember password'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        if (!formKey.currentState!.validate()) {
                          return;
                        }
                        String? token = await controller.loginPost(
                          usernameController.text,
                          passwordController.text,
                        );
                        storeToken(token!);
                        Get.off(ProductScreen());
                      },
                      style: ElevatedButton.styleFrom(backgroundColor: kBlack),
                      child: const Text(
                        'Login',
                        style: TextStyle(color: kWhite),
                      ),
                    ),
                  ],
                ),
                kHeight70,
              ],
            ),
          ),
        ),
      ),
    );
  }

  void storeToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }
}
