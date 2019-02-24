import 'package:flutter/material.dart';

class BottomSheetWidget extends StatefulWidget {
  @override
  _BottomSheetWidgetState createState() => _BottomSheetWidgetState();
}

class _BottomSheetWidgetState extends State<BottomSheetWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('showModalBottomSheet'),
        centerTitle: true,
        elevation: 0.0,
        bottom: PreferredSize(
          child: Text(
            '从屏幕底部滑起的列表（以显示更多的内容）',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          preferredSize: Size.fromHeight(30.0),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Builder(
              builder: (BuildContext context) {
                return RaisedButton(
                  onPressed: () {
                    showBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(color: Colors.blue),
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 80.0),
                            child: Text(
                              '下滑隐藏\n要使用Builder包裹才能正常使用',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.black, fontSize: 24.0),
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: Text('showBottomSheet'),
                );
              },
            ),
            RaisedButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(color: Colors.blue),
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 80.0),
                        child: Text(
                          '点击任意地方隐藏',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.black, fontSize: 24.0),
                        ),
                      ),
                    );
                  },
                ).whenComplete(() {
                  print('隐藏后执行的方法');
                });
              },
              child: Text('showModalBottomSheet'),
            ),
          ],
        ),
      ),
    );
  }
}
