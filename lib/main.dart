import 'package:flutter/material.dart';
import 'package:flutter_shoppingapp/routes/Routes.dart';

import 'dashboard/dashboard.dart';
import 'dashboard/landingscreen.dart';
import 'dashboard/loginscreen.dart';

void main() async {
  runApp(MaterialApp(
    theme: ThemeData(
        primarySwatch: Colors.blue
    ),
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/': (context) => LandingScreen(),
      '/loginscreen': (context) => LoginScreen(),
      '/dashboard': (context) => UserDashboard(),
     /* '/HomePage': (context) => HomePage(),
      '/UserDashboard': (context) => UserDashboard(),
      '/Register': (context) => Register()*/
    },
  ));
}

// Creating main application widget
class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeDrawer(),
      routes: {
        Routes.primary: (context) => PrimaryScreen(),
        Routes.social: (context) => SocialScreen(),
        Routes.promotions: (context) => PromotionsScreen(),
      },
    );
  }

}

class HomeDrawer extends StatelessWidget {
  int _selectedIndex = 0;
  PageController _pageController = PageController();

  List<Widget> _screens = <Widget>[
    Center(child: Text('Second Page',style: TextStyle(fontSize: 20),)),
    Center(child: Text('Third  Page',style: TextStyle(fontSize: 20),)),
    Center(child: Text('Third  Page',style: TextStyle(fontSize: 20),)),
    Center(child: Text('Third  Page',style: TextStyle(fontSize: 20),))
  ];


  void _onItemTapped(int selectedIndex) {
    _pageController.jumpToPage(selectedIndex);
  }

  /*void _onPageChanged(int index){
    setState(() {
      _selectedIndex = index;
    });
  }
*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: _screens,
        //onPageChanged: _onPageChanged,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.deepOrangeAccent[100],
        onTap: _onItemTapped,
      ),
    );
  }
}


class MyNavigationBar extends StatefulWidget {
  MyNavigationBar ({Key key}) : super(key: key);

  @override
  _MyNavigationBarState createState() => _MyNavigationBarState();
}

class _MyNavigationBarState extends State<MyNavigationBar > {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    Text('About us', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('Product List', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('Contact Us', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('Special Discounts', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Flutter BottomNavigationBar Example'),
          backgroundColor: Colors.green
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label:'Reedem',
              //backgroundColor: Colors.green
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Products',
              //backgroundColor: Colors.yellow
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Offers',
              //backgroundColor: Colors.blue,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Special Discounts',
              //backgroundColor: Colors.blue,
            ),
          ],
          //type: BottomNavigationBarType.shifting,
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.black,
          iconSize: 40,
          onTap: _onItemTapped,
          elevation: 5
      ),
    );
  }
}

class PrimaryScreen extends StatelessWidget {

  static const String routeName = '/primary';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Primary"),
      ),
      drawer: HomeDrawer(),
      body: Center(child: Text("Primary"),),
    );
  }
}

class SocialScreen extends StatelessWidget {
  static const String routeName = '/social';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Social"),
      ),
      drawer: HomeDrawer(),
      body: Center(child: Text("Social"),),
    );
  }
}

class PromotionsScreen extends StatelessWidget {

  static const String routeName = '/promotions';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Promotiions"),
      ),
      drawer: HomeDrawer(),
      body: Center(child: Text("Promotiions"),),
    );
  }
}

