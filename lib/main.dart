import 'package:flutter/material.dart';
import 'package:baitap2/widgets/custom_tasks.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.purple,
          title: Text(
            "Todo List",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 20, top: 30, bottom: 20), // Thêm padding hai bên
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 20,
                children: [
                  CustomTasks(
                    text: "Task 1",
                  ),
                  CustomTasks(
                    text: "Task 2",
                  ),
                  CustomTasks(
                    text: "Task 3",
                  ),
                  CustomTasks(
                    text: "Task 4",
                  ),
                  CustomTasks(
                    text: "Task 5",
                  ),
                  CustomTasks(
                    text: "Task 6",
                  ),
                  CustomTasks(
                    text: "Task 7",
                  ),
                  CustomTasks(
                    text: "Task 8",
                  ),
                  CustomTasks(
                    text: "Task 9",
                  ),
                  CustomTasks(
                    text: "Task 10",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

