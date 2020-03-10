import 'package:flutter/material.dart';

class GesturePage extends StatefulWidget {
  @override
  _GesturePageState createState() => _GesturePageState();
}

class _GesturePageState extends State<GesturePage> {
  String printString = '';
  double moveX=0,moveY=0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('如何检测用户手势及处理点击事件'),
          leading: GestureDetector( 
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back
            ),
          ),
        ),
        // FractionallySizedBox 百分比布局
        body: FractionallySizedBox(
          widthFactor: 1,
          child: Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  GestureDetector(
                    onTap: (){
                      _printMsg('点击');
                    },
                    onDoubleTap: () => _printMsg('双击'),
                    onLongPress: () => _printMsg('长按'),
                    onTapCancel: () => _printMsg('取消'),
                    onTapUp: (e) => _printMsg('松开'),
                    onPanDown: (e) => _printMsg('按下'),
                    child: Container(
                      padding: EdgeInsets.all(60),
                      decoration: BoxDecoration(color: Colors.blue),
                      child: Text(
                        '点我',
                        style: TextStyle(color: Colors.white, fontSize: 36),
                      ),
                    ),
                  ),
                  Text(printString),
                ],
              ),
              Positioned(
                top: moveY,
                left: moveX,
                child: GestureDetector(
                  onPanUpdate: (e) => _doMove(e),
                  child: Container(
                    width: 72,
                    height: 72,
                    decoration: BoxDecoration(color: Colors.orange, borderRadius: BorderRadius.circular(32)),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _printMsg(String msg) {
    setState(() {
      printString += '  ,$msg';
    });
  }

  _doMove(DragUpdateDetails e) {
    setState(() {
      moveX += e.delta.dx;
      moveY += e.delta.dy;
    });
    print(e.delta.dx);
  }
}