import 'package:flutter/material.dart';

class StepperWidget extends StatefulWidget {
  @override
  _StepperWidgetState createState() => _StepperWidgetState();
}

class _StepperWidgetState extends State<StepperWidget> {
  int _currentStep = 0;
  List<Map<String, dynamic>> dataMap = [
    {
      'title': '第①步',
      'subTitle': '第①步小标题',
      'content': '一个Material Design 步骤指示器，显示一系列步骤的过程',
      'isActive': true,
    },
    {
      'title': '第②步',
      'subTitle': '第②步小标题',
      'content':
          'Steppers are particularly useful in the case of forms where one step requires the completion of another one, or where multiple steps need to be completed in order to submit the whole form.',
      'isActive': false,
    },
    {
      'title': '第③步',
      'subTitle': '第③步小标题',
      'content': 'The widget is a flexible wrapper.',
      'isActive': false,
    },
    {
      'title': '第④步',
      'subTitle': '第④步小标题',
      'content': 'The widget is a flexible wrapper.',
      'isActive': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stepper'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Stepper(
        steps: dataMap.map((item) {
          return Step(
            state: item['isActive'] ? StepState.complete : StepState.indexed,
            title: Text(item['title']),
            subtitle: Text(item['subTitle']),
            content: Text(item['content']),
            isActive: item['isActive'],
          );
        }).toList(),
//        type: StepperType.horizontal,
        currentStep: _currentStep,
        onStepTapped: (int index) {
          setState(() {
            _currentStep = index;
            for (int i = 0; i <= index; i++) {
              dataMap[i]['isActive'] = true;
            }
            for (int i = index + 1; i < dataMap.length; i++) {
              dataMap[i]['isActive'] = false;
            }
          });
        },
        onStepContinue: () {
          setState(() {
            if (_currentStep < 3) {
              _currentStep++;
              dataMap[_currentStep]['isActive'] = true;
            }
          });
        },
        onStepCancel: () {
          setState(() {
            if (_currentStep > 0) {
              dataMap[_currentStep]['isActive'] = false;
              _currentStep--;
            }
          });
        },
      ),
    );
  }
}
