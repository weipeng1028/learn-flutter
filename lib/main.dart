import 'package:flutter/material.dart';
import 'package:flutter_tt/flutter_layout_page.dart';
import 'package:flutter_tt/gesture_page.dart';
import 'package:flutter_tt/less_group.dart';
import 'package:flutter_tt/plugin_use.dart';
import 'package:flutter_tt/res_page.dart';
import 'package:flutter_tt/stateFullGroup.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '111Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('RouteNavigator()'),
        ),
        body: RouteNavigator()
      ),
      routes: <String, WidgetBuilder> {
        'plugin': (BuildContext context) => PluginUse(),
        'less': (BuildContext context) => LessGroup(),
        'ful': (BuildContext context) => StatefullGroup(),
        'layout': (BuildContext context) => FlutterLayoutPage(),
        'gesture': (BuildContext context) => GesturePage(),
        'res': (BuildContext context) => ResPage()
      },
    );
  }
}

class RouteNavigator extends StatefulWidget {
  @override
  _RouteNavigatorState createState() => _RouteNavigatorState();
}

class _RouteNavigatorState extends State<RouteNavigator> {
  bool byName = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          SwitchListTile(
            title: Text('${byName?'':'不'}通过路由名跳转'),
            value: byName, onChanged: (value){
            setState(() {
              byName = value;
            });
          }),
          _item('如何使用Fluuter的包和插件？', PluginUse(), 'plugin'),
          _item('StatelessWidget的使用', LessGroup(), 'less'),
          _item('statefullWidget基础组件', StatefullGroup(), 'ful'),
          _item('如何进行Flutter布局开发', FlutterLayoutPage(), 'layout'),
          _item('如何检测用户手势及处理点击事件', GesturePage(), 'gesture'),
          _item('如何导入和使用Flutter的资源文件？', ResPage(), 'res')
        ],
      ),
    );
  }

  _item(String title, page , String routeName) {
    return Container(
      child: RaisedButton(
        onPressed: () {
          if(byName) {
            Navigator.pushNamed(context, routeName);
          } else {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>page));
          }
        },
        child: Text(title),
      ),
    );
  }
}
