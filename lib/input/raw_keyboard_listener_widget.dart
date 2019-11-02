import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const int KEY_UP = 19;
const int KEY_DOWN = 20;
const int KEY_LEFT = 21;
const int KEY_RIGHT = 22;
const int KEY_CENTER = 23;
const int KEY_VOLUME_REDUCTION = 24;
const int KEY_VOLUME_INCREASE = 25;
const int KEY_BACK = 4;
const int KEY_MENU = 82;

class RawKeyboardListenerWidget extends StatefulWidget {
  @override
  _RawKeyboardListenerWidgetState createState() => _RawKeyboardListenerWidgetState();
}

class _RawKeyboardListenerWidgetState extends State<RawKeyboardListenerWidget> {
  FocusNode focusNode = FocusNode();
  String text = '';

  @override
  Widget build(BuildContext context) {
    FocusScope.of(context).requestFocus(focusNode);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('RawKeyboardListener'),
        centerTitle: true,
        elevation: 0.0,
        bottom: PreferredSize(
          child: Text(
            '每当用户按下或释放键盘上的键时调用回调的widget',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          preferredSize: Size.fromHeight(30.0),
        ),
      ),
      body: WillPopScope(
        onWillPop: () {
          return;
        },
        child: RawKeyboardListener(
          focusNode: focusNode,
          onKey: (RawKeyEvent event) {
            if (event is RawKeyDownEvent && event.data is RawKeyEventDataAndroid) {
              RawKeyDownEvent rawKeyDownEvent = event;
              RawKeyEventDataAndroid rawKeyEventDataAndroid = rawKeyDownEvent.data;
              switch (rawKeyEventDataAndroid.keyCode) {
                case KEY_MENU:
                  setState(() {
                    text = '菜单键';
                  });
                  break;
                case KEY_BACK:
                  setState(() {
                    text = '返回键';
                  });
                  break;
                case KEY_VOLUME_INCREASE:
                  setState(() {
                    text = '音量减';
                  });
                  break;
                case KEY_VOLUME_REDUCTION:
                  setState(() {
                    text = '音量增';
                  });
                  break;
              }
            }
          },
          child: Center(child: Text('按下了：$text')),
        ),
      ),
    );
  }
}
