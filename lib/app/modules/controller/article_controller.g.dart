// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ArticleController on ArticleControllerBase, Store {
  late final _$idAtom =
      Atom(name: 'ArticleControllerBase.id', context: context);

  @override
  int get id {
    _$idAtom.reportRead();
    return super.id;
  }

  bool _idIsInitialized = false;

  @override
  set id(int value) {
    _$idAtom.reportWrite(value, _idIsInitialized ? super.id : null, () {
      super.id = value;
      _idIsInitialized = true;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: 'ArticleControllerBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$pagevideosAtom =
      Atom(name: 'ArticleControllerBase.pagevideos', context: context);

  @override
  int get pagevideos {
    _$pagevideosAtom.reportRead();
    return super.pagevideos;
  }

  @override
  set pagevideos(int value) {
    _$pagevideosAtom.reportWrite(value, super.pagevideos, () {
      super.pagevideos = value;
    });
  }

  late final _$pageArticlesAtom =
      Atom(name: 'ArticleControllerBase.pageArticles', context: context);

  @override
  int get pageArticles {
    _$pageArticlesAtom.reportRead();
    return super.pageArticles;
  }

  @override
  set pageArticles(int value) {
    _$pageArticlesAtom.reportWrite(value, super.pageArticles, () {
      super.pageArticles = value;
    });
  }

  late final _$pageQuoteAtom =
      Atom(name: 'ArticleControllerBase.pageQuote', context: context);

  @override
  int get pageQuote {
    _$pageQuoteAtom.reportRead();
    return super.pageQuote;
  }

  @override
  set pageQuote(int value) {
    _$pageQuoteAtom.reportWrite(value, super.pageQuote, () {
      super.pageQuote = value;
    });
  }

  late final _$internetAtom =
      Atom(name: 'ArticleControllerBase.internet', context: context);

  @override
  bool get internet {
    _$internetAtom.reportRead();
    return super.internet;
  }

  @override
  set internet(bool value) {
    _$internetAtom.reportWrite(value, super.internet, () {
      super.internet = value;
    });
  }

  late final _$hatTimeAtom =
      Atom(name: 'ArticleControllerBase.hatTime', context: context);

  @override
  bool get hatTime {
    _$hatTimeAtom.reportRead();
    return super.hatTime;
  }

  @override
  set hatTime(bool value) {
    _$hatTimeAtom.reportWrite(value, super.hatTime, () {
      super.hatTime = value;
    });
  }

  @override
  String toString() {
    return '''
id: ${id},
isLoading: ${isLoading},
pagevideos: ${pagevideos},
pageArticles: ${pageArticles},
pageQuote: ${pageQuote},
internet: ${internet},
hatTime: ${hatTime}
    ''';
  }
}
