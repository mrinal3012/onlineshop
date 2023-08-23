import 'package:flutter/material.dart';
import 'package:onlineshop/screen/explore_page.dart';
import 'package:onlineshop/screen/home_page.dart';
import 'package:onlineshop/screen/index-page.dart';
import 'package:onlineshop/screen/shop_page.dart';
import 'package:onlineshop/widget/custom_widget_page.dart';

class BottomPage extends StatefulWidget {
  const BottomPage({Key? key}) : super(key: key);

  @override
  State<BottomPage> createState() => _BottomPageState();
}

class _BottomPageState extends State<BottomPage> {

  int currentTab = 0;
  final List<Widget> screen = [
    HomePage(),
    ExplorePage(),
    IndexPage(),
    ShopPage()
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = HomePage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: currentScreen,
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = HomePage();
                        currentTab = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.home_filled,
                          color:
                          currentTab == 0 ? Colors.redAccent : Colors.black.withOpacity(.5),
                        ),
                        Text("Home",style: mystyleroboto(16, currentTab == 0 ? Colors.redAccent : Colors.black.withOpacity(.5),FontWeight.w500))
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = ExplorePage();
                        currentTab = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.explore,
                          color:
                          currentTab == 1 ? Colors.redAccent  : Colors.black.withOpacity(.5),
                        ),
                        Text("Explore",style: mystyleroboto(16, currentTab == 1 ? Colors.redAccent : Colors.black.withOpacity(.5),FontWeight.w500))
                      ],
                    ),
                  ),
                ],
              ),
              Spacer(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = IndexPage();
                        currentTab = 2;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.inbox,
                          color:
                          currentTab == 2 ? Colors.redAccent  : Colors.black.withOpacity(.5),
                        ),
                        Text("Index", style: mystyleroboto(16, currentTab == 2 ? Colors.redAccent : Colors.black.withOpacity(.5),FontWeight.w500))
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = ShopPage();
                        currentTab = 3;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.shop,
                          color:
                          currentTab == 3 ? Colors.redAccent : Colors.black.withOpacity(.5),
                        ),
                        Text("Shop",style: mystyleroboto(16, currentTab == 3 ? Colors.redAccent : Colors.black.withOpacity(.5),FontWeight.w500))
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
