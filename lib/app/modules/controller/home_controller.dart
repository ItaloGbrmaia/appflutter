import 'package:app/app/modules/factories/articles_interface.dart';
import 'package:app/app/modules/factories/quote_interface.dart';
import 'package:app/app/modules/factories/video_interface.dart';
import 'package:app/app/modules/models/article_models.dart';
import 'package:app/app/modules/models/video_models.dart';

import 'package:mobx/mobx.dart';
import 'package:connectivity/connectivity.dart';
import 'package:app/app/modules/models/quote_models.dart';

part 'home_controller.g.dart';

class HomeController = HomeControllerBase with _$HomeController;

abstract class HomeControllerBase with Store {
  HomeControllerBase(
      {required VideoLoad loadVideo,
      required ArticleLoad loadArticle,
      required QuoteLoad loadQuote})
      : _loadVideo = loadVideo,
        _loadArticle = loadArticle,
        _loadQuote = loadQuote;

  final QuoteLoad _loadQuote;
  final VideoLoad _loadVideo;
  final ArticleLoad _loadArticle;

  @observable
  bool isLoading = true;

  List<VideoModel>? allVideo;
  List<VideoModel>? homeVideo;
  List<VideoModel>? homelist;

  @observable
  int pagevideos = 1;

  @observable
  int pageArticles = 1;

  @observable
  int pageQuote = 1;

  Future<void> loadVideo() async {
    isLoading = true;
    allVideo ??= [];
    homeVideo ??= [];
    homelist ??= [];

    try {
      isLoading = true;
      var connectivityResult = await Connectivity().checkConnectivity();
      if (connectivityResult == ConnectivityResult.none) {
        isLoading = false;
        internet = false;
        allVideo = [];
        homeVideo = [];
        homelist = [];
        print("Sem conexão");
        return;
      }

      dynamic result = await _loadVideo.loadData(pagevideos).timeout(
        const Duration(seconds: 7),
        onTimeout: () {
          print("Tempo limite excedido (7 segundos)");
          isLoading = false;
          hatTime = false;
          allVideo = [];
          homeVideo = [];
          homelist = [];
          return [];
        },
      );

      if (result != null && result is List<VideoModel> && result.isNotEmpty) {
        internet = true;
        hatTime = true;
        allVideo = result;
        homeVideo = List.from(allVideo!);
        homelist!.addAll(homeVideo!);
      } else {
        hatTime = false;
      }

      pagevideos++;
      isLoading = false;
    } catch (e) {
      isLoading = false;
    }
  }

  @observable
  bool internet = true;

  @observable
  bool hatTime = true;

  List<ArticleModel>? allArticle;
  List<ArticleModel>? homeArticle;
  List<ArticleModel>? homearticleList;
  Future<void> loadArticle() async {
    isLoading = true;
    allArticle ??= [];
    homeArticle ??= [];
    homearticleList ??= [];

    try {
      isLoading = true;
      var connectivityResult = await Connectivity().checkConnectivity();
      if (connectivityResult == ConnectivityResult.none) {
        isLoading = false;
        internet = false;
        allArticle = [];
        homeArticle = [];
        homearticleList = [];
        print("Sem conexão");
        return;
      }

      dynamic result = await _loadArticle.loadArticle(pageArticles).timeout(
        const Duration(seconds: 7),
        onTimeout: () {
          print("Tempo limite excedido (7 segundos)");
          isLoading = false;
          hatTime = false;
          allArticle = [];
          homeArticle = [];
          homearticleList = [];
          return [];
        },
      );

      if (result != null && result is List<ArticleModel> && result.isNotEmpty) {
        internet = true;
        hatTime = true;
        allArticle = result;
        homeArticle = List.from(allArticle!); // Cria uma cópia da lista
        homearticleList!.addAll(homeArticle!);
      } else {
        hatTime = false;
      }
      pageArticles++;
      isLoading = false;
    } catch (e) {
      isLoading = false;
    }
  }

  List<QuoteModel>? allQuote;
  List<QuoteModel>? homeQuote;
  List<QuoteModel>? homeQuoteList;

  Future<void> loadQuote() async {
    isLoading = true;
    allQuote ??= [];
    homeQuote ??= [];
    homeQuoteList ??= [];

    try {
      isLoading = true;
      var connectivityResult = await Connectivity().checkConnectivity();
      if (connectivityResult == ConnectivityResult.none) {
        isLoading = false;
        internet = false;
        allQuote = [];
        homeQuote = [];
        homeQuoteList = [];
        print("Sem conexão");
        return;
      }

      dynamic result = await _loadQuote.loadQuote(pageQuote).timeout(
        const Duration(seconds: 7),
        onTimeout: () {
          print("Tempo limite excedido (7 segundos)");
          isLoading = false;
          hatTime = false;
          allQuote = [];
          homeQuote = [];
          homeQuoteList = [];
          return [];
        },
      );

      if (result != null && result is List<QuoteModel> && result.isNotEmpty) {
        internet = true;
        hatTime = true;
        allQuote = result;
        homeQuote = List.from(allQuote!);
        homeQuoteList!.addAll(homeQuote!);
      } else {
        hatTime = false;
      }
      pageQuote++;
      isLoading = false;
    } catch (e) {
      isLoading = false;
    }
  }
}




// Future<void> loadVideo() async {
  //   isLoading = true;
  //   allVideo = [];
  //   homeVideo = [];
  //   homelist = [];
  //   try {
  //     isLoading = true;
  //     var connectivityResult = await Connectivity().checkConnectivity();
  //     if (connectivityResult == ConnectivityResult.none) {
  //       isLoading = false;
  //       internet = false;
  //       print("sem conexao");
  //       return;
  //     }

  //     dynamic result = await _loadVideo.loadData(pagevideos).timeout(
  //       const Duration(seconds: 7),
  //       onTimeout: () {
  //         print("Tempo limite excedido (7 segundos)");
  //         isLoading = false;
  //         hatTime = false;
  //         return [];
  //       },
  //     );

  //     if (result != [] && result.isNotEmpty) {
  //       internet = true;
  //       hatTime = true;
  //       allVideo = result as List<VideoModel>? ?? [];
  //       homeVideo = allVideo!
  //           .map(
  //             (e) => e,
  //           )
  //           .toList();

  //       for (int i = 0; i < homeVideo!.length; i++) {
  //         homelist!.add(homeVideo![i]);
  //       }
  //     } else {
  //       hatTime = false;
  //     }

  //     pagevideos++;
  //     isLoading = false;
  //   } catch (e) {
  //     isLoading = false;
  //   }
  // }




  // Future<void> loadArticle() async {
  //   isLoading = true;
  //   allArticle;
  //   homeArticle;
  //   homearticleList;

  //   try {
  //     isLoading = true;
  //     var connectivityResult = await Connectivity().checkConnectivity();
  //     if (connectivityResult == ConnectivityResult.none) {
  //       isLoading = false;
  //       internet = false;
  //       print("sem conexao");
  //       return;
  //     }

  //     dynamic result = await _loadArticle.loadArticle(pageArticles).timeout(
  //       const Duration(seconds: 7),
  //       onTimeout: () {
  //         print("Tempo limite excedido (7 segundos)");
  //         isLoading = false;
  //         hatTime = false;
  //         return [];
  //       },
  //     );

  //     if (result != [] && result.isNotEmpty) {
  //       internet = true;
  //       hatTime = true;
  //       allArticle = result as List<ArticleModel>? ?? [];
  //       homeArticle = allArticle!
  //           .map(
  //             (e) => e,
  //           )
  //           .toList();

  //       for (int i = 0; i < homeArticle!.length; i++) {
  //         homearticleList!.add(homeArticle![i]);
  //       }
  //     } else {
  //       hatTime = false;
  //     }
  //     pageArticles++;
  //     isLoading = false;
  //   } catch (e) {
  //     isLoading = false;
  //   }
  // }