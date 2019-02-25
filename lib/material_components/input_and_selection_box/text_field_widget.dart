import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  @override
  _TextFieldWidgetState createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  TextEditingController controller = TextEditingController();
  FocusNode focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      print('===================123');
    });
    focusNode.addListener(() {
      print('===================456');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TextField'),
        centerTitle: true,
        elevation: 0.0,
        bottom: PreferredSize(
          child: Text('文本输入框'),
          preferredSize: Size.fromHeight(30.0),
        ),
      ),
      body: ListView(
        children: <Widget>[
          TextField(
            controller: controller,
            focusNode: focusNode,
            decoration: InputDecoration(labelText: 'Username'),
            maxLength: 100, // 最大长度，设置此项会让TextField右下角有一个输入数量的统计字符串
            maxLines: 1, //最大行数
            autocorrect: true, //是否自动更正
            style: TextStyle(fontSize: 30.0, color: Colors.blue), //输入文本的样式
            onChanged: (text) {
              //内容改变的回调
              print('当前内容为： $text');
            },
            onSubmitted: (text) {
              //内容提交(按回车)的回调
              print('submit： $text');
            },
          ),
          SizedBox(height: 10.0),
          TextField(
            decoration: InputDecoration(
              labelText: 'Password',
              fillColor: Colors.orange,
              filled: true,
              errorText: 'error text',
              prefixIcon: Icon(Icons.lock),
              suffixText: 'password',
            ),
            obscureText: true, //是否是密码
          ),
          SizedBox(height: 10.0),
          Theme(
            data: ThemeData(primaryColor: Colors.green, hintColor: Colors.orangeAccent),
            child: TextField(
              decoration: InputDecoration(
                hintText: '改变hintText颜色、边框颜色、边框',
                contentPadding: EdgeInsets.all(10.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
            ),
          ),
          SizedBox(height: 10.0),
          Container(
            padding: EdgeInsets.all(8.0),
            alignment: Alignment.center,
            height: 60.0,
            decoration: BoxDecoration(
              color: Colors.blueGrey,
              border: Border.all(color: Colors.black54, width: 4.0),
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: TextField(
              decoration: InputDecoration.collapsed(hintText: '使用Container的装饰'),
            ),
          ),
          SizedBox(height: 10.0),
          Container(
            decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.green))),
            child: SingleChildScrollView(
              reverse: true,
              child: TextField(
                maxLines: null,
                onChanged: (_) {
                  setState(() {});
                },
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: '可输入多行  maxLines: null',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
