import 'package:flutter/material.dart';
import 'AddView.dart';

void main() {
  runApp(MyApp());
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
  final List<String> task = [
    'Clean bedroom',
    'Laundry',
    'Workout',
    'Complete essay',
    'Call Eric',
    'Meditate',
    'Journaling',
    'Read book',
  ];

  final bool _checked = false;

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
            context,
            MaterialPageRoute(builder: (context) => AddView()),
          );
        },
        child: Icon(Icons.add_rounded),
        backgroundColor: Colors.red[500],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Center(
        child: ListView.separated(
            itemCount: task.length,
            separatorBuilder: (BuildContext context, int index) => Divider(),
            itemBuilder: (context, index) {
              return CheckboxListTile(
                value: _checked,
                onChanged: (bool value) {},
                title: Text(
                  '${task[index]}',
                  style: TextStyle(fontSize: 20),
                ),
                controlAffinity: ListTileControlAffinity.leading,
                secondary: Icon(Icons.clear_sharp),
                activeColor: Colors.red[500],
              );
            }),
      ),
    );
  }
}
