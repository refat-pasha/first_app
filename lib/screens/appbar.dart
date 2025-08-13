import 'package:flutter/material.dart';
import 'floating_action_button.dart';

void main(List<String> args) {}

class appbar extends StatelessWidget {
  const appbar({super.key});

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
        title: Text("Things to learn(appbar)"),
        titleSpacing: 10,
        centerTitle: false,
        toolbarHeight: 60,
        toolbarOpacity: 1,
        elevation: 0,
        backgroundColor: Colors.green,
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
              MySnackBar("going to floating action page", context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const floatingActionB(),
                ),
              );
            },
            icon: const Icon(Icons.next_plan),
          ),
        ],
      ),
      body: Container(
        // height: 250,
        // width: 250,
        margin: EdgeInsets.all(20),
        padding: EdgeInsets.all(20),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.green,
          border: Border.all(color: Colors.black, width: 2),
        ),
        child: Text(
          "This is appbar page",
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
      ),
    );
  }
}
