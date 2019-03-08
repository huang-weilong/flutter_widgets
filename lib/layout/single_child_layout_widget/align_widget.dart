import 'package:flutter/material.dart';

class AlignWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Align'),
        centerTitle: true,
        elevation: 0.0,
        bottom: PreferredSize(
          child: Text(
            '一个widget，它可以将其子widget对齐，并可以根据子widget的大小自动调整大小',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          preferredSize: Size.fromHeight(30.0),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              height: 100.0,
              width: 100.0,
              color: Colors.yellow,
              child: Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  height: 40.0,
                  width: 40.0,
                  color: Colors.blue,
                ),
              ),
            ),
            Text('Alignment.bottomRight'),
            Container(
              height: 100.0,
              width: 100.0,
              color: Colors.green,
              child: Align(
                alignment: Alignment(1.0, 0.0),
                child: Container(
                  height: 40.0,
                  width: 40.0,
                  color: Colors.blue,
                ),
              ),
            ),
            Text('Alignment(1.0, 0.0)'),
            Container(
              height: 100.0,
              width: 100.0,
              color: Colors.orange,
              child: Align(
                alignment: FractionalOffset(0.5, 0.0),
                child: Container(
                  height: 40.0,
                  width: 40.0,
                  color: Colors.blue,
                ),
              ),
            ),
            Text('FractionalOffset(0.5, 0.0)'),
          ],
        ),
      ),
    );
  }
}
