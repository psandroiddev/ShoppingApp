import 'package:flutter/material.dart';
import 'package:flutter_shoppingapp/database/database_helper.dart';
import 'package:flutter_shoppingapp/model/productdata.dart';

class EditProduct extends StatefulWidget {
  final Product product;

  const EditProduct({Key key, this.product}) : super(key: key);

  @override
  _EditProductState createState() => _EditProductState(product);
}

class _EditProductState extends State<EditProduct> {

  // reference to our single class that manages the database
  var dbHelper;

  final nameTextController = TextEditingController();
  final descriptionTextController = TextEditingController();
  final priceTextController = TextEditingController();

  Product product;
  _EditProductState(this.product);

  @override
  void initState() {
    super.initState();

    dbHelper = DatabaseHelper.instance;

    if(product != null)
      {
       nameTextController.text = product.name;
       //descriptionTextController.text = product.name;
       priceTextController.text = product.price.toString();
      }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Product'),
      ),
      body: Column(
       children: <Widget>[
         Padding(
           padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
           child: TextField(
             controller: nameTextController,
             decoration: InputDecoration(
                 labelText: 'Product Name',
                 //labelStyle: textStyle,
                 border: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(5.0)
                 )
             ),
           ),
         ),
         Padding(
           padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
           child: TextField(
             controller: priceTextController,
             decoration: InputDecoration(
                 labelText: 'Product Price',
                 //labelStyle: textStyle,
                 border: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(5.0)
                 )
             ),
           ),
         ),
         Padding(
           padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
           child: RaisedButton(
             color: Theme.of(context).primaryColorDark,
             textColor: Theme.of(context).primaryColorLight,
             child: Text('Update'),
             onPressed: (){
               setState(() {
                 _update(product);
                 Navigator.pop(context);
               });
             },
           ),
         )
       ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    nameTextController.dispose();
    descriptionTextController.dispose();
    priceTextController.dispose();
  }

  void _update(Product product) async {
    //    .updateTodo(Todo(id: todo.id, title: title, content: content));
    /*var product = Product(id: i, name: 'Gold Neckwear and Earrings set$i', price: 10000+i,);

    await dbHelper.insert(
      product.toMap(),
    );*/

    var updatedProduct = Product(id: product.id, name: nameTextController.text, price: int.parse(priceTextController.text),);

    // row to update
    Map<String, dynamic> row = {
      DatabaseHelper.columnId   : 1,
      DatabaseHelper.columnName : 'Mary',
      DatabaseHelper.columnPrice  : 32
    };
    final rowsAffected = await dbHelper.update(updatedProduct.toMap());
    print('updated $rowsAffected row(s)');
  }
}
