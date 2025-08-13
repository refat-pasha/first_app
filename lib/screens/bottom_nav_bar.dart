import 'package:flutter/material.dart';

void main(List<String> args) {}

class bottom_nav_bar extends StatelessWidget {
  const bottom_nav_bar({super.key});

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
        title: Text("Things to learn(bottom navigation bar)"),
        titleSpacing: 10,
        centerTitle: false,
        toolbarHeight: 60,
        toolbarOpacity: 1,
        elevation: 0,
        backgroundColor: Colors.indigo,
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
              MySnackBar("this is setting", context);
            },
            icon: Icon(Icons.settings),
          ),
          IconButton(
            onPressed: () {
              MySnackBar("this is person", context);
            },
            icon: Icon(Icons.person),
          ),
          IconButton(
            onPressed: () {
              MySnackBar("this is next page loading", context);
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
          } 
          else if (index == 1) {
            MySnackBar("Search tapped", context);
          } 
          else if (index == 2) {
            MySnackBar("Notifications tapped", context);
          } 
          else if (index == 3) {
            MySnackBar("Profile tapped", context);
          }
        },
      ),
    );
  }
}
