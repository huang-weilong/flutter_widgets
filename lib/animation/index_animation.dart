import 'package:flutter/material.dart';
import 'package:flutter_widgets/animation/animated_container_widget.dart';

class IndexAnimation extends StatefulWidget {
  @override
  _IndexAnimationState createState() => _IndexAnimationState();
}

class _IndexAnimationState extends State<IndexAnimation> {
  List<Map> page;

  @override
  void initState() {
    super.initState();
    page = [
      {'title': 'AnimatedContainer', 'page': AnimatedContainerWidget()},
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('表单 Widgets'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: ListView(
        children: page.map((item) {
          return ListTile(
            title: Text(item['title']),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) => item['page']));
            },
          );
        }).toList(),
      ),
    );
  }
}
