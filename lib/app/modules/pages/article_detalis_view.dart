import 'package:app/app/modules/controller/article_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_html/flutter_html.dart';

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

  Future<void> _onRefresh() async {
    widget.controller.loadArticle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffE09090),
      ),
      body: Observer(
        builder: (context) {
          return widget.controller.isLoading == false
              ? RefreshIndicator(
                  onRefresh: _onRefresh,
                  color: const Color(0xffE09090),
                  child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        ...widget.controller.allArticle!
                            .map(
                              (e) => Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 20,
                                      right: 20,
                                      top: 8,
                                      bottom: 8,
                                    ),
                                    child: SizedBox(
                                      width: MediaQuery.of(context).size.width,
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        child: CachedNetworkImage(
                                          fit: BoxFit.contain,
                                          imageUrl: e.image,
                                          progressIndicatorBuilder: (context,
                                                  url, downloadProgress) =>
                                              CircularProgressIndicator(
                                            strokeAlign:
                                                BorderSide.strokeAlignCenter,
                                            strokeWidth: 1,
                                            color: Colors.transparent,
                                            value: downloadProgress.progress,
                                          ),
                                          errorWidget: (context, url, error) =>
                                              const Icon(Icons.error),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Html(
                                      data: e.fullText,
                                      style: {
                                        "body": Style(
                                          fontWeight: FontWeight.w500,
                                          fontSize: FontSize(18.0),
                                          color: const Color(
                                            0xFF80848F,
                                          ),
                                          textAlign: TextAlign
                                              .justify, // Cor vermelha, você pode ajustar conforme necessário
                                        ),
                                        "href": Style(
                                          backgroundColor: Colors.black,
                                        ),
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      e.authorName,
                                      style:
                                          const TextStyle(color: Colors.black),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 20,
                                      right: 20,
                                      top: 8,
                                      bottom: 8,
                                    ),
                                    child: SizedBox(
                                      width: 70,
                                      height: 70,
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        child: CachedNetworkImage(
                                          fit: BoxFit.contain,
                                          imageUrl: e.authorimage,
                                          progressIndicatorBuilder: (context,
                                                  url, downloadProgress) =>
                                              CircularProgressIndicator(
                                            strokeAlign:
                                                BorderSide.strokeAlignCenter,
                                            strokeWidth: 1,
                                            color: Colors.transparent,
                                            value: downloadProgress.progress,
                                          ),
                                          errorWidget: (context, url, error) =>
                                              const Icon(Icons.error),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                ],
                              ),
                            )
                            .toList(),
                      ],
                    ),
                  ))
              : const Center(
                  child: CircularProgressIndicator(
                    color: Color(0xffE09090),
                  ),
                );
        },
      ),
    );
  }
}
