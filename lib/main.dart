import 'package:flutter/material.dart';
import 'package:persistences_types/screens/home.dart';
import 'package:persistences_types/sqflite/screens/list_person.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      initialRoute: "/",
      routes: {
        "/" :(context) => const HomeWidget(),
        "/person" :(context) => const ListPersonWidget(),
      },
    );
  }
}
