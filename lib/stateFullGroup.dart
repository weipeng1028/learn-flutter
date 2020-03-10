import 'package:flutter/material.dart';
/// statefullWidget基础组件
class StatefullGroup extends StatefulWidget {
  @override
  _StatefullGroupState createState() => _StatefullGroupState();
}

class _StatefullGroupState extends State<StatefullGroup> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'statefullWidget基础组件',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text('statefullWidget基础组件'),
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back
          ),
        ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items:[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color:Colors.grey
              ),
              activeIcon: Icon(
                Icons.home,
                color: Colors.blue,
              ),
              title: Text('首页')
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.list,
                color:Colors.grey
              ),
              activeIcon: Icon(
                Icons.list,
                color: Colors.blue,
              ),
              title: Text('列表')
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: null,
          child: Text('点我'),
        ),
        body: _currentIndex==0
        ?
        RefreshIndicator(child: Container(
          decoration: BoxDecoration(color: Colors.white),
          alignment: Alignment.center,
          child: Column(children: <Widget>[
            Image.network(
              'https://dss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3173584241,3533290860&fm=26&gp=0.jpg',
              height: 50,
              width: 50,
            ),
            TextField(
              // 输入文本样式
              decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                hintText: '请输入',
                hintStyle: TextStyle(fontSize: 20)
              ),
            ),
            Container(
              height: 100,
              margin: EdgeInsets.only(top:20),
              child: PageView(
                children: <Widget>[
                  _item('page1', Colors.blue),
                  _item('page2', Colors.yellow),
                  _item('page3', Colors.red)
                ],
              ),
            ),
          ],)
        ), onRefresh: _handleRefresh) // 当发生下拉的时候会执行onRefresh
        :Column(
          children: <Widget>[
            Text('1列表'),
            Expanded(
              child: Container(
                decoration: BoxDecoration(color: Colors.red),
                child: Text('拉伸高度'),
              ),
            ),
          ],
        ),
      )
    );
  }
  Future<Null>_handleRefresh() async {
    await Future.delayed(Duration(milliseconds: 200));
  }

  _item(String title, Color color) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(color: color),
      child: Text(
        title, style:TextStyle(fontSize: 15, color: Colors.white),
      )
    );
  }
}