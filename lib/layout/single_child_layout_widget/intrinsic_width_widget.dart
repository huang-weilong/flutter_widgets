import 'package:flutter/material.dart';

class IntrinsicWidthWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('IntrinsicWidth'),
        centerTitle: true,
        elevation: 0.0,
        bottom: PreferredSize(
          child: Text(
            '将子级的大小调整为子级的内部宽度',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          preferredSize: Size.fromHeight(30.0),
        ),
        actions: <Widget>[
          IconButton(
            icon: Text('描述'),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return Container(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 80.0),
                      child: Column(
                        children: <Widget>[
                          Text('橙色：h:100.0 w:50.0, 绿色：h:100.0'),
                          Text('下面的包裹了IntrinsicWidth绿色的宽度被调整至合理的宽度，不再是无限宽，即限制的和橙色一样'),
                          Text('由于效率问题，请尽量少使用这个widget', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0))
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                height: 100.0,
                width: 50.0,
                color: Colors.orange,
              ),
              Container(
                height: 100.0,
                color: Colors.green,
              )
            ],
          ),
          IntrinsicWidth(
            child: Column(
              children: <Widget>[
                Container(
                  height: 100.0,
                  width: 50.0,
                  color: Colors.orange,
                ),
                Container(
                  height: 100.0,
                  color: Colors.green,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
