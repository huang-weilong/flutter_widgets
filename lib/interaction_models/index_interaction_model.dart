import 'package:flutter/material.dart';
import 'package:flutter_widgets/interaction_models/absorb_pointer_widget.dart';
import 'package:flutter_widgets/interaction_models/dismissible_widget.dart';
import 'package:flutter_widgets/interaction_models/drag_target_widget.dart';
import 'package:flutter_widgets/interaction_models/gesture_detector_widget.dart';
import 'package:flutter_widgets/interaction_models/ignore_pointer_widget.dart';
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
      {'title': 'GestureDetector', 'page': GestureDetectorWidget()},
      {'title': 'DragTarget', 'page': DragTargetWidget()},
      {'title': 'Dismissible', 'page': DismissibleWidget()},
      {'title': 'IgnorePointer', 'page': IgnorePointerWidget()},
      {'title': 'AbsorbPointer', 'page': AbsorbPointerWidget()},
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
