import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Page5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: CustomScrollView(
                slivers: [
                  // Add the app bar to the CustomScrollView.
                  SliverAppBar(
                    // Provide a standard title.
                    title: Text('Page 5'),
                    // Allows the user to reveal the app bar if they begin scrolling
                    // back up the list of items.
                    floating: true,
                    // Display a placeholder widget to visualize the shrinking size.
                    // Make the initial height of the SliverAppBar larger than normal.
                    expandedHeight: 60,
                  ),

                  SliverList(
                    // Use a delegate to build items as they're scrolled on screen.
                    delegate: SliverChildBuilderDelegate(
                      // The builder function returns a ListTile with a title that
                      // displays the index of the current item.
                      (context, index) => ListTile(title: Text('Item #$index')),
                      // Builds 1000 ListTiles
                      childCount: 1000,
                    ),
                  ),
                ],
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
