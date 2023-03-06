// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../Services/api.dart';

class CreatData extends StatefulWidget {
  const CreatData({super.key});

  @override
  State<CreatData> createState() => CreatDataState();
}

class CreatDataState extends State<CreatData> {
  var nameController = TextEditingController();
  var priceController = TextEditingController();
  var descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Daa'),
      ),
      // ignore: prefer_const_literals_to_create_immutables
      body: Column(children: [
        TextField(
          controller: nameController,
          decoration: InputDecoration(hintText: 'Name'),
        ),
        TextField(
          controller: priceController,
          decoration: InputDecoration(hintText: 'Price'),
        ),
        TextField(
          controller: descController,
          decoration: InputDecoration(hintText: 'Desc'),
        ),
        ElevatedButton(
            onPressed: () {
              var data = {
                "pname": nameController.text,
                "pprice": priceController.text,
                "pdesc": descController.text
              };

              Api.addProduct(data);
            },
            child: Text('Create Data')),
      ]),
    );
  }
}
