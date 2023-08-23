import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:onlineshop/model/model_page.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:onlineshop/widget/custom_widget_page.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {

  TextEditingController textEditingController = TextEditingController();

  String url = "https://mocki.io/v1/02e91d9f-4d8c-4eb4-a4f9-bb4a60ffdaf9";

  ProductModel? productModel;
  Future<ProductModel> fatchHomeData() async {
    var responce = await http.get(Uri.parse(url));
    var data = jsonDecode(responce.body);
    productModel = ProductModel.fromJson(data);
    print("res.....................${data}");
    return productModel!;
  }


  @override
  Widget build(BuildContext context) {
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
                          future: fatchHomeData(),
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
                              return GridView.custom(
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
                                  childrenDelegate:
                                  SliverChildBuilderDelegate(
                                          (context, index) => Padding(
                                        padding:
                                        const EdgeInsets.all(2.0),
                                        child: InkWell(
                                          onTap: () {
                                            Get.defaultDialog(
                                              content: Container(
                                                child: Column(
                                                  children: [
                                                    Container(
                                                        child:
                                                        Container(
                                                          height: 50,
                                                          width: double
                                                              .infinity,
                                                          child: Row(
                                                            children: [
                                                              Expanded(
                                                                  flex: 1,
                                                                  child:
                                                                  Container(
                                                                    decoration: BoxDecoration(
                                                                      image: DecorationImage(image: AssetImage("images/manicon.jpg"),fit: BoxFit.cover),

                                                                        borderRadius: BorderRadius.circular(12)),
                                                                  )),
                                                              SizedBox(
                                                                width: 5,
                                                              ),
                                                              Expanded(
                                                                  flex: 2,
                                                                  child:
                                                                  Padding(
                                                                    padding:
                                                                    const EdgeInsets.symmetric(vertical: 5),
                                                                    child:
                                                                    Column(
                                                                      crossAxisAlignment:
                                                                      CrossAxisAlignment.start,
                                                                      children: [
                                                                        FittedBox(
                                                                          child: Text(
                                                                            "${productModel!.products![index].brand}",
                                                                            style: mystyleroboto(18,Colors.black,FontWeight.w800),),
                                                                        ),
                                                                        Spacer(),
                                                                        Text("${productModel!.products![index].category}",
                                                                          style: mystyleroboto(15,Colors.black.withOpacity(.4),FontWeight.w500),),
                                                                      ],
                                                                    ),
                                                                  )),
                                                              Expanded(
                                                                  flex: 2,
                                                                  child:
                                                                  Padding(
                                                                    padding:
                                                                    const EdgeInsets.symmetric(vertical: 8),
                                                                    child:
                                                                    Container(
                                                                      decoration: BoxDecoration(
                                                                          color: Colors.pink.withOpacity(.1),
                                                                          borderRadius: BorderRadius.circular(20)),
                                                                      child:
                                                                      Row(
                                                                        children: [
                                                                          IconButton(onPressed: () {}, icon: Icon(Icons.manage_accounts)),
                                                                          Text(
                                                                            "Follow",
                                                                            style: TextStyle(fontSize: 12),
                                                                          )
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  )),
                                                            ],
                                                          ),
                                                        )),
                                                    SizedBox(
                                                      height: 20,
                                                    ),
                                                    Container(
                                                      width: double
                                                          .infinity,
                                                      height: 200,
                                                      decoration: BoxDecoration(
                                                          image: DecorationImage(
                                                              image: NetworkImage(
                                                                  "${productModel!.products![index].images![0]}"),
                                                              fit: BoxFit
                                                                  .cover),
                                                          borderRadius:
                                                          BorderRadius
                                                              .circular(
                                                              12)),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              actions: [
                                                TextButton(
                                                  onPressed: () {},
                                                  child:
                                                  Text("View Post"),
                                                ),
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.of(
                                                        context)
                                                        .pop();
                                                  },
                                                  child: Text('Close'),
                                                ),
                                              ],
                                            );
                                            // _showAlertDialog(context);
                                            // modelValue="${productModel!.products![index].images![1]}";
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: Colors.teal,
                                                borderRadius:
                                                BorderRadius
                                                    .circular(12),
                                                image: DecorationImage(
                                                  image: NetworkImage(
                                                      "${productModel!.products![index].images![0]}"),
                                                  fit: BoxFit.cover,
                                                )),
                                          ),
                                        ),
                                      )));
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
