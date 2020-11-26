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

                      // statet på checkboxen inte följer med
                    },
                    title: Text(
                      todoState.list[index].name,
                      style: TextStyle(fontSize: 20),
                    ),
                    controlAffinity: ListTileControlAffinity.leading,
                    secondary: IconButton(
                        icon: Icon(Icons.delete_forever_rounded),
                        onPressed: () {
                          todoState.removeItem(todoState.list[index]);
                        }),
                    activeColor: Colors.red[500],
                  ));
            }));
  }
}
