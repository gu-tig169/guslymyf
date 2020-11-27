import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'model.dart';

class ItemList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TodoState>(
        builder: (context, todoState, child) => ListView.builder(
            //separatorBuilder: (BuildContext context, int index) => Divider(),
            itemCount: todoState.list.length,
            itemBuilder: (BuildContext context, index) {
              return Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: CheckboxListTile(
                    value: todoState.getDone(index),
                    onChanged: (bool isDone) {
                      todoState.setValue(index, isDone);
                    },
                    title: Text(
                      todoState.list[index].name,
                      style: TextStyle(fontSize: 20),
                    ),
                    controlAffinity: ListTileControlAffinity.leading,
                    secondary: IconButton(
                        icon: Icon(
                          Icons.delete_outline_outlined,
                          color: Colors.red[500],
                        ),
                        onPressed: () {
                          todoState.removeItem(todoState.list[index]);
                        }),
                    activeColor: Colors.red[500],
                  ));
            }));
  }
}
