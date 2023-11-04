// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:webview_flutter_plus/webview_flutter_plus.dart';

class ArticleView extends StatefulWidget {
  const ArticleView({super.key, required this.blogurl});
  final String? blogurl;

  @override
  State<ArticleView> createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('SPACE',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.black),),
              Text('NEWS',style: TextStyle(fontSize:30 ,fontWeight: FontWeight.bold,color: Colors.red),)
            ],
          ),
      ),
      body: WebViewPlus(
        initialUrl: widget.blogurl,
      ),
    );
  }
}
