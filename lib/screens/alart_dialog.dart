import 'package:flutter/material.dart';

class alart_dialog extends StatelessWidget{
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alert Dialog"),
      ),
      body: Center(
        child: OutlinedButton(onPressed: (){}, child: Text("alart dialog")),
      ),
    );
  }
}