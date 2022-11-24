import 'package:flutter/material.dart';
import 'package:persistences_types/firebase/screens/list_car.dart';
import 'package:persistences_types/floor/screens/list_book.dart';
import 'package:persistences_types/screens/home.dart';
import 'package:persistences_types/sqflite/screens/list_person.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
        "/books" :(context) => const ListBookWidget(),
        "/cars" :(context) => const ListCarWidget(),
      },
    );
  }
}
