import 'package:flutter/material.dart';

Widget listItem(BuildContext context, int index) {
  return Card(
    child: Row(
      children: <Widget>[
        Container(margin: const EdgeInsets.all(10),child: Text("1")),
        Container(height: 20,width: 1,color: Colors.blue,),
        Container(margin:const EdgeInsets.all(10),child: Text("asdasd"))
      ],
    ),
  );
}