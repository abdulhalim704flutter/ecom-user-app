import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecom_user/models/product_model.dart';
import 'package:ecom_user/pages/product_details_page.dart';
import 'package:ecom_user/providers/product_provider.dart';
import 'package:ecom_user/utils/constanse.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

class ProductGridItem extends StatelessWidget {
  final ProductModel product;
  const ProductGridItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductProvider>(context,listen: false);
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, ProductDetailsPage.routeName, arguments: product.id);
      },
      child: Card(
        color: Colors.grey.shade200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Stack(
                children: [
                  CachedNetworkImage(
                    fadeInDuration: Duration(seconds: 2),
                    fadeInCurve: Curves.bounceInOut,
                    imageUrl: product.imageUrl,
                    placeholder: (context, url) => Center(
                      child: CircularProgressIndicator(),
                    ),
                    errorWidget: (context, url, error) => Center(
                      child: Icon(Icons.error),
                    ),
                  ),
                  if(product.discount > 0) Container(
                    alignment: Alignment.center,
                    child: Text('${product.discount} % OFF',style: TextStyle(color: Colors.amber,fontWeight: FontWeight.bold),),
                    height: 50,
                    color: Colors.black45,
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(2.0),
              child: Text(
                product.name,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 18),
              ),
            ),
            if(product.discount > 0) RichText(
              text: TextSpan(
                text: '$currencySymboll${product.price} ',
                style: const TextStyle(color: Colors.grey,fontSize: 18,decoration: TextDecoration.lineThrough),
                children: [
                  TextSpan(
                    text: '$currencySymboll${provider.priceAfterDiscount(product.price, product.discount)}',
                    style: const TextStyle(fontSize: 25,color: Colors.black,decoration: TextDecoration.none),
                  )
                ]
              ),
            ),
            if(product.discount == 0) Text(
              '$currencySymboll${product.price}',
              style: const TextStyle(fontSize: 25,color: Colors.black),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('${product.avgRating}'),
                RatingBar.builder(
                    onRatingUpdate: (value) {
                    },
                  ignoreGestures: true,
                  itemBuilder: (context, index) => const Icon(Icons.star,color: Colors.amber,),
                  itemCount: 5,
                  allowHalfRating: true,
                  initialRating: product.avgRating.toDouble(),
                  itemSize: 18.0,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
