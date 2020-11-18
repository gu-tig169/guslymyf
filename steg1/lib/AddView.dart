import 'package:flutter/material.dart';

class AddView extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Tasks'),
        centerTitle: true,
        backgroundColor: Colors.red[500],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(height: 100),
            Text('What do you want to add?'),
            Container(height: 30),
            Container(
              margin: EdgeInsets.only(left: 8.0, right: 8.0),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'e.g. Read book',
                ),
              ),
            ),
            Container(height: 30),
            IconButton(
              icon: Icon(Icons.add_rounded),
              color: Colors.red[500],
              onPressed: () {
                print('Your tasks have been added');
              },
            ),
          ],
        ),
      ),
    );
  }
}
