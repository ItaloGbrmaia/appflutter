class ArticleModelID {
  final int id;
  final String text;
  final String title;
  final String imageUrl;
  final String authorName;
  final String url;
  final int premium;
  final int order;
  final String image;

  ArticleModelID({
    required this.id,
    required this.text,
    required this.title,
    required this.imageUrl,
    required this.authorName,
    required this.url,
    required this.premium,
    required this.order,
    required this.image,
  });

  factory ArticleModelID.fromJson(Map<String, dynamic> json) {
    return ArticleModelID(
      id: json['id'] ?? 0,
      text: json['text'] ?? '',
      title: json['title'] ?? '',
      imageUrl: json['image_url'] ?? '',
      authorName: json['author_name'] ?? '',
      url: json['url'] ?? '',
      premium: json['premium'] ?? 0,
      order: json['order'] ?? 0,
      image: json['image'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'text': text,
      'title': title,
      'image_url': imageUrl,
      'author_name': authorName,
      'url': url,
      'premium': premium,
      'order': order,
      'image': image,
    };
  }
}
