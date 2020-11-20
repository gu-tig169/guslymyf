import 'package:flutter/material.dart';
import 'AddView.dart';
import 'model.dart';
import 'package:provider/provider.dart';

void main() {
  var todoState = TodoState();
  runApp(
    ChangeNotifierProvider(
      create: (context) => todoState,
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainView(),
    );
  }
}

class MainView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Tasks'),
        centerTitle: true,
        backgroundColor: Colors.red[500],
        actions: <Widget>[
          PopupMenuButton<int>(
            itemBuilder: (context) => <PopupMenuEntry<int>>[
              PopupMenuItem(
                value: 1,
                child: Text(
                  'All',
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
              ),
              PopupMenuItem(
                value: 2,
                child: Text(
                  'Done',
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
              ),
              PopupMenuItem(
                value: 3,
                child: Text(
                  'Undone',
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
              ),
            ],
            icon: Icon(Icons.more_vert_rounded),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddView()));
        },
        child: Icon(Icons.add_rounded),
        backgroundColor: Colors.red[500],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
