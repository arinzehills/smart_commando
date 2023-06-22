import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:smart_commando/constants/constant.dart';

class FullPhotoPage extends StatelessWidget {
  final String url;
  final String? pageTitle;

  FullPhotoPage({Key? key, required this.url, this.pageTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: myBrown,
        title: Text(
          pageTitle ?? 'Full Photo',
          style: TextStyle(color: myorange),
        ),
        centerTitle: true,
      ),
      body: Container(
        child: PhotoView(
          imageProvider: NetworkImage(url),
        ),
      ),
    );
  }
}
