import 'package:flutter/material.dart';
import 'navigation_end_drawer.dart';

void main(List<String> args) {}

class body_row extends StatelessWidget {
  const body_row({super.key});

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
        title: Text("Things to learn(Row,container,column)"),
        titleSpacing: 10,
        centerTitle: false,
        toolbarHeight: 60,
        toolbarOpacity: 1,
        elevation: 0,
        backgroundColor: Colors.purple,
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
                MaterialPageRoute(
                  builder: (context) => const navigation_end_drawer(),
                ),
              );
            },
            icon: Icon(Icons.back_hand),
          ),
          IconButton(
            onPressed: () {
              MySnackBar("this is next page loading", context);
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
        backgroundColor: Colors.indigo,
        onPressed: () {
          MySnackBar("Floating Action Button Pressed", context);
        },
        child: Icon(Icons.add),
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
      endDrawer: Drawer(
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
                Navigator.pop(context);
                MySnackBar("Home", context);
              },
            ),
            ListTile(
              title: Text("contact"),
              leading: Icon(Icons.contacts),
              onTap: () {
                Navigator.pop(context);
                MySnackBar("contacts", context);
              },
            ),
            ListTile(
              title: Text("profile"),
              leading: Icon(Icons.person),
              onTap: () {
                Navigator.pop(context);
                MySnackBar("person", context);
              },
            ),
            ListTile(
              title: Text("settings"),
              leading: Icon(Icons.settings),
              onTap: () {
                Navigator.pop(context);
                MySnackBar("settings", context);
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              alignment: Alignment.topLeft,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black),
              ),
              height: 100,

              width: 100,
              child: Text(
                "this is a body and it contains row and container top of the other two row container(demo)",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(width: 20),
                Container(
                  // margin: EdgeInsets.all(20),
                  alignment: Alignment.center,

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.brown,
                    border: Border.all(color: Colors.black),
                  ),
                  height: 100,
                  width: 100,

                  child: Text(
                    "this is a body and it contains row and container1(demo)",

                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  ),
                ),
                SizedBox(width: 20),
                Container(
                  // margin: EdgeInsets.all(20),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.purple,
                    border: Border.all(color: Colors.black),
                  ),
                  height: 100,
                  width: 100,
                  child: Text(
                    "this is a body and it contains row and container2(demo)",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  ),
                ),
                SizedBox(width: 20),

                Column(
                  children: [
                    Text("this is a column inside a row"),
                    Image.asset(
                      'assets/images/luffy.png',
                      height: 100,
                      width: 100,
                    ),
                    Image.asset(
                      'assets/images/luffy2.png',
                      height: 100,
                      width: 100,
                    ),

                    Image.asset(
                      'assets/images/luffy3.png',
                      height: 100,
                      width: 100,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
