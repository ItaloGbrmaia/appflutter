import 'package:app/app/controller/home_controller.dart';
import 'package:app/app/pages/articles_widget_view.dart';
import 'package:app/app/pages/quote_widget_view.dart';
import 'package:app/app/pages/video_widgets_view.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key, required this.controller}) : super(key: key);
  final HomeController controller;

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int valueColors = 0;

  @override
  Widget build(BuildContext context) {
    final List<String> tabs = <String>['Videos', 'Artigos', 'Citações'];

    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => {},
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
          ),
          title: const Text(
            'INSPIRAÇÕES',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          backgroundColor: const Color(0xffE09090),
          bottom: PreferredSize(
            preferredSize: const Size(400, 58),
            child: Column(
              children: [
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Container(
                        height: 48,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 0, 0, 0)
                              .withOpacity(0.11),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                      ),
                    ),
                    Positioned.fill(
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 14.0, right: 14.0, bottom: 0),
                          child: SizedBox(
                            height: 37,
                            child: TabBar(
                              enableFeedback: false,
                              labelStyle: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                              ),
                              indicatorSize: TabBarIndicatorSize.label,
                              indicatorWeight: 1,
                              indicator: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              // dividerHeight: 30,
                              dividerColor: Colors.transparent,
                              labelColor: const Color(0xffE09090),
                              unselectedLabelColor: Colors.white,
                              indicatorColor: Colors.transparent,
                              tabs: tabs.map((String name) {
                                return Padding(
                                  padding: const EdgeInsets.only(top: 4.0),
                                  child: GestureDetector(
                                    behavior: HitTestBehavior.translucent,
                                    child: SizedBox(
                                      width: MediaQuery.of(context).size.width,
                                      child: Tab(
                                        text: name,
                                      ),
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                )
              ],
            ),
          ),
        ),
        backgroundColor: const Color(0xffE09090),
        body: TabBarView(
          children: <Widget>[
            VideoView(),
            ArticleView(),
            QuoteView(),
          ],
        ),
      ),
    );
  }
}














// class HomeView extends StatefulWidget {
//   const HomeView({super.key, required this.controller});
//   final HomeController controller;
//   @override
//   HomeViewState createState() => HomeViewState();
// }

// class HomeViewState extends State<HomeView>
//     with SingleTickerProviderStateMixin {
//   late TabController _tabController;
//   late PageController _pageController;

//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: 3, vsync: this);
//     _pageController = PageController();

//     _tabController.addListener(() {
//       if (_tabController.indexIsChanging) {
//         _pageController.animateToPage(
//           _tabController.index,
//           duration: const Duration(milliseconds: 300),
//           curve: Curves.ease,
//         );
//       }
//     });
//   }

//   @override
//   void dispose() {
//     _tabController.dispose();
//     _pageController.dispose();
//     super.dispose();
//   }

//   int valueColors = 1;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Column(
//         children: [
//           Expanded(
//             flex: 20,
//             child: Container(
//               width: MediaQuery.of(context).size.width,
//               height: MediaQuery.of(context).size.height,
//               color: const Color(0xffE09090),
//               child: Column(
//                 children: [
//                   const SizedBox(
//                     height: 45,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Row(
//                       children: [
//                         Expanded(
//                           flex: 10,
//                           child: Container(
//                             height: 37,
//                             width: 43,
//                             decoration: BoxDecoration(
//                               color: const Color.fromARGB(255, 0, 0, 0)
//                                   .withOpacity(0.11),
//                               borderRadius: BorderRadius.circular(100),
//                             ),
//                             child: IconButton(
//                               onPressed: () => {},
//                               icon: const Icon(
//                                 Icons.arrow_back_ios,
//                                 color: Colors.white,
//                                 size: 24,
//                               ),
//                             ),
//                           ),
//                         ),
//                         const Expanded(
//                           flex: 84,
//                           child: Center(
//                             child: Text(
//                               "Inspirações",
//                               style: TextStyle(
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.w700,
//                                 color: Colors.white,
//                               ),
//                             ),
//                           ),
//                         ),
//                         Expanded(
//                           flex: 10,
//                           child: Container(),
//                         )
//                       ],
//                     ),
//                   ),
//                   Stack(
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.only(left: 20, right: 20),
//                         child: Container(
//                           height: 55,
//                           decoration: BoxDecoration(
//                             color: const Color.fromARGB(255, 0, 0, 0)
//                                 .withOpacity(0.11),
//                             borderRadius: BorderRadius.circular(
//                                 25.0), // Adiciona o borderRadius
//                           ),
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(left: 14.0, right: 14.0),
//                         child: SizedBox(
//                           height: 55,
//                           child: TabBar(
//                             controller: _tabController,
//                             onTap: (int index) {
//                               setState(() {
//                                 if (index == 0) {
//                                   valueColors = 1;
//                                 } else if (index == 1) {
//                                   valueColors = 2;
//                                 } else if (index == 2) {
//                                   valueColors = 3;
//                                 }
//                               });

//                               _tabController.animateTo(index);
//                             },
//                             labelStyle: const TextStyle(
//                               fontSize: 14,
//                               fontWeight: FontWeight.w700,
//                             ),
//                             indicatorSize: TabBarIndicatorSize.label,
//                             indicatorWeight: 1,
//                             dividerHeight: 44,
//                             dividerColor: Colors.transparent,
//                             labelColor: const Color(0xffE09090),
//                             unselectedLabelColor: Colors.white,
//                             indicatorColor: Colors.transparent,
//                             tabs: <Widget>[
//                               Container(
//                                 height: 44,
//                                 width: MediaQuery.of(context).size.width,
//                                 decoration: BoxDecoration(
//                                   color: valueColors == 1
//                                       ? Colors.white
//                                       : Colors.transparent,
//                                   borderRadius: BorderRadius.circular(25.0),
//                                 ),
//                                 child: const Tab(
//                                   text: 'Videos',
//                                 ),
//                               ),
//                               Container(
//                                 height: 44,
//                                 width: MediaQuery.of(context).size.width,
//                                 decoration: BoxDecoration(
//                                   color: valueColors == 2
//                                       ? Colors.white
//                                       : Colors.transparent,
//                                   borderRadius: BorderRadius.circular(
//                                       25.0), // Adiciona o borderRadius
//                                 ),
//                                 child: const Tab(
//                                   text: 'Artigos',
//                                 ),
//                               ),
//                               Container(
//                                 height: 44,
//                                 width: MediaQuery.of(context).size.width,
//                                 decoration: BoxDecoration(
//                                   color: valueColors == 3
//                                       ? Colors.white
//                                       : Colors.transparent,
//                                   borderRadius: BorderRadius.circular(
//                                     25.0,
//                                   ), // Adiciona o borderRadius
//                                 ),
//                                 child: const Tab(
//                                   text: 'Citações',
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           Expanded(
//             flex: 80,
//             child: PageView(
//               controller: _pageController,
//               physics: AlwaysScrollableScrollPhysics(),
//               children: [
//                 VideoView(),
//                 ArticleView(),
//                 QuoteView(),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }