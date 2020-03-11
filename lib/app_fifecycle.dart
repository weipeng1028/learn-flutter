import 'package:flutter/material.dart';
// 如何获取Flutter应用生命周期
// WidgetsBindingObserver:是一个Widgets绑定观察期，通过它完美可以监听应用的生命周期、语言
class AppLifecycle extends StatefulWidget {
  @override

  _AppLifecycleState createState() => _AppLifecycleState();
}

class _AppLifecycleState extends State<AppLifecycle> with WidgetsBindingObserver{
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('如何获取Flutter应用生命周期'),
        leading: BackButton(),
      ),
      body: Container(
        child: Text('如何获取Flutter应用生命周期'),
      ),
    );
  }
  // 重写didChangeAppLifecycleState
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    print('------state------$state');
    if (state == AppLifecycleState.paused) {
      print('app进入后台');
    } else if (state == AppLifecycleState.resumed) {
      print('app进入前台');
    } else if (state == AppLifecycleState.inactive) {
      // 不常用 应用程序处于非活动状态，并且未接受用户输入时的调用，比如：来了个电话
    }
  }
  // 移除
  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}