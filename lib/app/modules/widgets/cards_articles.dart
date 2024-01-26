import 'package:app/app/modules/controller/article_controller.dart';
import 'package:app/app/modules/models/article_models.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:share_plus/share_plus.dart';

class ArticleCardView extends StatelessWidget {
  const ArticleCardView({
    super.key,
    required this.e,
    required this.article,
  });
  final ArticleController article;
  final ArticleModel e;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () => {
            Modular.to.pushNamed("/home/article"),
            article.id = e.id,
          },
          child: Column(
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
                  width: MediaQuery.of(context).size.width,
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
                  width: MediaQuery.of(context).size.width,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: CachedNetworkImage(
                      fit: BoxFit.contain,
                      imageUrl: e.imageUrl,
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) =>
                              CircularProgressIndicator(
                        strokeAlign: BorderSide.strokeAlignCenter,
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
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 4),
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
                  foregroundColor: const Color(0xff80848F),
                  backgroundColor: const Color(
                    0xffECECEC,
                  ), // Foreground (text) color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  padding: const EdgeInsets.symmetric(
                      vertical: 9, horizontal: 8), // Adjust padding as needed
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
                padding: const EdgeInsets.only(left: 12.0, right: 12),
                child: Container(
                  height: 1,
                  width: MediaQuery.of(context).size.width,
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
        ),
      ],
    );
  }
}
