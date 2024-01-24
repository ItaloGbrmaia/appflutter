import 'package:app/modules/home/controller/home_controller.dart';
import 'package:app/modules/home/models/article_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:share_plus/share_plus.dart';
// ignore: unused_import
import 'package:url_launcher/url_launcher.dart';

class ArticleView extends StatefulWidget {
  ArticleView({
    super.key,
  });
  final controller = Modular.get<HomeController>();

  @override
  State<ArticleView> createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
  @override
  void initState() {
    super.initState();
    widget.controller.allArticle = [];
    widget.controller.homeArticle = [];
    widget.controller.homearticleList = [];
    widget.controller.pageArticles = 1;
    widget.controller.loadArticle();
  }

  Future<void> _onrefresh() async {
    widget.controller.loadArticle();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return widget.controller.isLoading == false
            ? RefreshIndicator(
                onRefresh: _onrefresh,
                color: const Color(0xffE09090),
                child: widget.controller.internet != false &&
                        widget.controller.hatTime != false
                    ? SingleChildScrollView(
                        physics: const AlwaysScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        child: Column(
                          children: [
                            ...widget.controller.homearticleList!
                                .asMap()
                                .entries
                                .map(
                              (entry) {
                                ArticleModel e = entry.value;

                                return Column(
                                  children: [
                                    Column(
                                      children: [
                                        const SizedBox(
                                          height: 22,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            left: 20,
                                            right: 20,
                                          ),
                                          child: SizedBox(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            child: Text(
                                              "ARTIGO ${e.title.toUpperCase()}",
                                              style: const TextStyle(
                                                color: Color(0xff80848F),
                                                fontSize: 15,
                                                fontWeight: FontWeight.w800,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
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
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                              child: CachedNetworkImage(
                                                fit: BoxFit.contain,
                                                imageUrl: e.imageUrl,
                                                progressIndicatorBuilder:
                                                    (context, url,
                                                            downloadProgress) =>
                                                        CircularProgressIndicator(
                                                  strokeAlign: BorderSide
                                                      .strokeAlignCenter,
                                                  strokeWidth: 1,
                                                  color: Colors.transparent,
                                                  value:
                                                      downloadProgress.progress,
                                                ),
                                                errorWidget:
                                                    (context, url, error) =>
                                                        const Icon(Icons.error),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 20, right: 20, top: 4),
                                          child: Text(
                                            e.text,
                                            style: const TextStyle(
                                              color: Color(0xff80848F),
                                              fontSize: 15.5,
                                              fontWeight: FontWeight.w400,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        ElevatedButton(
                                          onPressed: () {
                                            Share.share("");
                                          },
                                          style: ElevatedButton.styleFrom(
                                            foregroundColor:
                                                const Color(0xff80848F),
                                            backgroundColor: const Color(
                                              0xffECECEC,
                                            ), // Foreground (text) color
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                            ),
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 9,
                                                horizontal:
                                                    8), // Adjust padding as needed
                                          ),
                                          child: const Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              SizedBox(
                                                width: 8,
                                              ),
                                              Icon(
                                                Icons.share,
                                                size: 16,
                                              ),
                                              SizedBox(
                                                width: 8,
                                              ),
                                              Text(
                                                "Compartilhar",
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w900,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 8,
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 19,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 12.0, right: 12),
                                          child: Container(
                                            height: 1,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            color: const Color(
                                              0xff80848F,
                                            ).withOpacity(0.3),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 19,
                                        ),
                                      ],
                                    ),
                                  ],
                                );
                              },
                            ).toList(),
                          ],
                        ),
                      )
                    : Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Ops!",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff80848F),
                              ),
                            ),
                            const SizedBox(
                              height: 14,
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 28.0, right: 28),
                              child: Text(
                                "Não foi possível conectar ao servidor, verifique se está conectado à internet.",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff80848F),
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const SizedBox(
                              height: 18,
                            ),
                            ElevatedButton(
                              onPressed: _onrefresh,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(
                                  0xffECECEC,
                                ), // Light gray background color
                              ),
                              child: const Text(
                                "Recarregar",
                                style: TextStyle(
                                  fontSize: 14.5,
                                  color: Color(
                                    0xff80848F,
                                  ), // Red text color
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
              )
            : const Center(
                child: CircularProgressIndicator(
                  color: Color(0xffE09090),
                ),
              );
      },
    );
  }
}
