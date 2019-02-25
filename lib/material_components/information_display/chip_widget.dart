import 'package:flutter/material.dart';

class ChipWidget extends StatefulWidget {
  @override
  _ChipWidgetState createState() => _ChipWidgetState();
}

class _ChipWidgetState extends State<ChipWidget> {
  bool select = false;
  int _value = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chip'),
        centerTitle: true,
        elevation: 0.0,
        bottom: PreferredSize(
          child: Text(
            '标签，它可以将一个复杂内容实体展现在一个小块中，如联系人',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          preferredSize: Size.fromHeight(30.0),
        ),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Chip(
              avatar: CircleAvatar(
                backgroundColor: Colors.grey.shade800,
                child: Text('H'),
              ),
              label: Text('huangweilong'),
            ),
            Chip(
              label: Text('长按删除图标'),
              labelStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              labelPadding: EdgeInsets.symmetric(horizontal: 30.0),
              deleteIcon: Icon(Icons.delete),
              onDeleted: () {},
              deleteIconColor: Colors.black,
              deleteButtonTooltipMessage: '删除提示信息',
              backgroundColor: Color(0xff4ea5fd),
            ),
            Chip(
              padding: EdgeInsets.symmetric(horizontal: 100.0, vertical: 20.0),
              avatar: CircleAvatar(
                backgroundColor: Colors.grey.shade800,
                child: Text('H'),
              ),
              label: Text('huangweilong'),
            ),
            InputChip(
              label: Text('InputChip,长按查看描述'),
              onPressed: () {},
              tooltip: '一个代表复杂信息的Chip',
            ),
            Wrap(
              children: List<Widget>.generate(3, (int index) {
                return ChoiceChip(
                  selectedColor: Colors.greenAccent,
                  label: Text('ChoiceChip $index'),
                  selected: _value == index,
                  onSelected: (bool selected) {
                    setState(() {
                      _value = selected ? index : null;
                    });
                  },
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
