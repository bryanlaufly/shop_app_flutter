import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {

  final String title;
  final double price;
  final String imageUrl;
  final Color backgroundColor;

  const ProductCard({
    super.key,
    required this.title,
    required this.price,
    required this.imageUrl,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      margin:const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium,
            ),
          Text('\$$price',
            style: Theme.of(context).textTheme.bodyMedium
          ), 
          Center(child: Image.asset(imageUrl,height: 150,)),
          // Image(
          //   image:AssetImage(imageUrl),
          //   height: 150,
          // )
        ],
      ),
    );
  }
}
