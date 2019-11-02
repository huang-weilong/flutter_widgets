import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Text'),
        centerTitle: true,
        elevation: 0.0,
        bottom: PreferredSize(
          child: Text(
            'Text是单一格式的文本。',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          preferredSize: Size.fromHeight(30.0),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              '更改字体颜色',
              style: TextStyle(color: Colors.red),
            ),
            Text(
              '更改字体大小、加粗、斜体',
              style: TextStyle(
                fontSize: 26.0,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
            ),
            Text(
              '使用字体资源',
              style: TextStyle(fontSize: 20.0, fontFamily: 'pmzd'),
            ),
            Text(
              '单词间距、字符间距\nhello world',
              style: TextStyle(
                wordSpacing: 20.0, // 单词之间的距离（即空格的距离）
                letterSpacing: 10.0, // 每个字符的间距
              ),
            ),
            Text(
              '添加装饰效果',
              style: TextStyle(
                fontSize: 20.0,
                decoration: TextDecoration.combine([
                  TextDecoration.underline, // 下划线
                  TextDecoration.lineThrough, // 删除线
                  TextDecoration.overline, // 顶部线
                ]),
                decorationStyle: TextDecorationStyle.double, // 装饰样式
                decorationColor: Colors.blue, // 装饰颜色
              ),
            ),
            Container(
              width: 200.0,
              child: Text(
                '设置最大行数（2行），超过两行的将在末尾显示···，凑字数凑字数凑字数',
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
//              textScaleFactor: 1.1, // 缩放比例
              ),
            )
          ],
        ),
      ),
    );
  }
}
