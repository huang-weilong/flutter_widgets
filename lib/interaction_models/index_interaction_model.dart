import 'package:flutter/material.dart';
import 'package:flutter_widgets/interaction_models/gesture_detector_widget.dart';
import 'package:flutter_widgets/interaction_models/long_press_draggable_widget.dart';

class IndexInteractionModel extends StatefulWidget {
  @override
  _IndexInteractionModelState createState() => _IndexInteractionModelState();
}

class _IndexInteractionModelState extends State<IndexInteractionModel> {
  List<Map> page;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    page = [
      {'title': 'LongPressDraggable', 'page': LongPressDraggableWidget()},
      {'title': 'GestureDetector', 'page': GestureDetectorWidget()}
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('交互模型'),
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