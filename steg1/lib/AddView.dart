import 'package:flutter/material.dart';
import 'model.dart';
import 'package:provider/provider.dart';

class AddView extends StatefulWidget {
  @override
  _AddViewState createState() => _AddViewState();
}

class _AddViewState extends State<AddView> {
  final myController = TextEditingController();

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Task'),
        centerTitle: true,
        backgroundColor: Colors.red[500],
      ),
      body: Builder(
        builder: (context) => Center(
          child: SingleChildScrollView(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text('What do you want to add?',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600)),
              Container(height: 30),
              Container(
                margin: EdgeInsets.only(left: 8.0, right: 8.0),
                child: TextField(
                  controller: myController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Task',
                  ),
                ),
              ),
              Container(height: 40),
              SizedBox(
                width: 200.0,
                height: 50,
                child: RaisedButton(
                  child: Text(
                    'Add Task',
                    style: TextStyle(color: Colors.white),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  color: Colors.red[500],
                  onPressed: () {
                    if (myController.text.isEmpty) {
                      Scaffold.of(context).showSnackBar(SnackBar(
                          backgroundColor: Colors.red[500],
                          content: Text(
                            'Task can not be empty',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 15),
                          )));
                    } else {
                      addItem();
                    }
                  },
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }

  void addItem() {
    final String userInput = myController.text;
    TodoItem item = TodoItem(name: userInput);
    Provider.of<TodoState>(context, listen: false).addItem(item);
    Navigator.pop(context);
  }
}
