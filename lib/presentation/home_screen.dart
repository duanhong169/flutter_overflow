import 'package:flutter/material.dart';
import 'dart:collection';

class HomeScreen extends StatelessWidget {

  final String title;
  final LinkedHashMap questionSortTypes = LinkedHashMap.from({
    "activity" : "Active",
    "votes" : "Votes",
    "creation" : "Newest",
    "hot" : "Hot Today",
    "week" : "Hot Weekly",
    "month" : "Hot Monthly",
  });

  HomeScreen({@required this.title}) : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title)
      ),
      drawer: Drawer(
        child: Container(
          child: ListView(
            padding: EdgeInsets.zero,
            children: drawerItems(context),
          ),
        )
      ),
    );
  }

  List<Widget> drawerItems(BuildContext context) {
    List<Widget> widgets = List<Widget>();
    widgets.add(Container(
      height: 88.0,
      child: DrawerHeader(
        child: Text('Choose a sort type',
          style: TextStyle(
              color: Colors.white,
            fontSize: 20.0
          ),
        ),
        decoration: BoxDecoration(
          color: Colors.purple,
        ),
      )
    ));
    widgets.addAll(questionSortTypes.keys.map((key) {
      return ListTile(
        title: Text(questionSortTypes[key]),
        onTap: () {
          Navigator.pop(context);
        },
      );
    }).toList());
    return widgets;
  }
}
