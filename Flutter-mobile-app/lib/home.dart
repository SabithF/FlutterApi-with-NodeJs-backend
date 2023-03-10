import 'package:flutter/material.dart';
import 'package:flutter_node/Screens/read.dart';
import 'package:flutter_node/Screens/update.dart';

import 'Screens/create.dart';
import 'Screens/delete.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(children: [
          ElevatedButton(
              onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const CreatData())),
              child: Text('CREATE')),
          ElevatedButton(
              onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const FetchData())),
              child: Text('READ')),
          ElevatedButton(
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const UpdateScreen())),
              child: Text('UPDATE')),
          ElevatedButton(
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const DeleteProduct())),
              child: Text('DELETE'))
        ]));
  }
}
