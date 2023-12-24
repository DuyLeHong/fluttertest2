import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StackPage extends StatelessWidget {
  late final List<String> items;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Stack Page")),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListAlignmentDirectional(),
            ),
            Divider(),
            Container(
              width: 300,
              height: 300,
              child: Stack(
                  clipBehavior: Clip.hardEdge, alignment: Alignment.bottomCenter,
                  children: <Widget>[
                    Positioned(bottom: -20, child: CircleImage()),
                    //CircleImage(),
                    Text(
                      "CodeFresher 2024",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    )
                  ]),
            )
          ],
        ),
      ),
    );
  }
}

class ListAlignmentDirectional extends StatelessWidget {
  final alignmentDirectionList = [
    AlignmentDirectional.topStart,
    AlignmentDirectional.topCenter,
    AlignmentDirectional.topEnd,
    AlignmentDirectional.centerStart,
    AlignmentDirectional.center,
    AlignmentDirectional.centerEnd,
    AlignmentDirectional.bottomStart,
    AlignmentDirectional.bottomCenter,
    AlignmentDirectional.bottomEnd
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: alignmentDirectionList.length,
      itemBuilder: (context, index) {
        return Card(child: StackWithDesc(alignmentDirectionList[index]));
      },
    );
  }
}

class StackWithDesc extends StatelessWidget {
  final AlignmentDirectional alignmentDirectional;

  StackWithDesc(this.alignmentDirectional);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(children: <Widget>[
        DemoStack(this.alignmentDirectional),
        SizedBox(width: 8),
        Text(
          this.alignmentDirectional.toString().split(".")[1],
          style: TextStyle(fontSize: 20),
        )
      ]),
    );
  }
}

class DemoStack extends StatelessWidget {
  DemoStack(this.alignmentDirectional);

  final AlignmentDirectional alignmentDirectional;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 140,
        height: 140,
        child: Stack(
            clipBehavior: Clip.hardEdge, alignment: this.alignmentDirectional,
            children: <Widget>[
              ColorBox(140, 140, Colors.amberAccent),
              ColorBox(110, 110, Colors.blueAccent),
              Positioned(
                  bottom: 0,
                  right: 20,
                  child: ColorBox(80, 80, Colors.pinkAccent)),
              FittedBox(
                  fit: BoxFit.fill, child: ColorBox(100, 200, Colors.indigo)),

              //ColorBox(100, 200, Colors.indigo),
            ]));
  }
}

class ColorBox extends StatelessWidget {
  ColorBox(this.width, this.height, this.color);

  final double width;
  final double height;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.width,
      height: this.height,
      color: this.color,
    );
  }
}

class CircleImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _size = 300.0;

    return Center(
      child: Container(
          width: _size,
          height: _size,
          decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      "https://images.pexels.com/photos/4029925/pexels-photo-4029925.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500")))),
    );
  }
}
