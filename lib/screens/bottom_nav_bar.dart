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
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
