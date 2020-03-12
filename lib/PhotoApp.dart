import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PhotoApp extends StatefulWidget {
  PhotoApp({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _PhotoApp createState() => _PhotoApp();
}

class _PhotoApp extends State<PhotoApp> {
  List<File> _images = [];

  Future getImage(bool isTakePhoto) async {
    // 解决选择相册图片后弹框不关闭问题
    Navigator.pop(context);
    // isTakePhoto为true拍照，false相册选择
    var image = await ImagePicker.pickImage(source: isTakePhoto?ImageSource.camera:ImageSource.gallery);
    setState(() {
      if (image != null) {
        _images.add(image);
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('拍照APP应用'),
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
        child: Wrap(
          spacing: 5,
          runSpacing: 5,
          children: _genImages(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _pickImage,
        tooltip: 'Pick Image',
        child: Icon(Icons.add_a_photo),
      ),
    );
  }

  void _pickImage() {
    showModalBottomSheet(context: context, builder: (context) =>Container(
      height: 160,
      child: Column(
        children: <Widget>[
          // 创建一个方法生产
          _item('拍照',true),
          _item('从相册选择',false),
        ],
      ),
    ));
  }

  _item(String title, bool isTakePhoto) {
    return GestureDetector(
      child: ListTile(
        // 控制是相册图标还是拍照图标
        leading: Icon(isTakePhoto?Icons.camera_alt:Icons.photo_library),
        title: Text(title),
        onTap: () {
          getImage(isTakePhoto);
        },
      ),
    );
  }

  _genImages() {
    return _images.map((file){
      return Stack(
        children: <Widget>[
          ClipRRect(
            // 圆角效果
            borderRadius: BorderRadius.circular(5),
            child: Image.file(file,width: 120,height: 90,fit: BoxFit.fill,),
          ),
          Positioned(
            top: 5,
            right: 5,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _images.remove(file);
                });
              },
              child: ClipOval(
                // 圆角删除按钮
                child: Container(
                  padding: EdgeInsets.all(3),
                  decoration: BoxDecoration(color: Colors.black54),
                  child: Icon(
                    Icons.close,
                    size: 18,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          )
        ],
      );
    }).toList();
    ///_images.map会将list转换成map，然后对其中的数据做处理转成Widget
    ///最后通过.toList() 再将Widget的map转换成list
  }
}
