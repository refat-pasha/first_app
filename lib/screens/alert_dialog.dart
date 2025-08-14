import 'package:first_app/screens/buttons.dart';
import 'package:first_app/screens/simple_form.dart';
import 'package:flutter/material.dart';

class alart_dialog extends StatelessWidget {
  const alart_dialog({super.key});

  MyAlertDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Alert!"),
          content: Text("This is an alert dialog example."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // close the dialog
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }

  NextPageAlartDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Next Page Alert!"),
          content: Text("This will take you to the next page."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // close the dialog
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const simple_form()),
                );
              },
              child: Text("Go to Next Page"),
            ),
          ],
        );
      },
    );
  }

  MySnackBar(String message, BuildContext context) {
    return ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Things to learn(Alert Dialog)"),
        titleSpacing: 10,
        centerTitle: false,
        toolbarHeight: 60,
        toolbarOpacity: 1,
        elevation: 0,
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            onPressed: () {
              MyAlertDialog(context);
            },
            icon: Icon(Icons.add_alert_outlined),
          ),
          IconButton(
            onPressed: () {
              MySnackBar("going to previous page", context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const buttons()),
              );
            },
            icon: Icon(Icons.arrow_back_ios_new_outlined),
          ),
          IconButton(
            onPressed: () {
              MySnackBar("this is next page loading", context);
              NextPageAlartDialog(context);
            },
            icon: Icon(Icons.next_plan),
          ),
        ],
      ),
      body: Center(
        child: OutlinedButton(
          onPressed: () {
            MyAlertDialog(context);
          },
          child: Text("alart dialog"),
        ),
      ),
    );
  }
}
