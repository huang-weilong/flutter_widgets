import 'package:flutter/material.dart';

class ScaffoldWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scaffold'),
        centerTitle: true,
        elevation: 0.0,
      ),
      drawer: Drawer(
        child: Center(child: Text('drawer')),
      ),
      body: Center(
        child: Text(
          'Material Design布局结构的基本实现。此类提供了用于显示drawer、snackbar和底部sheet的API。',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
