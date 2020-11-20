import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'model.dart';
import 'AddView.dart';

// Här ska klassen erhålla funktion för checkbox och remove funktion
class ItemList extends StatefulWidget {
  final List<TodoItem> taskList;
  ItemList(this.taskList);

  @override
  _ItemListState createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  bool _checked = true;

  Widget build(BuildContext context) {
    return ListView.separated(
        itemCount: widget.taskList.length,
        separatorBuilder: (BuildContext context, int index) => Divider(),
        itemBuilder: (context, index) =>
            _ItemListItem(context, widget.taskList[index], index));
  }

  Widget _ItemListItem(context, TodoItem item, index) {
    return Card(
        child: CheckboxListTile(
      value: _checked,
      onChanged: (bool value) {},
      title: Text(
        item.name,
        style: TextStyle(fontSize: 20),
      ),
      controlAffinity: ListTileControlAffinity.leading,
      secondary: IconButton(
        icon: Icon(Icons.remove_circle_sharp),
        onPressed: () {
          Provider.of<TodoState>(context, listen: false).removeItem(index);
        },
      ),
      activeColor: Colors.red[500],
    ));
  }
}
