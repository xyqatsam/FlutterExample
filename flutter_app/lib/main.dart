import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp(items: List<String>.generate(10000, (i) => "Item $i")));

class MyApp extends StatelessWidget {
  final List<String> items;

  MyApp({Key key, @required this.items}) : super(key: key);
  final title = 'Long List';

  @override
  Widget build(BuildContext context) => MaterialApp(
    title: title,
    home: Scaffold(
      appBar: AppBar(title: Text(title)),

      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) => ListTile(title: Text('${items[index]}'))
      ),
    ),
  );

}