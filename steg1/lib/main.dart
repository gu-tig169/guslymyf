import 'package:flutter/material.dart';
import 'package:steg1/ItemList.dart';
import 'AddView.dart';
import 'model.dart';
import 'package:provider/provider.dart';

void main() {
  var todoState = TodoState();
  todoState.getList();
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
          actions: [_popupMenuButton()]),
      body: ItemList(),
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

  Widget _popupMenuButton() {
    return Consumer<TodoState>(
      builder: (context, todoState, child) {
        return PopupMenuButton(
          onSelected: (newChoice) {
            todoState.setChoiceValue(newChoice);
            todoState.filter();
          },
          itemBuilder: (context) => [
            PopupMenuItem(
                value: 'All',
                child: Text('All',
                    style: TextStyle(color: Colors.black, fontSize: 15))),
            PopupMenuItem(
                value: 'Done',
                child: Text('Done',
                    style: TextStyle(color: Colors.black, fontSize: 15))),
            PopupMenuItem(
                value: 'Undone',
                child: Text('Undone',
                    style: TextStyle(color: Colors.black, fontSize: 15))),
          ],
        );
      },
    );
  }
}
