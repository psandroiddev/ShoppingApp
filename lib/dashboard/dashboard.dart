import 'package:flutter/material.dart';

class UserDashboard extends StatefulWidget {
  @override
  _UserDashboardState createState() => _UserDashboardState();
}

class _UserDashboardState extends State<UserDashboard> {
  int  _selectedIndex = 0;
  PageController _pageController = PageController();
  List<Widget> _screens = <Widget>[
    Center(child: Text('First Page',style: TextStyle(fontSize: 20),)),
    Center(child: Text('Second  Page',style: TextStyle(fontSize: 20),)),
    Center(child: Text('Third  Page',style: TextStyle(fontSize: 20),)),
    Center(child: Text('Four  Page',style: TextStyle(fontSize: 20),))
  ];

  void _onItemTapped(int selectedIndex) {
    _pageController.jumpToPage(selectedIndex);
  }

  void _onPageChanged(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      drawer: _drawerHeader(context),
      appBar: AppBar(
        title: Text('Jwellery'),
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
          BottomNavigationBarItem(
            icon: Icon(Icons.wallet_giftcard),
            label: 'Offers',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.money),
            label: '10+1 Plan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.monetization_on),
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
                      "Hello Priti,",
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
      'Products',
      'My Wallet',
      'My GoldMine',
      'FAQs',
      'Contact Us',
      'About Us',
      'Logout'
    ];

    final drawerIcons = [
      Icons.home,
      Icons.ac_unit,
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
                    ),
                    Divider(),
                  ],
                );
              })),
    );
  }
}


