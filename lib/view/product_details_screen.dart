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
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            kHeight10,
            Container(
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
            kHeight10,
            Text(
              product.title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            kHeight5,
            Row(
              children: [
                Text(
                  product.rating.rate.toString(),
                ),
                kWidth5,
                Text(
                  "(${product.rating.count})",
                ),
              ],
            ),
            kHeight20,
            Text('Description'),
            kHeight10,
            Text(product.description)
          ],
        ),
      ),
    );
  }
}
