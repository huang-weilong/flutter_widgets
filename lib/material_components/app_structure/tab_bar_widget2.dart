import 'package:flutter/material.dart';

class TabBarWidget2 extends StatefulWidget {
  @override
  _TabBarWidget2State createState() => _TabBarWidget2State();
}

class _TabBarWidget2State extends State<TabBarWidget2> with SingleTickerProviderStateMixin {
  TabController _tabController;
  bool change = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 4);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('使用了TabController'),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            tooltip: 'Previous choice',
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              _nextPage(-1);
            },
          ),
          IconButton(
            icon: Icon(Icons.arrow_forward),
            tooltip: 'Next choice',
            onPressed: () {
              _nextPage(1);
            },
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(48.0),
          child: Container(
            height: 48.0,
            alignment: Alignment.center,
            child: change
                ? TabPageSelector(
                    controller: _tabController,
                    color: Colors.transparent,
                    selectedColor: Colors.white,
                  )
                : TabBar(
                    isScrollable: true,
                    controller: _tabController,
                    indicatorColor: Colors.transparent,
                    tabs: <Widget>[Text('TabBar1'), Text('TabBar2'), Text('TabBar3'), Text('TabBar4')],
                  ), //滑动的小圆,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            change = !change;
          });
        },
        child: Icon(Icons.change_history),
      ),
      body: TabBarView(
        //TabBar内容
        controller: _tabController,
        children: <Widget>[
          Text('TabBarView1的内容\n添加key: PageStorageKey(\'tab2\'),可以使tabbarview保持当前状态。\n\nTabBar2添加了，TabBar3未添加'),
          ListView.builder(
            key: PageStorageKey('tab2'),
            itemCount: 60,
            itemBuilder: (BuildContext context, int index) {
              return Text('-----$index');
            },
          ),
          ListView.builder(
//            key: PageStorageKey('tab3'),
            itemCount: 60,
            itemBuilder: (BuildContext context, int index) {
              return Text('-----$index');
            },
          ),
          Text('TabBarView4的内容'),
        ],
      ),
    );
  }

  void _nextPage(int delta) {
    int index = _tabController.index + delta;
    if (index < 0 || index >= _tabController.length) return;
    _tabController.animateTo(index);
  }
}
