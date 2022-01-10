import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Page6 extends StatelessWidget {
  late final List<ListItem> items;

  @override
  Widget build(BuildContext context) {
    items = List<ListItem>.generate(
      1000,
      (i) => i % 6 == 0
          ? HeadingItem('Heading $i')
          : MessageItem('Sender $i', 'Message body $i'),
    );

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 6'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                // Let the ListView know how many items it needs to build.
                itemCount: items.length,
                // Provide a builder function. This is where the magic happens.
                // Convert each item into a widget based on the type of item it is.
                itemBuilder: (context, index) {
                  final item = items[index];

                  return ListTile(
                    title: item.buildTitle(context),
                    subtitle: item.buildSubtitle(context),
                    onTap: () {

                      String mess;
                      if (item is HeadingItem) {
                        mess = item.heading;
                      } else {
                        mess = (item as MessageItem).body;
                      }

                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(mess)));
                    },
                  );
                },
              ),
            ),
            Image.asset(
              'BulbOn.jpeg',
              width: 100,
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}

/// The base class for the different types of items the list can contain.
abstract class ListItem {
  /// The title line to show in a list item.
  Widget buildTitle(BuildContext context);

  /// The subtitle line, if any, to show in a list item.
  Widget buildSubtitle(BuildContext context);
}

/// A ListItem that contains data to display a heading.
class HeadingItem implements ListItem {
  final String heading;

  HeadingItem(this.heading);

  @override
  Widget buildTitle(BuildContext context) {
    return Text(
      heading,
      style: Theme.of(context).textTheme.headline5,
    );
  }

  @override
  Widget buildSubtitle(BuildContext context) => SizedBox.fromSize(size: const Size(10.0, 10.0));
}

/// A ListItem that contains data to display a message.
class MessageItem implements ListItem {
  final String sender;
  final String body;

  MessageItem(this.sender, this.body);

  @override
  Widget buildTitle(BuildContext context) => Text(sender);

  @override
  Widget buildSubtitle(BuildContext context) => Text(body);
}
