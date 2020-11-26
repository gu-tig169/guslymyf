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
        title: Text('Add New Tasks'),
        centerTitle: true,
        backgroundColor: Colors.red[500],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(height: 100),
            Text('What do you want to add?',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.w600)),
            Container(height: 30),
            Container(
              margin: EdgeInsets.only(left: 8.0, right: 8.0),
              child: TextField(
                controller: myController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'e.g.Tasks',
                ),
              ),
            ),
            Container(height: 30),
            IconButton(
              icon: Icon(Icons.add_rounded),
              color: Colors.red[500],
              onPressed: () {
                print('Saved');
                addItem();
              },
            ),
          ],
        ),
      ),
    );
  }

  void addItem() {
    final String userInput = myController.text;
    if (userInput.isNotEmpty) {
      TodoItem item = TodoItem(name: userInput);
      Provider.of<TodoState>(context, listen: false).addItem(item);
      Navigator.pop(context);
    } else {
      _alertSnackbar(context);
    }
  }

  void _alertSnackbar(context) {
    SnackBar snackbar = SnackBar(content: Text('Todo can not be empty'));
    Scaffold.of(context).showSnackBar(snackbar);
  }
}
