import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gsk_ui/instegram/instegram_feed.dart';
import 'package:gsk_ui/my_first_ui.dart';

void main() {
  runApp(
    MaterialApp(home: ScreenTest2()),
  );
}

class ScreenTest2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ScreenTest2State();
  }
}

class ScreenTest2State extends State<ScreenTest2> {
  String content = 'Home Page';
  int index = 0;
  bool isDark = false;
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
    return  Scaffold(
        appBar: AppBar(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SwitchListTile(
              value: isDark,
              onChanged: (value) {
                isDark = value;
                setState(() {});
              },
              title: Text(isDark ? 'ON' : 'OFF'),
            ),
            Spacer(),
            Text(
              content,
              textAlign: TextAlign.center,
            ),
            Spacer(),
          ],
        ),
        drawer: Drawer(
          child: Column(
            children:  [
             const  UserAccountsDrawerHeader(
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
    
    );
  }
}

class ScreenTest extends StatelessWidget {
  String content = 'hello world';
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            content,
            textAlign: TextAlign.center,
          ),
          ElevatedButton(
              onPressed: () {
                this.content = 'Hello World';
              },
              child: Text('change content'))
        ],
      ),
    );
  }
}

class ResponsiveScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    log(MediaQuery.of(context).size.height.toString());
    // TODO: implement build
    return Scaffold(
        drawer: Drawer(
          child: Column(
            children: const [
              UserAccountsDrawerHeader(
                  currentAccountPicture: CircleAvatar(
                    child: Text('O'),
                  ),
                  accountName: Text('Omar'),
                  accountEmail: Text('omar@gmail.com')),
              ListTile(
                leading: Icon(Icons.home),
                trailing: Icon(Icons.arrow_forward_ios),
                subtitle: Text('Go to home'),
                title: Text('Home'),
              ),
              ListTile(
                leading: Icon(Icons.favorite),
                trailing: Icon(Icons.arrow_forward_ios),
                subtitle: Text('Wishlist prodcuts'),
                title: Text('Favourite'),
              ),
              ListTile(
                leading: Icon(Icons.perm_identity),
                trailing: Icon(Icons.arrow_forward_ios),
                subtitle: Text('Explore Profile'),
                title: Text('Profile'),
              ),
            ],
          ),
        ),
        appBar: AppBar(),
        body: Container(
          height: MediaQuery.of(context).size.height / 9,
          width: 300,
          color: Colors.red,
        ));
  }
}
