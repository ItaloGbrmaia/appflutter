import 'package:app/app/modules/controller/home_controller.dart';
import 'package:app/app/modules/models/video_models.dart';
import 'package:app/app/modules/cards/cards_videos.dart';
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
    return Observer(
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
    );
  }
}

// class _VideoViewState extends State<VideoView> {
//   late ScrollController scrollController;
//   @override
//   void initState() {
//     super.initState();
//     widget.controller.allVideo = [];
//     widget.controller.homeVideo = [];
//     widget.controller.homelist = [];
//     widget.controller.pagevideos = 1;
//     scrollController = ScrollController();
//     scrollController.addListener(infinity);
//     widget.controller.loadVideo();
//   }

//   infinity() {
//     scrollController.addListener(() {
//       if (scrollController.position.pixels ==
//               scrollController.position.maxScrollExtent &&
//           !widget.controller.isLoading) {
//         widget.controller.isLoading = true;
//         widget.controller.loadVideo();
//         widget.controller.isLoading = false;
//       }
//     });
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     scrollController.dispose();
//   }

//   Future<void> _onrefresh() async {
//     widget.controller.loadVideo();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Observer(
//       builder: (context) {
//         return widget.controller.isLoading == false
//             ? RefreshIndicator(
//                 onRefresh: _onrefresh,
//                 color: const Color(0xffE09090),
//                 child: widget.controller.internet != false &&
//                         widget.controller.hatTime != false
//                     ? SingleChildScrollView(
//                         physics: const AlwaysScrollableScrollPhysics(),
//                         child: ListView.builder(
//                           controller: scrollController,
//                           physics: const NeverScrollableScrollPhysics(),
//                           shrinkWrap: true,
//                           itemCount: widget.controller.homelist!.length,
//                           itemBuilder: (context, index) {
//                             VideoModel e = widget.controller.homelist![index];
//                             int episodeIndex = index + 1;

//                             return VideoCardWidget(
//                               episodeIndex: episodeIndex,
//                               e: e,
//                             );
//                             // if (index < widget.controller.homelist!.length) {

//                             // } else {
//                             //   return const Center(
//                             //     child: CircularProgressIndicator(
//                             //       color: Color(0xffE09090),
//                             //     ),
//                             //   );
//                             // }
//                           },
//                         ),
//                       )
//                     : Center(
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             const Text(
//                               "Ops!",
//                               style: TextStyle(
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.w600,
//                                 color: Color(0xff80848F),
//                               ),
//                             ),
//                             const SizedBox(
//                               height: 14,
//                             ),
//                             const Padding(
//                               padding: EdgeInsets.only(left: 28.0, right: 28),
//                               child: Text(
//                                 "Não foi possível conectar ao servidor, verifique se está conectado à internet.",
//                                 style: TextStyle(
//                                   fontSize: 15,
//                                   fontWeight: FontWeight.w400,
//                                   color: Color(0xff80848F),
//                                 ),
//                                 textAlign: TextAlign.center,
//                               ),
//                             ),
//                             const SizedBox(
//                               height: 18,
//                             ),
//                             ElevatedButton(
//                               onPressed: _onrefresh,
//                               style: ElevatedButton.styleFrom(
//                                 backgroundColor: const Color(
//                                   0xffECECEC,
//                                 ), // Light gray background color
//                               ),
//                               child: const Text(
//                                 "Recarregar",
//                                 style: TextStyle(
//                                   fontSize: 14.5,
//                                   color: Color(
//                                     0xff80848F,
//                                   ), // Red text color
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//               )
//             : const Center(
//                 child: CircularProgressIndicator(
//                   color: Color(0xffE09090),
//                 ),
//               );
//       },
//     );
//   }
// }

// class VideoView extends StatefulWidget {
//   VideoView({
//     super.key,
//   });
//   final controller = Modular.get<HomeController>();

//   @override
//   State<VideoView> createState() => _VideoViewState();
// }

// class _VideoViewState extends State<VideoView> {
//   ScrollController _scrollController = ScrollController();

//   @override
//   void initState() {
//     super.initState();
//     widget.controller.allVideo = [];
//     widget.controller.homeVideo = [];
//     widget.controller.homelist = [];
//     widget.controller.pagevideos = 1;
//     widget.controller.loadVideo();

//     _scrollController.addListener(() {
//       if (_scrollController.position.pixels ==
//           _scrollController.position.maxScrollExtent) {
//         // Reached the end of the list, load more videos
//         widget.controller.loadVideo();
//       }
//     });
//   }

//   Future<void> _onrefresh() async {
//     widget.controller.loadVideo();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Observer(
//       builder: (context) {
//         return widget.controller.isLoading == false
//             ? RefreshIndicator(
//                 onRefresh: _onrefresh,
//                 color: const Color(0xffE09090),
//                 child: widget.controller.internet != false &&
//                         widget.controller.hatTime != false
//                     ? NotificationListener<ScrollNotification>(
//                         onNotification: (ScrollNotification scrollInfo) {
//                           if (scrollInfo is ScrollEndNotification &&
//                               _scrollController.position.extentAfter == 0) {
//                             // Reached the end of the list, load more videos
//                             widget.controller.loadVideo();
//                           }
//                           return false;
//                         },
//                         child: SingleChildScrollView(
//                           controller: _scrollController,
//                           physics: const AlwaysScrollableScrollPhysics(),
//                           scrollDirection: Axis.vertical,
//                           child: Column(
//                             children: [
//                               ...widget.controller.homelist!
//                                   .asMap()
//                                   .entries
//                                   .map(
//                                 (entry) {
//                                   int index = entry.key + 1;
//                                   VideoModel e = entry.value;

//                                   return Column(
//                                     children: [
//                                       Column(
//                                         children: [
//                                           const SizedBox(
//                                             height: 22,
//                                           ),
//                                           Padding(
//                                             padding: const EdgeInsets.only(
//                                               left: 20,
//                                               right: 20,
//                                             ),
//                                             child: SizedBox(
//                                               width: MediaQuery.of(context)
//                                                   .size
//                                                   .width,
//                                               child: Text(
//                                                 "EP. 0$index: ${e.name.toUpperCase()}",
//                                                 style: const TextStyle(
//                                                   color: Color(0xff80848F),
//                                                   fontSize: 15,
//                                                   fontWeight: FontWeight.w800,
//                                                 ),
//                                                 textAlign: TextAlign.center,
//                                               ),
//                                             ),
//                                           ),
//                                           GestureDetector(
//                                             onTap: () => {
//                                               // ignore: deprecated_member_use
//                                               launch(e.url2),
//                                             },
//                                             child: Stack(
//                                               children: [
//                                                 Padding(
//                                                   padding:
//                                                       const EdgeInsets.only(
//                                                     left: 20,
//                                                     right: 20,
//                                                     top: 8,
//                                                     bottom: 8,
//                                                   ),
//                                                   child: SizedBox(
//                                                     width:
//                                                         MediaQuery.of(context)
//                                                             .size
//                                                             .width,
//                                                     child: ClipRRect(
//                                                       borderRadius:
//                                                           BorderRadius.circular(
//                                                               20.0),
//                                                       child: CachedNetworkImage(
//                                                         imageUrl: e.imageUrl,
//                                                         fit: BoxFit.contain,
//                                                         progressIndicatorBuilder:
//                                                             (context, url,
//                                                                     downloadProgress) =>
//                                                                 CircularProgressIndicator(
//                                                           strokeAlign: BorderSide
//                                                               .strokeAlignCenter,
//                                                           strokeWidth: 1,
//                                                           color: Colors
//                                                               .transparent,
//                                                           value:
//                                                               downloadProgress
//                                                                   .progress,
//                                                         ),
//                                                         errorWidget: (context,
//                                                                 url, error) =>
//                                                             const Icon(
//                                                                 Icons.error),
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 ),
//                                                 Positioned.fill(
//                                                   child: Center(
//                                                     child: InkWell(
//                                                       onTap: () {
//                                                         launch(e.url2);
//                                                       },
//                                                       child: Container(
//                                                         width:
//                                                             58.0, // Set the width and height to create a circular container
//                                                         height: 58.0,
//                                                         decoration:
//                                                             BoxDecoration(
//                                                           shape:
//                                                               BoxShape.circle,
//                                                           color: Colors.white,
//                                                           boxShadow: [
//                                                             BoxShadow(
//                                                               color: Colors
//                                                                   .black
//                                                                   .withOpacity(
//                                                                       0.2),
//                                                               spreadRadius: 1,
//                                                               blurRadius: 3,
//                                                               offset:
//                                                                   const Offset(
//                                                                       0, 2),
//                                                             ),
//                                                           ],
//                                                         ),
//                                                         child: Padding(
//                                                           padding:
//                                                               const EdgeInsets
//                                                                   .all(4.0),
//                                                           child: Container(
//                                                             width:
//                                                                 48.0, // Set the width and height to create a circular container
//                                                             height: 48.0,
//                                                             decoration:
//                                                                 const BoxDecoration(
//                                                               shape: BoxShape
//                                                                   .circle,
//                                                               color: Color(
//                                                                   0xffE09090),
//                                                             ),
//                                                             child: const Icon(
//                                                               Icons.play_arrow,
//                                                               color: Colors
//                                                                   .white, // Set the color to blue
//                                                               size:
//                                                                   24.0, // Set the size of the icon
//                                                             ),
//                                                           ),
//                                                         ),
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                           ),
//                                           Padding(
//                                             padding: const EdgeInsets.only(
//                                                 left: 20, right: 20, top: 4),
//                                             child: Text(
//                                               e.description,
//                                               style: const TextStyle(
//                                                 color: Color(0xff80848F),
//                                                 fontSize: 15.5,
//                                                 fontWeight: FontWeight.w400,
//                                               ),
//                                               textAlign: TextAlign.center,
//                                             ),
//                                           ),
//                                           const SizedBox(
//                                             height: 10,
//                                           ),
//                                           ElevatedButton(
//                                             onPressed: () {
//                                               Share.share(e.url2);
//                                             },
//                                             style: ElevatedButton.styleFrom(
//                                               foregroundColor:
//                                                   const Color(0xff80848F),
//                                               backgroundColor: const Color(
//                                                 0xffECECEC,
//                                               ), // Foreground (text) color
//                                               shape: RoundedRectangleBorder(
//                                                 borderRadius:
//                                                     BorderRadius.circular(20.0),
//                                               ),
//                                               padding: const EdgeInsets
//                                                   .symmetric(
//                                                   vertical: 9,
//                                                   horizontal:
//                                                       8), // Adjust padding as needed
//                                             ),
//                                             child: const Row(
//                                               mainAxisSize: MainAxisSize.min,
//                                               children: [
//                                                 SizedBox(
//                                                   width: 8,
//                                                 ),
//                                                 Icon(
//                                                   Icons.share,
//                                                   size: 16,
//                                                 ),
//                                                 SizedBox(
//                                                   width: 8,
//                                                 ),
//                                                 Text(
//                                                   "Compartilhar",
//                                                   style: TextStyle(
//                                                     fontSize: 12,
//                                                     fontWeight: FontWeight.w900,
//                                                   ),
//                                                 ),
//                                                 SizedBox(
//                                                   width: 8,
//                                                 ),
//                                               ],
//                                             ),
//                                           ),
//                                           const SizedBox(
//                                             height: 19,
//                                           ),
//                                           Padding(
//                                             padding: const EdgeInsets.only(
//                                                 left: 12.0, right: 12),
//                                             child: Container(
//                                               height: 1,
//                                               width: MediaQuery.of(context)
//                                                   .size
//                                                   .width,
//                                               color: const Color(
//                                                 0xff80848F,
//                                               ).withOpacity(0.3),
//                                             ),
//                                           ),
//                                           const SizedBox(
//                                             height: 19,
//                                           ),
//                                         ],
//                                       ),
//                                     ],
//                                   );
//                                 },
//                               ).toList(),
//                             ],
//                           ),
//                         ),
//                       )
//                     : Center(
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             const Text(
//                               "Ops!",
//                               style: TextStyle(
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.w600,
//                                 color: Color(0xff80848F),
//                               ),
//                             ),
//                             const SizedBox(
//                               height: 14,
//                             ),
//                             const Padding(
//                               padding: EdgeInsets.only(left: 28.0, right: 28),
//                               child: Text(
//                                 "Não foi possível conectar ao servidor, verifique se está conectado à internet.",
//                                 style: TextStyle(
//                                   fontSize: 15,
//                                   fontWeight: FontWeight.w400,
//                                   color: Color(0xff80848F),
//                                 ),
//                                 textAlign: TextAlign.center,
//                               ),
//                             ),
//                             const SizedBox(
//                               height: 18,
//                             ),
//                             ElevatedButton(
//                               onPressed: _onrefresh,
//                               style: ElevatedButton.styleFrom(
//                                 backgroundColor: const Color(
//                                   0xffECECEC,
//                                 ), // Light gray background color
//                               ),
//                               child: const Text(
//                                 "Recarregar",
//                                 style: TextStyle(
//                                   fontSize: 14.5,
//                                   color: Color(
//                                     0xff80848F,
//                                   ), // Red text color
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//               )
//             : const Center(
//                 child: CircularProgressIndicator(
//                   color: Color(0xffE09090),
//                 ),
//               );
//       },
//     );
//   }
// }
