import 'package:first_app/screens/dynamic_GridView.dart';
import 'package:first_app/screens/tabBar.dart';
import 'package:flutter/material.dart';

class cardss extends StatelessWidget {
  const cardss({super.key});
  void mySnackBar(String message, BuildContext context) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("things to learn (Card)"),
        titleSpacing: 10,
        centerTitle: false,
        toolbarHeight: 60,
        toolbarOpacity: 1,
        elevation: 0,
        backgroundColor: Colors.green,
        actions: [
          IconButton(
            onPressed: () {
              mySnackBar("going to previous page", context);
              // If intent is to go back, prefer Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const GridViewPage()),
              );
            },
            icon: const Icon(Icons.arrow_back_ios_new_outlined),
          ),
          IconButton(
            onPressed: () {
              mySnackBar("this is next page loading", context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const tabBar()),
              );
            },
            icon: const Icon(Icons.next_plan),
          ),
        ],
      ),

      body: Center(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          shadowColor: Color.fromRGBO(33, 191, 115, 1),
          color: Color.fromRGBO(33, 191, 115, 1),
          elevation: 80,
          child: SizedBox(
            height: 200,
            width: 200,
            child: Center(child: Text("this is card")),
          ),
        ),
      ),
    );
  }
}
