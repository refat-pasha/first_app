import 'package:flutter/material.dart';
import 'bottom_nav_bar.dart';
import 'navigation_end_drawer.dart';

void main(List<String> args) {}

class navigation_drawer extends StatelessWidget {
  const navigation_drawer({super.key});

  // Function to show a SnackBar message
  MySnackBar(String message, BuildContext context) {
    return ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Things to learn(navigation drawer)"),
        titleSpacing: 10,
        centerTitle: false,
        toolbarHeight: 60,
        toolbarOpacity: 1,
        elevation: 0,
        backgroundColor: Colors.lime,
        actions: [
          IconButton(
            onPressed: () {
              MySnackBar("this is message", context);
            },
            icon: Icon(Icons.comment),
          ),
          IconButton(
            onPressed: () {
              MySnackBar("this is search", context);
            },
            icon: Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {
              MySnackBar("this is person", context);
            },
            icon: Icon(Icons.person),
          ),
          IconButton(
            onPressed: () {
              MySnackBar("going back to previous pages", context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const bottom_nav_bar()),
              );
            },
            icon: Icon(Icons.back_hand),
          ),
          IconButton(
            onPressed: () {
              MySnackBar("going to navigation end drawer", context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const navigation_end_drawer(),
                ),
              );
            },
            icon: Icon(Icons.next_plan),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 10,
        child: Icon(Icons.add),
        backgroundColor: Colors.indigo,
        onPressed: () {
          MySnackBar("Floating Action Button Pressed", context);
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.indigo,
        currentIndex: 0, // make this stateful to update on tap
        selectedItemColor: Colors.amber, // color for selected icon/label
        unselectedItemColor:
            Colors.white70, // color for unselected icons/labels
        showUnselectedLabels: true, // optional
        type:
            BottomNavigationBarType
                .fixed, // keeps all items visible and colored
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        onTap: (int index) {
          ;
          if (index == 0) {
            MySnackBar("Home tapped", context);
          } else if (index == 1) {
            MySnackBar("Search tapped", context);
          } else if (index == 2) {
            MySnackBar("Notifications tapped", context);
          } else if (index == 3) {
            MySnackBar("Profile tapped", context);
          }
        },
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              padding: EdgeInsets.all(0),
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.indigo),
                accountName: Text(
                  "refat",
                  style: TextStyle(color: Colors.black),
                ),
                accountEmail: Text(
                  "refat@gmail.com",
                  style: TextStyle(color: Colors.black),
                ),
                //currentAccountPicture: Image.network("https://www.pngfind.com/pngs/m/75-751525_luffy-roronoa-zoro-monkey-d-luffy-one-piece.png",),
              ),
            ),
            ListTile(
              title: Text("home"),
              leading: Icon(Icons.home),
              onTap: () {
                MySnackBar("Home", context);
              },
            ),
            ListTile(
              title: Text("contact"),
              leading: Icon(Icons.contacts),
              onTap: () {
                MySnackBar("contacts", context);
              },
            ),
            ListTile(
              title: Text("profile"),
              leading: Icon(Icons.person),
              onTap: () {
                MySnackBar("person", context);
              },
            ),
            ListTile(
              title: Text("settings"),
              leading: Icon(Icons.settings),
              onTap: () {
                MySnackBar("settings", context);
              },
            ),
          ],
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.lime,
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          "this is navigation drawer page",
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
      ),
    );
  }
}
