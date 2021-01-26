import 'package:flutter/material.dart';
import 'package:flutter_shoppingapp/model/movie.dart';

class ProductDetails extends StatelessWidget {
  final String movieName;
  final Movie movie;

  const ProductDetails({Key key, this.movieName, this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product Details"),
        backgroundColor: Colors.blueGrey.shade900,
      ),
    );
  }
}
