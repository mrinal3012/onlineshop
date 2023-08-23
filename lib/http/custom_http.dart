
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:onlineshop/model/model_page.dart';

class CustomHttpRequest{


  static Future<ProductModel> fatchShopData() async {
    ProductModel ? productModel;
    String url = "https://mocki.io/v1/02e91d9f-4d8c-4eb4-a4f9-bb4a60ffdaf9";
    var responce = await http.get(Uri.parse(url));
    var data = jsonDecode(responce.body);
    productModel = ProductModel.fromJson(data);
    return productModel!;
  }

}