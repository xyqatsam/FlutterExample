import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

final items = List<ListItem>.generate(
    1000,
    (i) => i % 6 == 0
        ? HeadingItem('Heading $i')
        : MessageItem('Sender $i','Message body $i')
    );

void main() => runApp(MyApp(items: items,));

class MyApp extends StatelessWidget {

  final List<ListItem> items;

  MyApp({Key key, @required this.items}) : super(key: key);

  final title = 'Mixed List';
  @override
  Widget build(BuildContext context) => MaterialApp(
    title: title,
    home: Scaffold(
      appBar: AppBar(title: Text(title)),
      body: ListView.builder(
        // Let the ListView know how many items it needs to build
        itemCount: items.length,
        // Provide a builder function. This is where the magic happens! We'll
        // convert each item into a Widget based on the type of item it is.
        itemBuilder: (context, index) {
          final item = items[index];

          if (item is HeadingItem) {
            return ListTile(title: Text(item.heading, style: Theme.of(context).textTheme.headline));
          } else if (item is MessageItem) {
            return ListTile(title: Text(item.sender), subtitle: Text(item.body));
          }
        }
      ),
    ),
  );

}

// The base class for the different types of items the list can be contain
abstract class ListItem {}

// A ListItem that contains data to display a heading
class HeadingItem implements ListItem {
  // the run-time constants
  final String heading;

  HeadingItem(this.heading);
}

// A ListItem that contains data to display a message
class MessageItem implements ListItem {
  // the run-time constants
  final String sender;
  final String body;
  MessageItem(this.sender, this.body);
}