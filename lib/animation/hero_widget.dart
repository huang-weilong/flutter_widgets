import 'package:flutter/material.dart';

const double _kMinFlingVelocity = 800.0;

class HeroWidget extends StatefulWidget {
  @override
  _HeroWidgetState createState() => _HeroWidgetState();
}

///英雄动画，tag相同的触发英雄动画。
class _HeroWidgetState extends State<HeroWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('英雄动画'),
          centerTitle: true,
          elevation: 0.0,
          bottom: PreferredSize(
            child: Text(
              '点击触发英雄动画',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            preferredSize: Size.fromHeight(30.0),
          ),
        ),
        backgroundColor: Colors.grey,
        body: Center(
          child: GestureDetector(
            child: Hero(
              child: Image.asset(
                'assets/images/my_painting.jpg',
                width: 100.0,
              ),
              tag: 'long',
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => _HeroTest()));
            },
          ),
        ));
  }
}

class _HeroTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          color: Colors.black,
        ),
        Positioned(
          bottom: 0.0,
          top: 0.0,
          left: 0.0,
          right: 0.0,
          child: GestureDetector(
            child: Hero(
              child: ScaleImage(
                imgDir: 'assets/images/my_painting.jpg',
              ),
              tag: 'long',
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ),
      ],
    );
  }
}

class ScaleImage extends StatefulWidget {
  ScaleImage({Key key, this.imgDir}) : super(key: key);

  final String imgDir;

  @override
  _ScaleImageState createState() => _ScaleImageState();
}

class _ScaleImageState extends State<ScaleImage> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<Offset> _flingAnimation;
  Offset _offset = Offset.zero;
  double _scale = 1.0;
  Offset _normalizedOffset;
  double _previousScale;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this)..addListener(_handleFlingAnimation);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onScaleStart: _handleOnScaleStart,
      onScaleUpdate: _handleOnScaleUpdate,
      onScaleEnd: _handleOnScaleEnd,
      child: Transform(
        transform: Matrix4.identity()
          ..translate(_offset.dx, _offset.dy)
          ..scale(_scale),
        child: Image.asset(
          widget.imgDir,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Offset _clampOffset(Offset offset) {
    final Size size = context.size;
    final Offset minOffset = Offset(size.width, size.height) * (1.0 - _scale);
    return Offset(offset.dx.clamp(minOffset.dx, 0.0), offset.dy.clamp(minOffset.dy, 0.0));
  }

  void _handleFlingAnimation() {
    setState(() {
      _offset = _flingAnimation.value;
    });
  }

  void _handleOnScaleStart(ScaleStartDetails details) {
    setState(() {
      _previousScale = _scale;
      _normalizedOffset = (details.focalPoint - _offset) / _scale;
      // The fling animation stops if an input gesture starts.
      _controller.stop();
    });
  }

  void _handleOnScaleUpdate(ScaleUpdateDetails details) {
    setState(() {
      _scale = (_previousScale * details.scale).clamp(1.0, 4.0);
      // Ensure that image location under the focal point stays in the same place despite scaling.
      _offset = _clampOffset(details.focalPoint - _normalizedOffset * _scale);
    });
  }

  void _handleOnScaleEnd(ScaleEndDetails details) {
    final double magnitude = details.velocity.pixelsPerSecond.distance;
    if (magnitude < _kMinFlingVelocity) return;
    final Offset direction = details.velocity.pixelsPerSecond / magnitude;
    final double distance = (Offset.zero & context.size).shortestSide;
    _flingAnimation = Tween<Offset>(begin: _offset, end: _clampOffset(_offset + direction * distance)).animate(_controller);
    _controller
      ..value = 0.0
      ..fling(velocity: magnitude / 1000.0);
  }
}
