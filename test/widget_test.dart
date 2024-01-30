// import 'package:app/app/controller/article_controller.dart';
// import 'package:flutter_test/flutter_test.dart'; // Substitua pelo caminho correto para o seu controlador
// import 'package:app/app/factories/articles_id_interface.dart'; // Substitua pelo caminho correto para a sua fábrica
// import 'package:app/app/models/article_id_models.dart';
// import 'package:mockito/mockito.dart';

// class MockArticleLoadId extends Mock implements ArticleLoadId {}

// void main() {
//   late ArticleController articleController;
//   late MockArticleLoadId mockLoadArticle;

//   setUp(() {
//     mockLoadArticle = MockArticleLoadId();
//     articleController = ArticleController(loadArticle: mockLoadArticle);
//   });

//   final id = 2;

//   test('Teste de carga de artigo com sucesso', () async {
//     final fakeArticle = ArticleModelID(
//       id: 1,
//       title: 'Test Article',
//       text: '',
//       imageUrl: '',
//       authorName: '',
//       url: '',
//       image: '',
//       premium: 2,
//       order: 2,
//       authordescription: '',
//       fullText: '',
//       authorimage: '',
//     );
//     when(mockLoadArticle.loadArticle(id)).thenAnswer((_) async => fakeArticle);

//     await articleController.loadArticle();

//     expect(articleController.isLoading, false);
//     expect(articleController.internet, true);
//     expect(articleController.allArticle?.length, 1);
//   });

//   test('Teste de carga de artigo sem conectividade', () async {
//     when(mockLoadArticle.loadArticle(id)).thenAnswer((_) async => null);

//     // Chamando o método de carregamento do artigo
//     await articleController.loadArticle();

//     expect(articleController.isLoading, false);
//     expect(articleController.internet, false);
//     expect(articleController.allArticle, isEmpty);
//   });

//   test('Teste de carga de artigo com erro', () async {
//     when(mockLoadArticle.loadArticle(id)).thenThrow(Exception('Erro simulado'));

//     // Chamando o método de carregamento do artigo
//     await articleController.loadArticle();

//     // Verificando se o estado do controlador foi atualizado corretamente
//     expect(articleController.isLoading, false);
//   });
// }


// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';

// import 'package:app/main.dart';

// void main() {
//   testWidgets('Counter increments smoke test', (WidgetTester tester) async {
//     // Build our app and trigger a frame.
//     await tester.pumpWidget(const MyApp());

//     // Verify that our counter starts at 0.
//     expect(find.text('0'), findsOneWidget);
//     expect(find.text('1'), findsNothing);

//     // Tap the '+' icon and trigger a frame.
//     await tester.tap(find.byIcon(Icons.add));
//     await tester.pump();

//     // Verify that our counter has incremented.
//     expect(find.text('0'), findsNothing);
//     expect(find.text('1'), findsOneWidget);
//   });
// }
