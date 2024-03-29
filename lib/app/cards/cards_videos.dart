import 'package:app/app/models/video_models.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class VideoCardWidget extends StatelessWidget {
  const VideoCardWidget({
    super.key,
    required this.episodeIndex,
    required this.e,
  });

  final int episodeIndex;
  final VideoModel e;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 22),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Text(
              "EP. 0$episodeIndex: ${e.name.toUpperCase()}",
              style: const TextStyle(
                color: Color(0xff80848F),
                fontSize: 15,
                fontWeight: FontWeight.w800,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        GestureDetector(
          onTap: () => launch(e.url2),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 8, bottom: 8),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: CachedNetworkImage(
                      imageUrl: e.imageUrl,
                      fit: BoxFit.contain,
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
              Positioned.fill(
                child: Center(
                  child: InkWell(
                    onTap: () => launch(e.url2),
                    child: Container(
                      width: 58.0,
                      height: 58.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: 1,
                            blurRadius: 3,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Container(
                          width: 48.0,
                          height: 48.0,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xffE09090),
                          ),
                          child: const Icon(
                            Icons.play_arrow,
                            color: Colors.white,
                            size: 24.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 4),
          child: Text(
            e.description,
            style: const TextStyle(
              color: Color(0xff80848F),
              fontSize: 15.5,
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () => Share.share(e.url2),
          style: ElevatedButton.styleFrom(
            foregroundColor: const Color(0xff80848F),
            backgroundColor: const Color(0xffECECEC),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 8),
          ),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(width: 8),
              Icon(
                Icons.share,
                size: 16,
              ),
              SizedBox(width: 8),
              Text(
                "Compartilhar",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(width: 8),
            ],
          ),
        ),
        const SizedBox(height: 19),
        Padding(
          padding: const EdgeInsets.only(left: 12.0, right: 12),
          child: Container(
            height: 1,
            width: MediaQuery.of(context).size.width,
            color: const Color(0xff80848F).withOpacity(0.3),
          ),
        ),
        const SizedBox(height: 19),
      ],
    );
  }
}
