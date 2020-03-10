import 'package:flutter/material.dart';
/// 如何进行Flutter布局开发
class FlutterLayoutPage extends StatefulWidget {
  @override
  _FlutterLayoutPage createState() => _FlutterLayoutPage();
}

class _FlutterLayoutPage extends State<FlutterLayoutPage> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '如何进行Flutter布局开发',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text('如何进行Flutter布局开发'),
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
        RefreshIndicator(
          child: Container(
          decoration: BoxDecoration(color: Colors.white),
          child: Column(children: <Widget>[
            Row(
              children: <Widget>[
                ClipOval(
                  child: SizedBox(
                    height: 100,
                    width: 100,
                    child: Image.network('https://dss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3173584241,3533290860&fm=26&gp=0.jpg'),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Opacity(
                      opacity: 0.6,
                      child: Image.network(
                        'https://dss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3173584241,3533290860&fm=26&gp=0.jpg',
                        height: 50,
                        width: 50,
                      ),
                    ),
                  ),
                ),
              ],
            ),
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
              margin: EdgeInsets.all(10),
              child: PhysicalModel(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(6),
                clipBehavior: Clip.antiAlias, // 抗锯齿
                child: PageView(
                  children: <Widget>[
                    _item('page1', Colors.blue),
                    _item('page2', Colors.yellow),
                    _item('page3', Colors.red)
                  ],
                ),
              ),
            ),
            Column(
              children: <Widget>[
                FractionallySizedBox(
                  widthFactor: 1,
                  child: Container(
                    decoration: BoxDecoration(color: Colors.green),
                    child: Text(
                      '宽度撑满',
                      style: TextStyle(
                        color:Colors.red
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Stack(
              children: <Widget>[
                Image.network(
                  'https://dss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3173584241,3533290860&fm=26&gp=0.jpg',
                  width: 100,
                  height: 100,
                ),
                Positioned(
                  left: 10,
                  bottom: 0,
                  child: Image.network(
                    'https://dss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=3173584241,3533290860&fm=26&gp=0.jpg',
                    width: 36,
                    height: 36,
                  ),
                ),
              ],
            ),
            Wrap(
              spacing: 5,
              runSpacing: 5,
              children: <Widget>[
                _cilp('Flutter'),
                _cilp('实战'),
                _cilp('实战'),
                _cilp('携程'),
                _cilp('教程'),
                _cilp('学习'),
                _cilp('学习'),
              ],
            ),
          ],
        ),
      ),
      onRefresh: _handleRefresh) // 当发生下拉的时候会执行onRefresh
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

  _cilp(String label) {
    return Chip(
      label: Text(label),
      avatar: CircleAvatar(
        backgroundColor: Colors.blue.shade100,
        child: Text(
          label.substring(0,1),
          style: TextStyle(fontSize: 10),
        ),
      ),
    );
  }
}