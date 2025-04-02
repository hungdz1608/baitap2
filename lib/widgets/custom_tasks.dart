import 'package:flutter/material.dart';

class CustomTasks extends StatefulWidget {
  const CustomTasks({super.key, required this.text, this.icon, this.onPressed, this.completed = false, this.onToggle});

  final String text;
  final IconData? icon;
  final VoidCallback? onPressed;
  final bool completed;
  final VoidCallback? onToggle;


  @override
  _CustomTasksState createState() => _CustomTasksState();
}

class _CustomTasksState extends State<CustomTasks> {
  bool isCompleted = false; // Trạng thái của checkbox

  void toggleCompleted() {
    setState(() {
      isCompleted = !isCompleted; // Đảo trạng thái khi nhấn
    });
  }


  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 400,
        height: 50,
        child: ElevatedButton(
          onPressed: toggleCompleted,
          style: ElevatedButton.styleFrom(

            backgroundColor: isCompleted ? Colors.green : Colors.purple,
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Row(
            // mainAxisSize: MainAxisSize.min,
            spacing: 10,
            children: [
              Checkbox(
                value: isCompleted,
                onChanged: (value) {
                  toggleCompleted();// Đổi trạng thái
                }, // Gọi hàm onToggle khi nhấn

                activeColor: Colors.white,
                checkColor: Colors.green,
              ),


              Text(
                widget.text,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  decoration: isCompleted? TextDecoration.lineThrough : TextDecoration.none,
                ),
              ),
            ],
          ),
        )
    );
  }
}