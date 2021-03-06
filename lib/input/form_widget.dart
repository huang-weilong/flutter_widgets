import 'package:flutter/material.dart';

class FormWidget extends StatefulWidget {
  @override
  _FormWidgetState createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController controller = TextEditingController();
  String text = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form'),
        centerTitle: true,
        elevation: 0.0,
        bottom: PreferredSize(
          child: Text(
            '一个可选的、用于给多个TextField分组的widget',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          preferredSize: Size.fromHeight(30.0),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('请输入一个电话号码'),
            TextFormField(
              controller: controller,
              validator: (value) {
                RegExp reg = new RegExp(r'^\d{11}$');
                if (!reg.hasMatch(value)) {
                  return '请输入11位手机号码';
                }
                return null;
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: RaisedButton(
                onPressed: () {
                  setState(() {
                    if (_formKey.currentState.validate()) {
                      text = '输入正确';
                    } else {
                      text = '输入错误';
                    }
                  });
                },
                child: Text('Submit'),
              ),
            ),
            Text('result = $text'),
          ],
        ),
      ),
    );
  }
}
