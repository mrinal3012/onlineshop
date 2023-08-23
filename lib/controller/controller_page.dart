
import 'package:flutter/cupertino.dart';
import 'package:onlineshop/http/custom_http.dart';
import 'package:provider/provider.dart';
import 'package:onlineshop/model/model_page.dart';

class ProductProvider extends ChangeNotifier{
  ProductModel ? productModel;

  Future<ProductModel>GetHomeData()async{
    productModel= await CustomHttpRequest.fatchShopData();
    return productModel!;
  }
}