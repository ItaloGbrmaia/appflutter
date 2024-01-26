import 'package:app/app/modules/controller/article_controller.dart';
import 'package:flutter/material.dart';

class ArticleView extends StatefulWidget {
  const ArticleView({super.key, required this.controller});
  final ArticleController controller;
  @override
  State<ArticleView> createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
  @override
  void initState() {
    super.initState();
    widget.controller.loadArticle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }
}