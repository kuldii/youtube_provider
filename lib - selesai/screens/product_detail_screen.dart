import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/all_products.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = '/product-detail';

  @override
  Widget build(BuildContext context) {
    final productId =
        ModalRoute.of(context).settings.arguments as String; // is the id!
    final product = Provider.of<Products>(context).findById(productId);

    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 250,
            child: Image.network(
              "${product.imageUrl}",
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 30),
          Text(
            "${product.title}",
            style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 15),
          Text(
            "\$${product.price}",
            style: TextStyle(
              fontSize: 24,
            ),
          ),
          SizedBox(height: 15),
          Text(
            "${product.description}",
            style: TextStyle(
              fontSize: 24,
            ),
          ),
        ],
      ),
    );
  }
}
