import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:persistences_types/firebase/models/car.dart';
import 'package:persistences_types/firebase/screens/add_car.dart';
import 'package:persistences_types/utils/customStyles.dart';
import 'package:persistences_types/utils/customWidgets.dart';

class ListCarWidget extends StatefulWidget {
  const ListCarWidget({super.key});

  @override
  State<ListCarWidget> createState() => _ListCarWidgetState();
}

class _ListCarWidgetState extends State<ListCarWidget> {
  final title = const Text("Carros");
  final addRoute = const AddCarWidget();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: title, actions: [
        IconButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => addRoute));
            },
            icon: addIcon)
      ]),
      body: buildList(context),
    );
  }

  Widget buildList(BuildContext context){
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection("cars").snapshots(),
      builder: (context, snapshot) {
        if(!snapshot.hasData) return const LinearProgressIndicator();
        if(snapshot.data == null){
          return Container(child: const Text("Nenhum carro encontrado!"));
        }else{
          return buildListView(context, snapshot.data!.docs);
        }
      });
  }

  Widget buildListView(BuildContext context, List<QueryDocumentSnapshot> snapshots){
    return ListView(
      padding: EdgeInsets.only(top: 30),
      children: snapshots.map((data) => _buildItem(context, data)).toList(),
    );
  }

  Widget _buildItem(BuildContext context, QueryDocumentSnapshot data) {
    Car c = Car.fromSnapshot(data);
    return Padding(
      padding: cardPadding,
      child: Container(
          decoration: cardBoxStyle(),
          child: ListTile(
            title: Text(c.name),
            subtitle: Text(c.model),
            onLongPress: () {
              //delete
            },
          )),
    );
  }
}
