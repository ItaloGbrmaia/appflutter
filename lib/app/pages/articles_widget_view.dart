import 'package:app/app/controller/article_controller.dart';
import 'package:app/app/controller/home_controller.dart';
import 'package:app/app/models/article_models.dart';
import 'package:app/app/cards/cards_articles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
// ignore: unused_import
import 'package:url_launcher/url_launcher.dart';

class ArticleView extends StatefulWidget {
  ArticleView({
    super.key,
  });
  final controller = Modular.get<HomeController>();
  final article = Modular.get<ArticleController>();

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
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(25),
          topLeft: Radius.circular(25),
        ),
      ),
      child: Observer(
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

                                  return ArticleCardView(
                                    e: e,
                                    article: widget.article,
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
      ),
    );
  }
}
