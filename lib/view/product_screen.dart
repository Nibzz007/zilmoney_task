import 'package:flutter/material.dart';
import 'package:zilmoney_task/constants/const_color.dart';
import 'package:zilmoney_task/constants/const_size.dart';
import 'package:get/get.dart';
import 'package:zilmoney_task/controller/product_controller.dart';
import 'package:zilmoney_task/view/product_details_screen.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  final controller = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'All products',
          style: TextStyle(
            color: kWhite,
            fontWeight: FontWeight.w800,
            letterSpacing: 4,
          ),
        ),
        centerTitle: true,
        backgroundColor: kAmber,
      ),
      body: Obx(
        () => controller.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
                padding: const EdgeInsets.all(10),
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {
                        Get.to(
                          ProductDetailsScreen(
                            product: controller.allProducts[index],
                          ),
                        );
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                        side: const BorderSide(
                          width: 0.8,
                          color: kAmber,
                        ),
                      ),
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(
                          controller.allProducts[index].image,
                        ),
                      ),
                      title: Text(
                        controller.allProducts[index].title,
                        overflow: TextOverflow.ellipsis,
                      ),
                      subtitle:
                          Text(controller.allProducts[index].category.name),
                      trailing: Text(
                        '\$ ${controller.allProducts[index].price.toString()}',
                        style: const TextStyle(
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => kHeight10,
                  itemCount: controller.allProducts.length,
                ),
              ),
      ),
    );
  }
}
