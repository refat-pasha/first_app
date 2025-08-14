import 'package:first_app/screens/alert_dialog.dart';
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
                MaterialPageRoute(builder: (context) => const alart_dialog()),
              );
            },
            icon: Icon(Icons.next_plan),
          ),
        ],
      ),
    );
  }
}
