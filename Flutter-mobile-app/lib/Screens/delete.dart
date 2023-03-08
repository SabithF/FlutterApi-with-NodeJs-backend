import 'package:flutter/material.dart';

import '../Services/api.dart';
import '../model/product.dart';

class DeleteProduct extends StatefulWidget {
  const DeleteProduct({super.key});

  @override
  State<DeleteProduct> createState() => _DeleteProductState();
}

class _DeleteProductState extends State<DeleteProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Delete Screen'),
      ),
      body: FutureBuilder(
          future: Api.getProduct(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              List<Product> pdata = snapshot.data;

              return ListView.builder(
                  itemCount: pdata.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      leading: const Icon(Icons.storage),
                      title: Text("${pdata[index].name}"),
                      subtitle: Text("${pdata[index].desc}"),
                      trailing: IconButton(
                          onPressed: () async {
                            await Api.deleteProduct(pdata[index].id);
                            pdata.removeAt(index);
                            setState(() {});

                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: ((context) =>
                            //             EditPage(data: pdata[index]))));
                          },
                          icon: const Icon(Icons.delete)),
                    );
                  });
            }
          }),
    );
  }
}
