import 'package:flutter/material.dart';
import 'package:flutter_shoppingapp/dashboard/productdetails.dart';
import 'package:flutter_shoppingapp/model/movie.dart';

class ProductsList extends StatelessWidget {
  final List<Movie> movieList = Movie.getMovies();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade200,
      body: ListView.builder(
        itemCount: movieList.length,
        itemBuilder: (BuildContext context,int index){
          return Stack(
              children: <Widget>[
                Positioned(
                    top: 10.0,
                    child: movieImage(movieList[index].Images[0])),
                productCard(movieList[index], context)
              ]);
        },),
    );
  }

  Widget productCard(Movie movie,BuildContext context)
  {
    return InkWell(
      child: Container(
        margin: EdgeInsets.only(left: 60),
        width: MediaQuery.of(context).size.width,
        height: 155.0,
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
                        child: Text(movie.Title, style: TextStyle(
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
                        child: Text(" Enameled and oxidised gold plated,"
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
                      Flexible(child: Text("Edit", style: mainTextStyle())),
                      Flexible(child: Text("Delete", style: mainTextStyle()))
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
            builder: (context) => ProductDetails(movieName:movie.Title,
                movie: movie )))
      },
    );
  }

  TextStyle mainTextStyle(){
    return TextStyle(
        fontSize: 15.0,
        color: Colors.grey
    );
  }

  Widget movieImage(String imageUrl){
    return Container(
      //image: Image.asset('assests/images/jewellery.jpg'),
      width: 70,
      height: 70,
      /*decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
              image: NetworkImage(imageUrl ??  Icon(Icons.photo)),
              fit: BoxFit.cover
          )
      ),*/
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
              image: NetworkImage("https://www.vaibhavjewellers.com/blog/wp-content/uploads/2020/05/123g1600-1Stone-work-jewellery-choker-this-is-already-given-i-want-other-image-500x334-1.jpg"),
              fit: BoxFit.cover
          )
      ),
    );
  }
}
