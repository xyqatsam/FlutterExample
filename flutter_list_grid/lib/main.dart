 import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  final title = 'Basic List';
  @override
  Widget build(BuildContext context) => MaterialApp(
    title: title,
    home: Scaffold(
      appBar: AppBar(title: Text(title)),
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(100,(index) => Center(
          child: Text('Item $index',style: Theme.of(context).textTheme.headline)
        )),
      ),

    ),
  );

}




