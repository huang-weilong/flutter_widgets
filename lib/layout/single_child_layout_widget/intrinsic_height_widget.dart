import 'package:flutter/material.dart';

class IntrinsicHeightWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('IntrinsicHeight'),
        centerTitle: true,
        elevation: 0.0,
        bottom: PreferredSize(
          child: Text(
            '可以将其子级调整为子级的内在高度',
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
                          Text('橙色：h:100.0 w:50.0, 绿色：w:100.0'),
                          Text('右边包裹了IntrinsicHeight绿色的高度被调整至合理的高度，不再是无限高，即限制的和橙色一样'),
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
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                height: 100.0,
                width: 50.0,
                color: Colors.orange,
              ),
              Container(
                width: 100.0,
                color: Colors.green,
              )
            ],
          ),
          IntrinsicHeight(
            child: Row(
              children: <Widget>[
                Container(
                  height: 100.0,
                  width: 50.0,
                  color: Colors.orange,
                ),
                Container(
                  width: 100.0,
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
