import 'package:flutter/material.dart';
import 'package:flutter_shoppingapp/model/productdata.dart';

class ProductDetails extends StatelessWidget {
  final String productName;
  final Product product;

  const ProductDetails({Key key, this.productName, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product Details"),
        backgroundColor: Colors.blueGrey.shade900,
      ),
      body: ListView(
      children: <Widget>[
        ProductDetailsThumbnail(productThumbnail: "https://www.vaibhavjewellers.com/blog/wp-content/uploads/2020/05/123g1600-1Stone-work-jewellery-choker-this-is-already-given-i-want-other-image-500x334-1.jpg"),
        ProductDetailsHeader(product: product,)
      ],
      ),
    );
  }
}

class ProductDetailsThumbnail extends StatelessWidget {
  final String productThumbnail;

  const ProductDetailsThumbnail({Key key, this.productThumbnail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: 190,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(productThumbnail),
                      fit: BoxFit.cover
                  )
              ),
            ),
           /* Icon(Icons.play_circle_outline,size: 100,
              color: Colors.white,)*/
          ],
        ),
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [Color(0x00f5f5f5),Color(0xfff5f5f5)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter
              )
          ),
          height: 80,
        ),
      ],
    );
  }
}

class ProductDetailsHeader extends StatelessWidget {

  final Product product;

  const ProductDetailsHeader({Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("${product.name}",
            style: TextStyle(
                fontWeight: FontWeight.w400,
                color: Colors.black87,
                fontSize: 19
            ),),
          Text("Rs.${product.price}",
            style: TextStyle(
                fontWeight: FontWeight.w400,
                color: Colors.black87,
                fontSize: 19
            ),),
         Text("Enameled and oxidised gold plated,"
             "embellished and can be paired with causal and formal ethnic attire.",style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 16
            ),),
          /*Text.rich(TextSpan(style:
          TextStyle(
              fontSize: 12, fontWeight: FontWeight.w300
          ),children: <TextSpan>[
            TextSpan(
                text: movie.Plot
            ),
            TextSpan(
                text: "More...",
                style: TextStyle(color: Colors.indigoAccent)
            )
          ]
          ))*/
        ],
      ),
    );
  }
}

