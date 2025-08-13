import 'package:flutter/material.dart';
import 'package:first_app/screens/appbar.dart';
import 'bottom_nav_bar.dart';

void main(List<String> args) {}

class floatingActionB extends StatelessWidget {
  const floatingActionB({super.key});

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
        title: Text("Things to learn(Floating Action Button)"),
        titleSpacing: 10,
        centerTitle: false,
        toolbarHeight: 60,
        toolbarOpacity: 1,
        elevation: 0,
        backgroundColor: Colors.blue,
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
                MaterialPageRoute(builder: (context) => const appbar()),
              );
            },
            icon: Icon(Icons.back_hand),
          ),
          IconButton(
            onPressed: () {
              MySnackBar("going to bottom navigation bar", context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const bottom_nav_bar()),
              );
            },
            icon: const Icon(Icons.next_plan),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 10,
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
        onPressed: () {
          MySnackBar("Floating Action Button Pressed", context);
        },
      ),
    );
  }
}
