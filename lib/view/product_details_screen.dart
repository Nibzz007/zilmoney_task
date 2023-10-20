import 'package:flutter/material.dart';
import 'package:zilmoney_task/constants/const_color.dart';
import 'package:zilmoney_task/constants/const_size.dart';
import 'package:zilmoney_task/model/products_model.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({
    super.key,
    required this.product,
  });

  final AllProductsModel product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          product.title,
          style: const TextStyle(color: kWhite),
        ),
        backgroundColor: kAmber,
        iconTheme: const IconThemeData(color: kWhite),
      ),
      body: Column(
        children: [
          kHeight10,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              width: double.infinity,
              height: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    product.image,
                  ),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
