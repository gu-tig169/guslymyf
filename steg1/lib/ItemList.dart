import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'model.dart';

class ItemList extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Consumer<TodoState>(
        builder: (context, todoState, child) => Scrollbar(
            isAlwaysShown: true,
            controller: _scrollController,
            child: ListView.builder(
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
                        title: todoState.getTodos(index),
                        controlAffinity: ListTileControlAffinity.leading,
                        secondary: IconButton(
                            icon: Icon(
                              Icons.close_rounded,
                              color: Colors.red[500],
                            ),
                            onPressed: () {
                              todoState.removeItem(todoState.list[index]);
                            }),
                        activeColor: Colors.red[500],
                      ));
                })));
  }
}
