import 'package:flutter/material.dart';

class ShowModalBottomSheetPage extends StatefulWidget {
  @override
  _ShowModalBottomSheetPageState createState() => _ShowModalBottomSheetPageState();
}

class _ShowModalBottomSheetPageState extends State<ShowModalBottomSheetPage> {
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
        child: RaisedButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return Container(
                  decoration: BoxDecoration(
                    border: Border(top: BorderSide(color: Colors.green)),
                    color: Colors.blue,
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 80.0),
                    child: Text(
                      '下滑隐藏',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.orange, fontSize: 24.0),
                    ),
                  ),
                );
              },
            );
          },
          child: Text('showModalBottomSheet'),
        ),
      ),
    );
  }
}
