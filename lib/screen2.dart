import 'package:flutter/material.dart';
import 'package:gsk_ui/screens/favourite_Screen.dart';
import 'package:gsk_ui/screens/home_screen.dart';
import 'package:gsk_ui/screens/profile_screen.dart';

class ScreenTest2 extends StatefulWidget {
  Function function;
  bool isDark;
  ScreenTest2(this.function, this.isDark);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ScreenTest2State();
  }
}

class ScreenTest2State extends State<ScreenTest2> {
  String content = 'Home Page';
  int index = 0;
  changeContentFromDrawer(int i) {
    index = i;
    if (i == 0) {
      content = 'Home';
    } else if (i == 1) {
      content = 'Favourite';
    } else {
      content = 'Profile';
    }
    setState(() {});
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom:const TabBar(
           
            tabs: [
            Tab( 
              child: Text('Home'),),
            Tab(
              child: Text('Favourite'),
            ),
            Tab(
              child: Text('Profile'),
            ),
          ]),
        ),
        body:TabBarView(
          children: [
          HomeScreen(),
          FavouriteScreen(),
          ProfileScreen()
        ],)
        
        //  Column(
        //   crossAxisAlignment: CrossAxisAlignment.stretch,
        //   children: [
        //     Container(
        //       margin: EdgeInsets.symmetric(horizontal: 10),
        //       child: Row(
        //         children: [
        //           Text(widget.isDark ? 'ON' : 'OFF'),
        //           const Spacer(),
        //           Switch(
        //               value: widget.isDark,
        //               onChanged: (value) {
        //                 widget.function(value);
        //               })
        //         ],
        //       ),
        //     ),
        //     Spacer(),
        //     Text(
        //       content,
        //       textAlign: TextAlign.center,
        //     ),
        //     Spacer(),
        //   ],
        // ),

        ,drawer: Drawer(
          child: Column(
            children: [
              const UserAccountsDrawerHeader(
                  currentAccountPicture: CircleAvatar(
                    child: Text('O'),
                  ),
                  accountName: Text('Omar'),
                  accountEmail: Text('omar@gmail.com')),
              ListTile(
                leading: const Icon(Icons.home),
                trailing: const Icon(Icons.arrow_forward_ios),
                subtitle: const Text('Go to home'),
                title: const Text('Home'),
                onTap: () {
                  changeContentFromDrawer(0);
                },
              ),
              ListTile(
                leading: const Icon(Icons.favorite),
                trailing: const Icon(Icons.arrow_forward_ios),
                subtitle: const Text('Wishlist prodcuts'),
                title: const Text('Favourite'),
                onTap: () {
                  changeContentFromDrawer(1);
                },
              ),
              ListTile(
                leading: const Icon(Icons.perm_identity),
                trailing: const Icon(Icons.arrow_forward_ios),
                subtitle: const Text('Explore Profile'),
                title: const Text('Profile'),
                onTap: () {
                  changeContentFromDrawer(2);
                },
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
            onTap: (i) {
              index = i;
              if (i == 0) {
                content = 'Home';
              } else if (i == 1) {
                content = 'Favourite';
              } else {
                content = 'Profile';
              }
              setState(() {});
            },
            currentIndex: index,
            items: const [
              BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.home)),
              BottomNavigationBarItem(
                  label: 'Favourite', icon: Icon(Icons.favorite)),
              BottomNavigationBarItem(
                  label: 'Profile', icon: Icon(Icons.perm_identity))
            ]),
      ),
    );
  }
}
