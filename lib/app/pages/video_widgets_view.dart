import 'package:app/app/controller/home_controller.dart';
import 'package:app/app/models/video_models.dart';
import 'package:app/app/cards/cards_videos.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class VideoView extends StatefulWidget {
  VideoView({
    super.key,
  });

  final controller = Modular.get<HomeController>();

  @override
  State<VideoView> createState() => _VideoViewState();
}

class _VideoViewState extends State<VideoView> {
  late ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    widget.controller.allVideo = [];
    widget.controller.homeVideo = [];
    widget.controller.homelist = [];
    widget.controller.pagevideos = 1;
    scrollController = ScrollController();
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
              scrollController.position.maxScrollExtent &&
          !widget.controller.isLoading) {
        widget.controller.loadVideo();
        double currentPosition = scrollController.position.pixels;

        scrollController.jumpTo(currentPosition);
      }
    });
    widget.controller.loadVideo();
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  Future<void> _onRefresh() async {
    widget.controller.loadVideo();
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
                  onRefresh: _onRefresh,
                  color: const Color(0xffE09090),
                  child: widget.controller.internet != false &&
                          widget.controller.hatTime != false
                      ? ListView.builder(
                          controller: scrollController,
                          physics: const AlwaysScrollableScrollPhysics(),
                          itemCount: widget.controller.homelist!.length,
                          itemBuilder: (context, index) {
                            VideoModel e = widget.controller.homelist![index];
                            int episodeIndex = index + 1;

                            return VideoCardWidget(
                              episodeIndex: episodeIndex,
                              e: e,
                            );
                          },
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
                                onPressed: _onRefresh,
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
