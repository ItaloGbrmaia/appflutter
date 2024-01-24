class QuoteModel {
  final int id;
  final String text;
  final String author;
  final int order;

  QuoteModel({
    required this.id,
    required this.text,
    required this.author,
    required this.order,
  });

  factory QuoteModel.fromJson(Map<String, dynamic> json) {
    return QuoteModel(
      id: json['id'] ?? 0,
      text: json['text'] ?? "",
      author: json['author'] ?? "",
      order: json['order'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'text': text,
      'author': author,
      'order': order,
    };
  }
}
