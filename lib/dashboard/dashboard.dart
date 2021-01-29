import 'package:flutter/material.dart';
import 'package:flutter_shoppingapp/dashboard/discount.dart';
import 'package:flutter_shoppingapp/dashboard/loginpage.dart';
import 'package:flutter_shoppingapp/dashboard/products.dart';
import 'package:flutter_shoppingapp/dashboard/tenplusoneplan.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserDashboard extends StatefulWidget {
  @override
  _UserDashboardState createState() => _UserDashboardState();
}

class _UserDashboardState extends State<UserDashboard> {
  int  _selectedIndex = 0;
  PageController _pageController = PageController();
  List<Widget> _screens = <Widget>[
    //Center(child: Text('First Page',style: TextStyle(fontSize: 20),)),
    new ProductList(),
    new TenPlusOnePlan(),
    new Discount()
  ];

  SharedPreferences loginData;
  String username;

  void _onItemTapped(int selectedIndex) {
    _pageController.jumpToPage(selectedIndex);
  }

  void _onPageChanged(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();

    initial();
  }

  void initial() async{
    loginData = await SharedPreferences.getInstance();
    setState(() {
      username = loginData.getString('username');
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      drawer: _drawerHeader(context),
      appBar: AppBar(
        title: Text('Jewellery'),
      ),
      body: PageView(
        controller: _pageController,
        children: _screens,
        onPageChanged: _onPageChanged,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
         /* BottomNavigationBarItem(
            icon: Icon(Icons.grid_view),
            label: 'Products',
          ),*/
          BottomNavigationBarItem(
            icon: Icon(Icons.money),
            label: '10+1 Plan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.wallet_giftcard),
            label: 'Discounts',
          ),
        ],
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.deepOrangeAccent[100],
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: Theme.of(context).textTheme.bodyText1.merge(TextStyle(fontSize: 12,color: Colors.deepOrangeAccent[100])),
        unselectedLabelStyle: Theme.of(context).textTheme.button.merge(TextStyle(fontSize: 11,color: Colors.grey)),
        onTap: _onItemTapped,
        //elevation: 5,
      ),
    );
  }

  Widget _drawerHeader(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              child: Center(
                child: Column(
                  children: <Widget>[
                    Container(
                      width: 100,
                      height: 100,
                      margin: EdgeInsets.only(top: 30, bottom: 10),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue,
                        image: DecorationImage(
                            image: NetworkImage(
                                ""),
                            fit: BoxFit.cover),
                      ),
                    ),
                    Text(
                      "Hello $username,",
                      style: TextStyle(fontSize: 20, color: Colors.black87),
                    ),
                    Text(
                      "priti@gmail.com",
                      style: TextStyle(fontSize: 15, color: Colors.black87),
                    ),
                  ],
                ),
              ),
            ),
            _drawerList(),
          ],
        ),
      ),
    );
  }

  Widget _drawerList() {
    final item = [
      'Home',
      'Add Product',
      'My Wallet',
      'My GoldMine',
      'FAQs',
      'Contact Us',
      'About Us',
      'Logout'
    ];

    final drawerIcons = [
      Icons.home,
      Icons.wallet_giftcard_sharp,
      Icons.money,
      Icons.wallet_giftcard,
      Icons.question_answer,
      Icons.email,
      Icons.info,
      Icons.logout,
    ];
    return Expanded(
      child: Container(
          height: double.maxFinite,
          child: ListView.builder(
              itemCount: item == null ? 0 : item.length,
              itemBuilder: (BuildContext context, i) {
                return Column(
                  children: <Widget>[
                    ListTile(
                      title: new Text(
                        item[i],
                        style: TextStyle(color: Colors.grey, fontSize: 15),
                      ),
                      leading: Icon(
                        drawerIcons[i],
                        color: Colors.grey,
                      ),
                      trailing: Container(
                        height: 14,
                        width: 14,
                        decoration: BoxDecoration(
                          //color: Colors.red,
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                        ),
                      ),
                      onTap: (){
                         if(item[i] == 'Logout')
                           {
                             showDialog(
                               context: context,
                               barrierDismissible: false, // user must tap button!
                               builder: (BuildContext context) {
                                 return AlertDialog(
                                   title: Text('Logout'),
                                   content: SingleChildScrollView(
                                     child: ListBody(
                                       children: <Widget>[
                                         Text('Do you want to logout?'),
                                         //Text('Would you like to approve of this message?'),
                                       ],
                                     ),
                                   ),
                                   actions: <Widget>[
                                     TextButton(
                                       child: Text('Yes'),
                                       onPressed: () {
                                         Navigator.of(context).pop();
                                         loginData.setBool('login', true);
                                         Navigator.pushReplacement(context,
                                             new MaterialPageRoute(builder: (context) => LoginPage()));
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
                           }
                      },
                    ),
                    Divider(),
                  ],
                );
              })),
    );
  }
}


