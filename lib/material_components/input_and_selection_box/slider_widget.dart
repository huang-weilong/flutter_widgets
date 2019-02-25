import 'dart:async';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class SliderWidget extends StatefulWidget {
  @override
  _SliderWidgetState createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  double _value1 = 20.0;
  double _value2 = 20.0;
  double _value3 = 35.0;
  Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _value1++;
        print(_value1);
        print(_value1 == 99.0);
        if (_value1 > 99.0) {
          _value1 = 0.0;
        }
      });
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  addTimer() {
    _value1++;
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider'),
        centerTitle: true,
        elevation: 0.0,
        bottom: PreferredSize(
          child: Text(
            '滑块，允许用户通过滑动滑块来从一系列值中选择',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          preferredSize: Size.fromHeight(30.0),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Slider(
            value: _value1,
            min: 0.0,
            max: 100.0,
            onChanged: (double value) {
              setState(() {
                _value1 = value;
              });
            },
          ),
          Slider(
            value: 0.35,
            onChanged: null,
          ),
          Slider(
            value: _value2,
            min: 0.0,
            max: 100.0,
            divisions: 5,
            label: '${_value2.round()}',
            onChanged: (double value) {
              setState(() {
                _value2 = value;
              });
            },
          ),
          SliderTheme(
            data: theme.sliderTheme.copyWith(
              activeTrackColor: Colors.deepPurple,
              inactiveTrackColor: Colors.black26,
              activeTickMarkColor: Colors.white70,
              inactiveTickMarkColor: Colors.black,
              overlayColor: Colors.black12,
              thumbColor: Colors.deepPurple,
              valueIndicatorColor: Colors.deepPurpleAccent,
              thumbShape: _CustomThumbShape(),
              valueIndicatorShape: _CustomValueIndicatorShape(),
              valueIndicatorTextStyle: theme.accentTextTheme.body2.copyWith(color: Colors.black87),
            ),
            child: Slider(
              value: _value3,
              min: 0.0,
              max: 100.0,
              divisions: 5,
              semanticFormatterCallback: (double value) => value.round().toString(),
              label: '${_value3.round()}',
              onChanged: (double value) {
                setState(() {
                  _value3 = value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _CustomThumbShape extends SliderComponentShape {
  static const double _thumbSize = 4.0;
  static const double _disabledThumbSize = 3.0;

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return isEnabled ? const Size.fromRadius(_thumbSize) : const Size.fromRadius(_disabledThumbSize);
  }

  static final Tween<double> sizeTween = new Tween<double>(
    begin: _disabledThumbSize,
    end: _thumbSize,
  );

  @override
  void paint(
    PaintingContext context,
    Offset thumbCenter, {
    Animation<double> activationAnimation,
    Animation<double> enableAnimation,
    bool isDiscrete,
    TextPainter labelPainter,
    RenderBox parentBox,
    SliderThemeData sliderTheme,
    TextDirection textDirection,
    double value,
  }) {
    final Canvas canvas = context.canvas;
    final ColorTween colorTween = new ColorTween(
      begin: sliderTheme.disabledThumbColor,
      end: sliderTheme.thumbColor,
    );
    final double size = _thumbSize * sizeTween.evaluate(enableAnimation);
    final Path thumbPath = _triangle(size, thumbCenter);
    canvas.drawPath(thumbPath, new Paint()..color = colorTween.evaluate(enableAnimation));
  }
}

Path _triangle(double size, Offset thumbCenter, {bool invert = false}) {
  final Path thumbPath = new Path();
  final double height = math.sqrt(3.0) / 2.0;
  final double halfSide = size / 2.0;
  final double centerHeight = size * height / 3.0;
  final double sign = invert ? -1.0 : 1.0;
  thumbPath.moveTo(thumbCenter.dx - halfSide, thumbCenter.dy + sign * centerHeight);
  thumbPath.lineTo(thumbCenter.dx, thumbCenter.dy - 2.0 * sign * centerHeight);
  thumbPath.lineTo(thumbCenter.dx + halfSide, thumbCenter.dy + sign * centerHeight);
  thumbPath.close();
  return thumbPath;
}

class _CustomValueIndicatorShape extends SliderComponentShape {
  static const double _indicatorSize = 4.0;
  static const double _disabledIndicatorSize = 3.0;
  static const double _slideUpHeight = 40.0;

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return new Size.fromRadius(isEnabled ? _indicatorSize : _disabledIndicatorSize);
  }

  static final Tween<double> sizeTween = new Tween<double>(
    begin: _disabledIndicatorSize,
    end: _indicatorSize,
  );

  @override
  void paint(
    PaintingContext context,
    Offset thumbCenter, {
    Animation<double> activationAnimation,
    Animation<double> enableAnimation,
    bool isDiscrete,
    TextPainter labelPainter,
    RenderBox parentBox,
    SliderThemeData sliderTheme,
    TextDirection textDirection,
    double value,
  }) {
    final Canvas canvas = context.canvas;
    final ColorTween enableColor = new ColorTween(
      begin: sliderTheme.disabledThumbColor,
      end: sliderTheme.valueIndicatorColor,
    );
    final Tween<double> slideUpTween = new Tween<double>(
      begin: 0.0,
      end: _slideUpHeight,
    );
    final double size = _indicatorSize * sizeTween.evaluate(enableAnimation);
    final Offset slideUpOffset = new Offset(0.0, -slideUpTween.evaluate(activationAnimation));
    final Path thumbPath = _triangle(
      size,
      thumbCenter + slideUpOffset,
      invert: true,
    );
    final Color paintColor = enableColor.evaluate(enableAnimation).withAlpha((255.0 * activationAnimation.value).round());
    canvas.drawPath(
      thumbPath,
      new Paint()..color = paintColor,
    );
    canvas.drawLine(
        thumbCenter,
        thumbCenter + slideUpOffset,
        new Paint()
          ..color = paintColor
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2.0);
    labelPainter.paint(canvas, thumbCenter + slideUpOffset + new Offset(-labelPainter.width / 2.0, -labelPainter.height - 4.0));
  }
}
