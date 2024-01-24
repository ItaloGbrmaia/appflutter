import 'package:app/modules/home/models/Quote_models.dart';

abstract class QuoteLoad {
  Future<List<QuoteModel>?> loadQuote(int id);
}
