import 'package:flutter/material.dart';
import 'package:zilmoney_task/constants/const_size.dart';
import 'package:get/get.dart';
import 'package:zilmoney_task/controller/product_controller.dart';

class ProductScreen extends StatefulWidget {
  ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  void initState() {
    controller.getAllProducts();
    super.initState();
  }

  final controller = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All products'),
        centerTitle: true,
      ),
      body: Padding(
          padding: const EdgeInsets.all(10),
          child: Obx(() => ListView.separated(
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundImage:
                        NetworkImage(controller.allProductsModel[index].image),
                  ),
                );
              },
              separatorBuilder: (context, index) => kHeight10,
              itemCount: 10,
            ),)
          ),
    );
  }
}
