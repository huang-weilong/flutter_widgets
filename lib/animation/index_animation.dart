import 'package:flutter/material.dart';
import 'package:flutter_widgets/animation/animated_builder_widget.dart';
import 'package:flutter_widgets/animation/animated_container_widget.dart';
import 'package:flutter_widgets/animation/animated_cross_fade_widget.dart';
import 'package:flutter_widgets/animation/animated_default_textStyle_widget.dart';
import 'package:flutter_widgets/animation/animated_list_state_widget.dart';
import 'package:flutter_widgets/animation/decorated_box_transition_widget.dart';
import 'package:flutter_widgets/animation/fade_transition_widget.dart';
import 'package:flutter_widgets/animation/hero_widget.dart';
import 'package:flutter_widgets/animation/positioned_transition_widget.dart';
import 'package:flutter_widgets/animation/rotation_transition_widget.dart';
import 'package:flutter_widgets/animation/scale_transition_widget.dart';
import 'package:flutter_widgets/animation/size_transition_widget.dart';
import 'package:flutter_widgets/animation/slide_transition_widget.dart';

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
      {'title': 'AnimatedCrossFade', 'page': AnimatedCrossFadeWidget()},
      {'title': 'Hero', 'page': HeroWidget()},
      {'title': 'AnimatedBuilder', 'page': AnimatedBuilderWidget()},
      {'title': 'DecoratedBoxTransition', 'page': DecoratedBoxTransitionWidget()},
      {'title': 'FadeTransition', 'page': FadeTransitionWidget()},
      {'title': 'PositionedTransition', 'page': PositionedTransitionWidget()},
      {'title': 'RotationTransition', 'page': RotationTransitionWidget()},
      {'title': 'ScaleTransition', 'page': ScaleTransitionWidget()},
      {'title': 'SizeTransition', 'page': SizeTransitionWidget()},
      {'title': 'SlideTransition', 'page': SlideTransitionWidget()},
      {'title': 'AnimatedDefaultTextStyle', 'page': AnimatedDefaultTextStyleWidget()},
      {'title': 'AnimatedListState', 'page': AnimatedListStateWidget()},
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('动画和Motion'),
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
