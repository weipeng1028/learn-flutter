import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
/// 如何打开第三方应用？
class LaunchPage extends StatefulWidget {
  LaunchPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LaunchPage createState() => _LaunchPage();
}

class _LaunchPage extends State<LaunchPage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('如何使用Fluuter的包和插件？'),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back
          ),
        ),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: () => _launchURL(),
              child: Text('点我外部连接'),
            ),
            RaisedButton(
              onPressed: () => _openMap(),
              child: Text('点我去地图'),
            )
          ],
        ),
      ),
    );
  }
}
_launchURL() async {
  const url = 'https://flutter.cn';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
_openMap() async {
  const url = 'geo:52.32,4.917'; // APP提供者提供的schema
  // android
  if (await canLaunch(url)) {
    try {
      await launch(url);
    } catch (e) {
      throw 'Could not lanuch $url';
    }
  } else {
    // iOS 13
    const url = 'http://maps.apple.com/?ll=116.322594,39.838373';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not lanuch $url';
    }
  }
}
