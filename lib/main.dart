import 'package:flutter/material.dart';
import 'package:flutter_tt/PhotoApp.dart';
import 'package:flutter_tt/animation/logo_app.dart';
import 'package:flutter_tt/animation/transitions.dart';
import 'package:flutter_tt/app_fifecycle.dart';
import 'package:flutter_tt/flutter_layout_page.dart';
import 'package:flutter_tt/flutter_widget_lifecycle.dart';
import 'package:flutter_tt/gesture_page.dart';
import 'package:flutter_tt/launch_page.dart';
import 'package:flutter_tt/less_group.dart';
import 'package:flutter_tt/plugin_use.dart';
import 'package:flutter_tt/res_page.dart';
import 'package:flutter_tt/stateFullGroup.dart';

void main() => runApp(MaterialApp(
  home: HeroAnimation(),
));
class DynamicTheme extends StatefulWidget {
  @override
  _DynamicThemeState createState() => _DynamicThemeState();
}

class _DynamicThemeState extends State<DynamicTheme> {
  Brightness _brightness = Brightness.light; // 默认日间模式
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '111Flutter Demo',
      theme: ThemeData(
        // fontFamily: 'RubikMonoOne', // 设置全局字体
        brightness: _brightness,
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('如何创建和使用Flutter的路由与导航？'),
        ),
        body: Column(
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                setState(() {
                  if (_brightness == Brightness.light) {
                    _brightness = Brightness.dark;
                  } else {
                    _brightness = Brightness.light;
                  }
                });
              },
              child: Text('flutter切换模式', style: TextStyle(fontFamily: 'RubikMonoOne'),),
            ),
            RouteNavigator()
          ],
        ),
      ),
      routes: <String, WidgetBuilder> {
        'plugin': (BuildContext context) => PluginUse(),
        'less': (BuildContext context) => LessGroup(),
        'ful': (BuildContext context) => StatefullGroup(),
        'layout': (BuildContext context) => FlutterLayoutPage(),
        'gesture': (BuildContext context) => GesturePage(),
        'res': (BuildContext context) => ResPage(),
        'launch': (BuildContext context) => LaunchPage(),
        'widgetLifecycle': (BuildContext context) => WidgetLifecycle(),
        'appLifecycle': (BuildContext context) => AppLifecycle(),
        'photoApp': (BuildContext context) => PhotoApp(),
        'logoApp': (BuildContext context) => LogoApp(),
        'heroAnimation': (BuildContext context) => HeroAnimation(),
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
          _item('如何导入和使用Flutter的资源文件？', ResPage(), 'res'),
          _item('如何打开第三方应用？', LaunchPage(), 'launch'),
          _item('flutter页面生命周期', WidgetLifecycle(), 'widgetLifecycle'),
          _item('如何获取Flutter应用生命周期', AppLifecycle(), 'appLifecycle'),
          _item('拍照测试', PhotoApp(), 'photoApp'),
          _item('logoApp', LogoApp(), 'logoApp'),
          _item('hero动画', HeroAnimation(), 'heroAnimation'),
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
