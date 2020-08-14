import 'package:flutter/material.dart';

class NavigatorWidget extends StatefulWidget {
  @override
  _NavigatorWidgetState createState() => _NavigatorWidgetState();
}

class _NavigatorWidgetState extends State<NavigatorWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Navigator'),
        elevation: 0.0,
        centerTitle: true,
        bottom: PreferredSize(
          child: Text(
            '局部页面跳转',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          preferredSize: Size.fromHeight(30.0),
        ),
      ),
      body: Center(
        child: Container(
          height: 350,
          width: 300,
          child: Navigator(
            initialRoute: '/',
            onGenerateRoute: (RouteSettings settins) {
              WidgetBuilder builder;
              switch (settins.name) {
                case '/':
                  builder = (context) => ContentPage();
                  break;
              }
              return MaterialPageRoute(builder: builder);
            },
          ),
        ),
      ),
    );
  }
}

class ContentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: ListTile(
          title: Text('跳转'),
          trailing: Icon(Icons.arrow_forward_ios),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => NewPage()));
          },
        ),
      ),
    );
  }
}

class NewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 250,
      color: Colors.blueGrey,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              Text('返回', style: TextStyle(color: Colors.white)),
            ],
          ),
        ],
      ),
    );
  }
}
