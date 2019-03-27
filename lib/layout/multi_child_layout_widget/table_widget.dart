import 'package:flutter/material.dart';

class TableWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Table'),
        centerTitle: true,
        elevation: 0.0,
        bottom: PreferredSize(
          child: Text(
            '为其子widget使用表格布局算法的widget',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          preferredSize: Size.fromHeight(30.0),
        ),
      ),
      body: Table(
        //设置每一列的宽度
//        columnWidths: <int, TableColumnWidth>{
//          0: FixedColumnWidth(80.0),
//          1: FixedColumnWidth(80.0),
//          2: FixedColumnWidth(80.0),
//          3: FixedColumnWidth(80.0),
//        },
        border: TableBorder.all(color: Colors.black, width: 1.0, style: BorderStyle.solid),
        children: [
          TableRow(
            children: <Widget>[
              Text('A1'),
              Text('B1'),
              Text('C1'),
              Text('D1'),
            ],
          ),
          TableRow(
            children: <Widget>[
              Text('A2'),
              Text('B2'),
              Text('C2'),
              Text('D2'),
            ],
          ),
          TableRow(
            children: <Widget>[
              Text('A3'),
              Text('B3'),
              Text('C3'),
              Text('D3'),
            ],
          ),
        ],
      ),
    );
  }
}
