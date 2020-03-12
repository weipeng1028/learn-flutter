import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
class PhotoHero extends StatelessWidget {
  final String photo;
  final VoidCallback onTap;
  final double width;

  const PhotoHero({Key key, this.photo, this.onTap, this.width}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      // tag关联,链接id，唯一的
      child: Hero(tag: photo, child: Material(
        color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            child: Image.network(photo, fit: BoxFit.fill,),
          ),
      )),
    );
  }
}
class HeroAnimation extends StatelessWidget {
  Widget build(BuildContext context) {
    timeDilation = 3.0;
    return Scaffold(
      appBar: AppBar(
        title: Text('hero animation'),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios
          ),
        ),
      ),
      body: Center(
        child: PhotoHero(
          photo: 'https://www.devio.org/img/avatar.png',
          width: 200,
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context){
              return Scaffold(
                appBar: AppBar(
                  title: Text('Flippers Page'),
                ),
                body: Container(
                  color: Colors.lightBlueAccent,
                  padding: EdgeInsets.all(16),
                  alignment: Alignment.topLeft,
                  child: PhotoHero(
                    photo: 'https://www.devio.org/img/avatar.png',
                    width: 100,
                    onTap: () {
                      // 跳出当前页面
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              );
            }));
          },
        ),
      ),
    );
  }
}