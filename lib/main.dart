import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'pages/home_page.dart';

void main() async {

  await Hive.initFlutter();
  var box = await Hive.openBox('myBox');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.purple),
        home: HomePage()
    );
  }
}
