// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter_node/model/product.dart';
import 'package:http/http.dart' as http;

class Api {
  static const baseUrl = "http://192.168.8.146/api/";
  // static const baseUrl = "http://localhost:9916/api";

// post method
  static addProduct(Map pdata) async {
    print(pdata);
    var url = Uri.parse("${baseUrl}addProduct");
    try {
      final response = await http.post(url, body: pdata);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        print(data);
      } else {
        print('failed to load data');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  // get method
  static getProduct() async {
    // creating a List to save the products
    List<Product> products = [];

    var url = Uri.parse("${baseUrl}getproducts");
    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        print('The resposes received from getProdcut method: ${data}');

//mapping the product data in to a the list
// data['product'] is coming from the Json

// "status code": 200,
//   "product": -------------------this is the product that we have used below
// [{
//       "id": 1,
//       "pname": "Sabith Frasd",
//       "pprice": "12354",
//       "pdesc": "cas"
//     },

        data['product'].forEach((value) => {
              products.add(Product(
                  name: value['pname'],
                  desc: value['pdesc'],
                  price: value['pprice'],
                  id: value['id'].toString())),
            });
        return products;
      } else {
        return [];
      }
    } catch (e) {
      print(e.toString());
    }
  }

// put method
  static updateProduct(id, body) async {
    var url = Uri.parse("${baseUrl}update/$id");

    final res = await http.put(url, body: body);

    if (res.statusCode == 200) {
      print(jsonDecode(res.body));
    } else {
      print("Failed to update");
    }
  }
}
