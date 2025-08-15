import 'package:first_app/screens/card.dart';
import 'package:first_app/screens/dynamic_ListView.dart';
import 'package:first_app/screens/simple_form.dart';
import 'package:first_app/screens/tabBar.dart';
import 'package:flutter/material.dart';

class GridViewPage extends StatelessWidget {
  const GridViewPage({super.key});

  void mySnackBar(String message, BuildContext context) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  final List<Map<String, String>> myItems = const [
    {
      "img": "assets/images/luffy.png",
      "title": "Monkey D. Luffy",
      "subtitle": "Captain of the Straw Hat Pirates",
    },
    {
      "img": "assets/images/luffy2.png",
      "title": "Monkey D. Luffy",
      "subtitle": "Captain of the Straw Hat Pirates",
    },
    {
      "img": "assets/images/luffy3.png",
      "title": "Monkey D. Luffy",
      "subtitle": "Captain of the Straw Hat Pirates",
    },
    {
      "img": "assets/images/dragon.png",
      "title": "Monkey D. Dragon",
      "subtitle": "Leader of the Revolutionary Army",
    },
    {
      "img": "assets/images/luffy.png",
      "title": "Monkey D. Luffy",
      "subtitle": "Captain of the Straw Hat Pirates",
    },
    {
      "img": "assets/images/luffy2.png",
      "title": "Monkey D. Luffy",
      "subtitle": "Captain of the Straw Hat Pirates",
    },
    {
      "img": "assets/images/luffy3.png",
      "title": "Monkey D. Luffy",
      "subtitle": "Captain of the Straw Hat Pirates",
    },
    {
      "img": "assets/images/dragon.png",
      "title": "Monkey D. Dragon",
      "subtitle": "Leader of the Revolutionary Army",
    },
    {
      "img": "assets/images/luffy.png",
      "title": "Monkey D. Luffy",
      "subtitle": "Captain of the Straw Hat Pirates",
    },
    {
      "img": "assets/images/luffy2.png",
      "title": "Monkey D. Luffy",
      "subtitle": "Captain of the Straw Hat Pirates",
    },
    {
      "img": "assets/images/luffy3.png",
      "title": "Monkey D. Luffy",
      "subtitle": "Captain of the Straw Hat Pirates",
    },
    {
      "img": "assets/images/dragon.png",
      "title": "Monkey D. Dragon",
      "subtitle": "Leader of the Revolutionary Army",
    },
    {
      "img": "assets/images/luffy.png",
      "title": "Monkey D. Luffy",
      "subtitle": "Captain of the Straw Hat Pirates",
    },
    {
      "img": "assets/images/luffy2.png",
      "title": "Monkey D. Luffy",
      "subtitle": "Captain of the Straw Hat Pirates",
    },
    {
      "img": "assets/images/luffy3.png",
      "title": "Monkey D. Luffy",
      "subtitle": "Captain of the Straw Hat Pirates",
    },
    {
      "img": "assets/images/dragon.png",
      "title": "Monkey D. Dragon",
      "subtitle": "Leader of the Revolutionary Army",
    },
    {
      "img": "assets/images/luffy.png",
      "title": "Monkey D. Luffy",
      "subtitle": "Captain of the Straw Hat Pirates",
    },
    {
      "img": "assets/images/luffy2.png",
      "title": "Monkey D. Luffy",
      "subtitle": "Captain of the Straw Hat Pirates",
    },
    {
      "img": "assets/images/luffy3.png",
      "title": "Monkey D. Luffy",
      "subtitle": "Captain of the Straw Hat Pirates",
    },
    {
      "img": "assets/images/dragon.png",
      "title": "Monkey D. Dragon",
      "subtitle": "Leader of the Revolutionary Army",
    },
    {
      "img": "assets/images/luffy.png",
      "title": "Monkey D. Luffy",
      "subtitle": "Captain of the Straw Hat Pirates",
    },
    {
      "img": "assets/images/luffy2.png",
      "title": "Monkey D. Luffy",
      "subtitle": "Captain of the Straw Hat Pirates",
    },
    {
      "img": "assets/images/luffy3.png",
      "title": "Monkey D. Luffy",
      "subtitle": "Captain of the Straw Hat Pirates",
    },
    {
      "img": "assets/images/dragon.png",
      "title": "Monkey D. Dragon",
      "subtitle": "Leader of the Revolutionary Army",
    },
    {
      "img": "assets/images/luffy.png",
      "title": "Monkey D. Luffy",
      "subtitle": "Captain of the Straw Hat Pirates",
    },
    {
      "img": "assets/images/luffy2.png",
      "title": "Monkey D. Luffy",
      "subtitle": "Captain of the Straw Hat Pirates",
    },
    {
      "img": "assets/images/luffy3.png",
      "title": "Monkey D. Luffy",
      "subtitle": "Captain of the Straw Hat Pirates",
    },
    {
      "img": "assets/images/dragon.png",
      "title": "Monkey D. Dragon",
      "subtitle": "Leader of the Revolutionary Army",
    },
    {
      "img": "assets/images/luffy.png",
      "title": "Monkey D. Luffy",
      "subtitle": "Captain of the Straw Hat Pirates",
    },
    {
      "img": "assets/images/luffy2.png",
      "title": "Monkey D. Luffy",
      "subtitle": "Captain of the Straw Hat Pirates",
    },
    {
      "img": "assets/images/luffy3.png",
      "title": "Monkey D. Luffy",
      "subtitle": "Captain of the Straw Hat Pirates",
    },
    {
      "img": "assets/images/dragon.png",
      "title": "Monkey D. Dragon",
      "subtitle": "Leader of the Revolutionary Army",
    },
    {
      "img": "assets/images/luffy.png",
      "title": "Monkey D. Luffy",
      "subtitle": "Captain of the Straw Hat Pirates",
    },
    {
      "img": "assets/images/luffy2.png",
      "title": "Monkey D. Luffy",
      "subtitle": "Captain of the Straw Hat Pirates",
    },
    {
      "img": "assets/images/luffy3.png",
      "title": "Monkey D. Luffy",
      "subtitle": "Captain of the Straw Hat Pirates",
    },
    {
      "img": "assets/images/dragon.png",
      "title": "Monkey D. Dragon",
      "subtitle": "Leader of the Revolutionary Army",
    },
    {
      "img": "assets/images/luffy.png",
      "title": "Monkey D. Luffy",
      "subtitle": "Captain of the Straw Hat Pirates",
    },
    {
      "img": "assets/images/luffy2.png",
      "title": "Monkey D. Luffy",
      "subtitle": "Captain of the Straw Hat Pirates",
    },
    {
      "img": "assets/images/luffy3.png",
      "title": "Monkey D. Luffy",
      "subtitle": "Captain of the Straw Hat Pirates",
    },
    {
      "img": "assets/images/dragon.png",
      "title": "Monkey D. Dragon",
      "subtitle": "Leader of the Revolutionary Army",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("things to learn (dynamic GridView)"),
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
                MaterialPageRoute(builder: (context) => const ListViewPage()),
              );
            },
            icon: const Icon(Icons.arrow_back_ios_new_outlined),
          ),
          IconButton(
            onPressed: () {
              mySnackBar("this is next page loading", context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const cardss()),
              );
            },
            icon: const Icon(Icons.next_plan),
          ),
        ],
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 0.7, // Adjust aspect ratio as needed
        ),

        itemCount: myItems.length,
        itemBuilder: (context, index) {
          final item = myItems[index];
          return GestureDetector(
            onTap: () {
              mySnackBar(item["title"] ?? "No title", context);
            },
            child: Container(
              margin: const EdgeInsets.all(10),
              width: double.infinity,
              height: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.black12,
              ),
              clipBehavior: Clip.antiAlias,
              child: Image.asset(item["img"]!, fit: BoxFit.fill),
            ),
          );
        },
      ),
    );
  }
}
