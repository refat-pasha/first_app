import 'package:first_app/screens/alert_dialog.dart';
import 'package:first_app/screens/appbar.dart';
import 'package:first_app/screens/body_row_column.dart';
import 'package:first_app/screens/bottom_nav_bar.dart';
import 'package:first_app/screens/buttons.dart';
import 'package:first_app/screens/card.dart';
import 'package:first_app/screens/dynamic_ListView.dart';
import 'package:first_app/screens/dynamic_GridView.dart';
import 'package:first_app/screens/floating_action_button.dart';
import 'package:first_app/screens/navigation_drawer.dart';
import 'package:first_app/screens/navigation_end_drawer.dart';
import 'package:first_app/screens/simple_form.dart';
import 'package:flutter/material.dart';

class tabBar extends StatelessWidget {
  const tabBar({super.key});
  void mySnackBar(String message, BuildContext context) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 12,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("things to learn (Tab Bar)"),
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
                mySnackBar("there is no page further", context);
              },
              icon: const Icon(Icons.back_hand_outlined),
            ),
          ],
          bottom: TabBar(
            isScrollable: true,
            tabs: [
              Tab(icon: Icon(Icons.menu_open), text: "appbar"), // appbar()
              Tab(
                icon: Icon(Icons.add_circle),
                text: "floatingActionB",
              ), // floatingActionB()
              Tab(
                icon: Icon(Icons.space_bar),
                text: "bottom_nav_bar",
              ), // bottom_nav_bar()
              Tab(
                icon: Icon(Icons.menu),
                text: "navigation_drawer",
              ), // navigation_drawer()
              Tab(
                icon: Icon(Icons.menu_open),
                text: "navigation_end_drawer",
              ), // navigation_end_drawer()
              Tab(icon: Icon(Icons.view_week), text: "body_row"), // body_row()
              Tab(
                icon: Icon(Icons.radio_button_checked),
                text: "buttons",
              ), // buttons()
              Tab(
                icon: Icon(Icons.warning_amber),
                text: "alart_dialog",
              ), // alart_dialog()
              Tab(
                icon: Icon(Icons.description),
                text: "simple_form",
              ), // simple_form()
              Tab(
                icon: Icon(Icons.view_list),
                text: "ListViewPage",
              ), // ListViewPage()
              Tab(
                icon: Icon(Icons.grid_view),
                text: "GridViewPage",
              ), // GridViewPage()
              Tab(
                icon: Icon(Icons.card_travel_sharp),
                text: "cardssss",
              ), // GridViewPage()
            ],
          ),
        ),
        body: TabBarView(
          children: [
            appbar(),
            floatingActionB(),
            bottom_nav_bar(),
            navigation_drawer(),
            navigation_end_drawer(),
            body_row(),
            buttons(),
            alart_dialog(),
            simple_form(),
            ListViewPage(),
            GridViewPage(),
            cardss(),
          ],
        ),
      ),
    );
  }
}
