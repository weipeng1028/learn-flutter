import 'package:flutter/material.dart';

class LessGroup extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = TextStyle(fontSize: 30);
    return MaterialApp(
      title: 'StatelessWidget的使用',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text('StatelessWidget的使用'),
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back
          ),
        ),
        ),
        body: Container(
          decoration: BoxDecoration(color: Colors.white),
          alignment: Alignment.center,
          child: Column(children: <Widget>[
            Text(
              'I am Text',
              style: textStyle,
            ),
            Icon(
              Icons.android,
              size: 50,
              color: Colors.red,
            ),
            CloseButton(),
            BackButton(),
            Chip(
              avatar: Icon(Icons.pan_tool),
              label: Text('StatelessWidget的Chip组件')
            ),
            Divider(
              indent: 20, // 左侧间距
              color: Colors.yellow,
              height: 20,
            ),
            Card(
              margin: EdgeInsets.all(10),
              color: Colors.blue,
              elevation: 5,
              child: Container(
                padding: EdgeInsets.all(10),
                child: Text(
                  'I am Card',
                  style: textStyle,
                ),
              ),
            ),
            AlertDialog(
              title: Text('盘它'),
              content: Text('你个糟老头子坏得很!'),
            ),
          ],)
        ),
      )
    );
  }
}