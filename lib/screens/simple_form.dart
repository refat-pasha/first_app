import 'package:first_app/screens/alert_dialog.dart';
import 'package:first_app/screens/dynamic_ListView.dart';
import 'package:flutter/material.dart';

class simple_form extends StatelessWidget {
  const simple_form({super.key});
  MySnackBar(String message, BuildContext context) {
    return ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    ButtonStyle buttonStyle = ElevatedButton.styleFrom(
      minimumSize: Size(
        double.infinity,
        60,
      ), // Set the width to fill the parent
      backgroundColor: Colors.blue,
      foregroundColor: Colors.white, // Set the background color
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10), // Rounded corners
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("things to learn(simple form)"),
        titleSpacing: 10,
        centerTitle: false,
        toolbarHeight: 60,
        toolbarOpacity: 1,
        elevation: 0,
        backgroundColor: Colors.green,
        actions: [
          IconButton(
            onPressed: () {
              MySnackBar("going to previous page", context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const alart_dialog()),
              );
            },
            icon: Icon(Icons.arrow_back_ios_new_outlined),
          ),
          IconButton(
            onPressed: () {
              MySnackBar("this is next page loading", context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ListViewPage()),
              );
            },
            icon: Icon(Icons.next_plan),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "First Name",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Last Name",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Email Name",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                MySnackBar("submit button pressed", context);
              },
              child: Text("submit"),
              style: buttonStyle,
            ),
          ),
        ],
      ),
    );
  }
}
