import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CupertinoFullscreenDialogTransitionWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CupertinoFullscreenDialogTransition'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Center(child: Text('暂无')),
    );
  }
}
