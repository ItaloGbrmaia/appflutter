import 'package:app/app/controller/article_controller.dart';
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
                                  const SizedBox(
                                    height: 30,
                                  ),
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
                                    height: 18,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Text(
                                      e.title,
                                      style: TextStyle(
                                          color: Colors.black.withOpacity(0.5),
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 18.0, right: 18.0),
                                    child: Html(
                                      data: e.fullText,
                                      style: {
                                        "body": Style(
                                          textDecoration: TextDecoration.none,
                                          fontSize: FontSize(18.5),
                                          color: const Color(0xFF80848F),
                                          textAlign: TextAlign.justify,
                                          fontStyle: FontStyle.normal,
                                        ),
                                        "a": Style(
                                          fontSize: FontSize(18.5),
                                          textDecoration: TextDecoration.none,
                                          color: const Color(0xFFD88AA1),
                                          fontWeight:
                                              FontWeight.bold, // Negrito
                                        ),
                                        "em": Style(
                                          fontSize: FontSize(18.0),
                                          textDecoration: TextDecoration.none,
                                          fontStyle: FontStyle.normal,
                                          // ignore: use_full_hex_values_for_flutter_colors
                                          color: const Color(0xffd80848f),
                                          fontWeight:
                                              FontWeight.w600, // Negrito
                                        ),
                                      },
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 18.0, right: 18.0),
                                    child: Container(
                                      height: 125,
                                      decoration: const BoxDecoration(
                                        color: Color(0xFFEBEBEB),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(15),
                                        ),
                                      ),
                                      width: MediaQuery.of(context).size.width,
                                      child: Row(
                                        children: [
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
                                                          url,
                                                          downloadProgress) =>
                                                      CircularProgressIndicator(
                                                    strokeAlign: BorderSide
                                                        .strokeAlignCenter,
                                                    strokeWidth: 1,
                                                    color: Colors.transparent,
                                                    value: downloadProgress
                                                        .progress,
                                                  ),
                                                  errorWidget: (context, url,
                                                          error) =>
                                                      const Icon(Icons.error),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.6,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.stretch,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                    right: 8.9,
                                                    top: 2,
                                                    bottom: 4,
                                                  ),
                                                  child: Text(
                                                    e.authorName,
                                                    style: TextStyle(
                                                        color: Colors.black
                                                            .withOpacity(0.5),
                                                        fontWeight:
                                                            FontWeight.w700),
                                                  ),
                                                ),
                                                Text(
                                                  e.text,
                                                  style: TextStyle(
                                                    color: Colors.black
                                                        .withOpacity(0.5),
                                                  ),
                                                  textAlign: TextAlign.left,
                                                  overflow: TextOverflow.clip,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 37,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 26,
                                      right: 26,
                                    ),
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            const Color(0xFFDF989B),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(32),
                                        ),
                                        minimumSize:
                                            const Size(double.infinity, 60.0),
                                      ),
                                      child: const Text(
                                        'Compartilhar',
                                        style: TextStyle(
                                          fontSize: 19.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors
                                              .white, // Cor do texto branco
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 60,
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
