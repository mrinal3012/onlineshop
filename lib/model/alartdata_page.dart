
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onlineshop/widget/custom_widget_page.dart';

void ShowAlertDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Container(
          height: 50,
          width: double.infinity,
          child: Row(
            children: [
              Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage("images/manicon.jpg"),fit: BoxFit.cover),

                        borderRadius: BorderRadius.circular(12)),
                  )),
              SizedBox(
                width: 5,
              ),
              Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Saber Ali",
                          style: mystyleroboto(18,Colors.black,FontWeight.w800),
                        ),
                        Spacer(),
                        Text("Dhaka,Bangladesh",
                          style: mystyleroboto(12,Colors.black.withOpacity(.4),FontWeight.w500),),
                      ],
                    ),
                  )),
              Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.pink.withOpacity(.1),
                          borderRadius: BorderRadius.circular(20)),
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.manage_accounts)),
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
        ),
        content: Container(
          width: double.infinity,
          height: 200,
          decoration: BoxDecoration(
              color: Colors.teal,
              image: DecorationImage(image: AssetImage("images/man.jpg"),fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(12)),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text("View Post"),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Close'),
          ),
        ],
      );
    },
  );
}