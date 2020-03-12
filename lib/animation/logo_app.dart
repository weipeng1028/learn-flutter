import 'package:flutter/material.dart';
class LogoApp extends StatefulWidget {
  @override
  _LogoAppState createState() => _LogoAppState();
}
// class AnimatedLogo extends AnimatedWidget {
//   AnimatedLogo({Key key, Animation<double> animation })
//   :super(key: key, listenable: animation);
//   @override
//   Widget build(BuildContext context) {
//     final Animation<double> animation = listenable;
//     return Center(
//       child: Container(
//         margin: EdgeInsets.symmetric(vertical: 10),
//         width: animation.value,
//         height: animation.value,
//         child: FlutterLogo(),
//       ),
//     );
//   }
// }
 class LogoWidget  extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: FlutterLogo(),
    );
  }
}
 class GrowTransition  extends StatelessWidget {
   // 构造了一个GrowTransition的类，使用了AnimatedBuilder，接收了animation和child两个参数
  GrowTransition({ this.child, this.animation });
  final Widget child;
  final Animation<double> animation;
  @override
  Widget build(BuildContext context) => Center(
    child: AnimatedBuilder(
      animation: animation,
      builder: (context, child) => Container(
        height: animation.value,
        width: animation.value,
        child: child,
      ),
      child: child,
    )
  );
}
class _LogoAppState extends State<LogoApp> with SingleTickerProviderStateMixin{
  Animation<double> animation;
  AnimationController controller;
  @override
  void initState() {
    super.initState();
    print('init');
    /// 初始化controller
    /// vsync 资源回收，看不见当前页时
    /// duration 设置动画执行时间
    controller = AnimationController(vsync: this,duration: Duration(seconds: 2));
    animation = Tween<double>(begin: 0,end: 300).animate(controller);
    controller.reset();
    controller.forward();
    ///..addListener 等价于 animation.addListener,..的意思为返回
    // ..addListener((){
    //   /// 两秒钟之内获取0-300的值 
    //   setState(() {
    //     animationValue = animation.value;
    //   });
    // })
    // ..addStatusListener((AnimationStatus state){
    //   setState(() {
    //     animationStatus = state;
    //   });
    // });
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    print('build');
    return new GrowTransition(animation: animation, child: LogoWidget(),);
  }
}