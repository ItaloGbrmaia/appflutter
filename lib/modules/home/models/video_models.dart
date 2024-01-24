class VideoModel {
  final int id;
  final String name;
  final String description;
  final String? file;
  final String url;
  final String url2;
  final String awsUrl;
  final String image;
  final String imageUrl;
  final int premium;
  final int order;

  VideoModel({
    required this.id,
    required this.name,
    required this.description,
    required this.file,
    required this.url,
    required this.url2,
    required this.awsUrl,
    required this.image,
    required this.imageUrl,
    required this.premium,
    required this.order,
  });

  factory VideoModel.fromJson(Map<String, dynamic> json) {
    return VideoModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      file: json['file'],
      url: json['url'] ?? '',
      url2: json['url2'] ?? '',
      awsUrl: json['aws_url'] ?? '',
      image: json['image'] ?? '',
      imageUrl: json['image_url'] ?? '',
      premium: json['premium'] ?? 0,
      order: json['order'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'file': file,
      'url': url,
      'url2': url2,
      'aws_url': awsUrl,
      'image': image,
      'image_url': imageUrl,
      'premium': premium,
      'order': order,
    };
  }
}
