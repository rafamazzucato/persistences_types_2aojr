import 'package:flutter/material.dart';
import 'package:persistences_types/sqflite/screens/add_person.dart';

class ListPersonWidget extends StatefulWidget {
  const ListPersonWidget({super.key});

  @override
  State<ListPersonWidget> createState() => _ListPersonWidgetState();
}

class _ListPersonWidgetState extends State<ListPersonWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pessoas"),
        actions: [
          IconButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => AddPersonWidget()));
            }, 
            icon: Icon(Icons.add))
        ]),
    );
  }
}