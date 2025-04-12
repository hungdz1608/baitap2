import 'package:baitap2/data/database.dart';
import 'package:baitap2/widgets/todo_item.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  TodoDatabase db = TodoDatabase();

  TextEditingController titleController = TextEditingController();
  TextEditingController subtitleController = TextEditingController();


  void _addTodo() {
    // print(titleController.text);
    // print(subtitleController.text);
    setState(() {
      db.todos.add({
        'title': titleController.text,
        'subtitle': subtitleController.text,
        'isChecked': false,
      });
      titleController.clear();
      subtitleController.clear();
    });
    db.updateData();
  }

  void _checkDone(int index){
    setState(() {
      db.todos[index]['isChecked'] = !db.todos[index]['isChecked'];
    });
    db.updateData();
  }

  void _removeTodo(int index){
    setState(() {
      db.todos.removeAt(index);
    });
    db.updateData();
  }

  void _customTodo(int index) {
    TextEditingController editTitleController = TextEditingController(
        text: db.todos[index]['title']);
    TextEditingController editSubtitleController = TextEditingController(
        text: db.todos[index]['subtitle']);

    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          elevation: 10,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Chỉnh sửa công việc',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: editTitleController,
                    decoration: const InputDecoration(
                      labelText: 'Tiêu đề mới',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 15),
                  TextField(
                    controller: editSubtitleController,
                    decoration: const InputDecoration(
                      labelText: 'Mô tả mới',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text('Hủy'),
                      ),
                      const SizedBox(width: 10),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple,
                          foregroundColor: Colors.white, // chữ trắng
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            db.todos[index]['title'] = editTitleController.text;
                            db.todos[index]['subtitle'] = editSubtitleController.text;
                          });
                          db.updateData();
                          Navigator.of(context).pop();
                        },
                        child: const Text('Lưu'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }




  void _openDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          elevation: 10,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Thêm Công Việc',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: titleController,
                    decoration: const InputDecoration(
                      labelText: 'Tiêu đề',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 15),
                  TextField(
                    controller: subtitleController,
                    decoration: const InputDecoration(
                      labelText: 'Mô tả',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text('Hủy'),
                      ),
                      const SizedBox(width: 10),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          _addTodo();
                          Navigator.of(context).pop();
                        },
                        child: const Text('Thêm'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }



  @override
  void initState() {
    if(db.box.get('todoList') == null){
      db.initData();
    } else{
      db.loadData();
    }
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
          title: const Text('Todo List'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _openDialog();
          },
          child: const Icon(Icons.add),
        ),
        body: Container(
          padding: const EdgeInsets.all(20),
            child: ListView.builder(
              itemCount: db.todos.length,
              itemBuilder: (context, index) {
                return TodoItem(
                  title: db.todos[index]['title'],
                  subtitle: db.todos[index]['subtitle'],
                  isChecked: db.todos[index]['isChecked'],
                  checkDone: () {
                    _checkDone(index);
                  },
                  removeTodo: (context) {
                    _removeTodo(index);
                  },
                  customTodo: (context){
                    _customTodo(index);
                  },
                );
              },
            )
        )
    );
  }
}

