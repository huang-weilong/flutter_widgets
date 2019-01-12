import 'package:flutter/material.dart';

class FlutterLogoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FlutterLogo'),
        centerTitle: true,
        elevation: 0.0,
        bottom: PreferredSize(
          child: Text(
            'Flutter logo, 以widget形式. 这个widget遵从IconTheme。',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          preferredSize: Size.fromHeight(30.0),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            FlutterLogo(
              size: 120.0,
            ),
            FlutterLogo(
              size: 120.0,
              style: FlutterLogoStyle.horizontal,
              colors: Colors.red,
            ),
            FlutterLogo(
              size: 120.0,
              style: FlutterLogoStyle.stacked,
              colors: Colors.orange,
              textColor: Colors.blue,
            )
          ],
        ),
      ),
    );
  }
}
