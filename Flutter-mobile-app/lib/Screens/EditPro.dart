import 'package:flutter/material.dart';
import 'package:flutter_node/model/product.dart';

import '../Services/api.dart';

class EditPage extends StatefulWidget {
  final Product data;

  const EditPage({super.key, required this.data});

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  var nameController = TextEditingController();
  var priceController = TextEditingController();
  var descController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nameController.text = widget.data.name.toString();
    priceController.text = widget.data.price.toString();
    descController.text = widget.data.desc.toString();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Data'),
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
              Api.updateProduct(widget.data.id, {
                "pname": nameController.text,
                "pprice": priceController.text,
                "pdesc": descController.text,
                "id": widget.data.id
              });
            },
            child: Text('Update Data')),
      ]),
    );
  }
}
