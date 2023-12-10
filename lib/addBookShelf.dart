import 'package:flutter/material.dart';

class AddBookShelf extends StatefulWidget {
  const AddBookShelf({super.key});

  @override
  State<AddBookShelf> createState() => _AddBookShelfState();
}

class _AddBookShelfState extends State<AddBookShelf> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(children: [
      Align(
        alignment: Alignment.topLeft,
        child: IconButton(
            onPressed: () {
              (() {},);
            },
            icon: Icon(
              Icons.chevron_left,
              color: Colors.blue,
              size: 35,
            )),
      ),
      Text("Catatan 1",
          style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
              color: Color(0xFF3EC6FF))),
      Text("22 Desember 2023",
          style: TextStyle(
              fontSize: 15.0,
              // fontWeight: FontWeight.bold,
              color: Color(0xFF3EC6FF))),
      Container(
        width: MediaQuery.of(context).size.width,
        // height: MediaQuery.of(context).size.height * 0.5,
        // color: Colors.amber,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              // alignment: Alignment.topCenter,
              margin: EdgeInsets.fromLTRB(0, 5, 0, 10),
              width: MediaQuery.of(context).size.width * 0.5,
              height: MediaQuery.of(context).size.height * 0.4,
              color: Color(0xFF3EC6FF),
            ),
          ],
        ),
      ),
    ]));
  }
}
