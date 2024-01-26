import 'package:app/app/modules/models/quote_models.dart';

abstract class QuoteLoad {
  Future<List<QuoteModel>?> loadQuote(int id);
}
