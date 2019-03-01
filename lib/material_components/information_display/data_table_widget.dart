import 'package:flutter/material.dart';

class DataTableWidget extends StatefulWidget {
  @override
  _DataTableWidgetState createState() => _DataTableWidgetState();
}

class _DataTableWidgetState extends State<DataTableWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DataTable'),
        centerTitle: true,
        elevation: 0.0,
        bottom: PreferredSize(
          child: Text(
            '数据表显示原始数据集。它们通常出现在桌面企业产品中。DataTable Widget实现这个组件',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          preferredSize: Size.fromHeight(30.0),
        ),
      ),
      body: Column(
        children: <Widget>[
          DataTable(
            // 表头
            columns: [
              DataColumn(label: Text('fruit')),
              DataColumn(label: Text('price')),
            ],
            // 内容行
            rows: [
              DataRow(
                cells: [
                  DataCell(Text('apple')),
                  DataCell(Text('￥6.30')),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(Text('banana')),
                  DataCell(Text('￥7.20')),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
