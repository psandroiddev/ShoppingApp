import 'package:flutter/material.dart';
import 'package:flutter_shoppingapp/dashboard/editproduct.dart';
import 'package:flutter_shoppingapp/dashboard/productdetails.dart';
import 'package:flutter_shoppingapp/database/database_helper.dart';
import 'package:flutter_shoppingapp/model/movie.dart';
import 'package:flutter_shoppingapp/model/productdata.dart';
import 'package:sqflite/sqflite.dart';

class ProductList  extends StatefulWidget {
  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  // reference to our single class that manages the database
  var dbHelper;

  final List<Movie> movieList = Movie.getMovies();
  List<Product> productList = [];

  @override
  void initState() {
    super.initState();
    dbHelper = DatabaseHelper.instance;
    //productList = [];
    _insert();
    _query();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade200,
      body: ListView.builder(
        itemCount: productList.length,
        itemBuilder: (BuildContext context,int index){
          return Stack(
              children: <Widget>[
                Positioned(
                    top: 10.0,
                    child: movieImage()),
                productCard(productList[index], context)
              ]);
        },),
    );
  }

  Widget productCard(Product product,BuildContext context)
  {
    return InkWell(
      child: Container(
        margin: EdgeInsets.only(left: 60),
        width: MediaQuery.of(context).size.width,
        height: 165.0,
        child: Card(
          color: Colors.black45,
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0,
                bottom: 8.0,
                left: 20.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Flexible(
                        child: Text(product.name, style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 17.0,
                            color: Colors.white
                        ),),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Flexible(
                        child: Text("Enameled and oxidised gold plated,"
                            "embellished and can be paired with causal and formal ethnic attire.", style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.white
                        ),),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Flexible(child: FlatButton(
                          child: Text("Edit", style: mainTextStyle()),
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => EditProduct(product: product)));
                        },
                      )),
                      Flexible(child: FlatButton(
                          child: Text("Delete", style: mainTextStyle()),
                        onPressed: (){
                          showDialog(
                            context: context,
                            barrierDismissible: false, // user must tap button!
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Delete'),
                                content: SingleChildScrollView(
                                  child: ListBody(
                                    children: <Widget>[
                                      Text('Do you want to delete this product?'),
                                      //Text('Would you like to approve of this message?'),
                                    ],
                                  ),
                                ),
                                actions: <Widget>[
                                  TextButton(
                                    child: Text('Yes'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                      _delete(product.id);
                                    },
                                  ),
                                  TextButton(
                                    child: Text('Cancel'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      ))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      onTap: () => {
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => ProductDetails(productName:product.name,
                product: product )))
      },
    );
  }

  TextStyle mainTextStyle(){
    return TextStyle(
        fontSize: 15.0,
        color: Colors.grey
    );
  }

  Widget movieImage(){
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
              image: NetworkImage("https://www.vaibhavjewellers.com/blog/wp-content/uploads/2020/05/123g1600-1Stone-work-jewellery-choker-this-is-already-given-i-want-other-image-500x334-1.jpg"),
              fit: BoxFit.cover
          )
      ),
    );
  }

  void _insert() async {
    // row to insert
    //var fido = Product(id: 1, name: 'Gold Neckwear and Earrings set', price: 35,);
    /*list = [];
for (int i = 0; i < 10; i++)
    list.add(ListItem<String>("item $i"));*/
    for (int i = 1; i < 10; i++)
      {
        var product = Product(id: i, name: 'Gold Neckwear and Earrings set$i', price: 10000+i,);

        await dbHelper.insert(
          product.toMap(),
        );
        //final id = await dbHelper.insert(row);
        print('inserted row id: ${product.id}');
      }
      //productList.add(Product(id: i, name: 'Gold Neckwear and Earrings set', price: 10000 + i,));

    final List<Map<String, dynamic>> listOfColumns = [
      {DatabaseHelper.columnName: "Gold Neckwear and Earrings set", DatabaseHelper.columnPrice: 10000},
      {DatabaseHelper.columnName: "Gold Neckwear and Earrings set", DatabaseHelper.columnPrice: 10000},
      {DatabaseHelper.columnName: "Gold Neckwear and Earrings set", DatabaseHelper.columnPrice: 20000}
    ];

  }

  void _query() async {
    final allRows = await dbHelper.queryAllRows();

    //productList.add(allRows);
 setState(() {
   List.generate(allRows.length, (i) {
     return productList.add(Product(
       id: allRows[i]['_id'],
       name: allRows[i]['name'],
       price: allRows[i]['price'],)
     );
   });
 });
    // Convert the List<Map<String, dynamic> into a List<Product>.
    print('query all rows: ${productList.length}');
    allRows.forEach((row) => print(row));
  }

  void _delete(int productId) async {
    // Assuming that the number of rows is the id for the last row.
    final id = await dbHelper.queryRowCount();

    print('all rows before delete: ${productList.length} $productId');

    final rowsDeleted = await dbHelper.delete(productId);
    print('deleted $rowsDeleted row(s): row $productId');
    print('all rows after delete: ${productList.length} $id');
  }
}




