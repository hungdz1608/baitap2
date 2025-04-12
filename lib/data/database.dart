import 'package:hive_flutter/hive_flutter.dart';

class TodoDatabase {

  List todos = [];

  var box = Hive.box('myBox');

  void initData() {
    todos = [
      {
        'title': 'Todo 1',
        'subtitle': 'Description 1',
        'isChecked': false,
      },
      {
        'title': 'Todo 2',
        'subtitle': 'Description 2',
        'isChecked': false,
      },
      {
        'title': 'Todo 3',
        'subtitle': 'Description 3',
        'isChecked': false,
      },
    ];
    box.put('todoList', todos);
  }

  void loadData(){
    todos = box.get('todoList');
  }

  void updateData(){
    box.put('todoList', todos);
  }

}