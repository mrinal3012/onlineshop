import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:onlineshop/controller/controller_page.dart';
import 'package:onlineshop/model/alartdata_page.dart';
import 'package:onlineshop/model/model_page.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:onlineshop/widget/custom_widget_page.dart';
import 'package:provider/provider.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var productProvider = Provider.of<ProductProvider>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
              width: double.infinity,
              height: double.infinity,
              child: Column(
                children: [
                  Expanded(
                      flex: 1,
                      child: Container(
                        child: TextField(
                          controller: textEditingController,
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide(
                                      width: 2,
                                      color: Colors.black.withOpacity(.3))),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide(
                                      width: 2,
                                      color: Colors.black.withOpacity(.3))),
                              prefixIcon: Icon(Icons.search),
                              hintText: "Search in Swipexyz"),
                        ),
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                      flex: 10,
                      child: Container(
                        child: FutureBuilder<ProductModel>(
                          future: productProvider.GetHomeData(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            } else if (snapshot.hasError) {
                              return Text(
                                  'An error occurred: ${snapshot.error}');
                            } else if (snapshot.data == null) {
                              return Text("data is null");
                            } else
                              return GridView.builder(
                                itemCount: productProvider
                                    .productModel!.products!.length,
                                gridDelegate: SliverQuiltedGridDelegate(
                                    crossAxisCount: 15,
                                    mainAxisSpacing: 2,
                                    crossAxisSpacing: 2,
                                    pattern: const [
                                      QuiltedGridTile(4, 5),
                                      QuiltedGridTile(4, 5),
                                      QuiltedGridTile(4, 5),
                                      QuiltedGridTile(8, 9),
                                      QuiltedGridTile(4, 6),
                                      QuiltedGridTile(4, 6),
                                      QuiltedGridTile(4, 5),
                                      QuiltedGridTile(4, 5),
                                      QuiltedGridTile(4, 5),
                                    ]),
                                itemBuilder: (context, index) => Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: InkWell(
                                    onTap: () {
                                      ShowAlertDialog(context);
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.teal,
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          image: DecorationImage(
                                            image: NetworkImage(
                                                "${productProvider.productModel!.products![index].images![0]}"),
                                            fit: BoxFit.cover,
                                          )),
                                    ),
                                  ),
                                ),
                              );
                          },
                        ),
                      )),
                ],
              )),
        ),
      ),
    );
  }
}
