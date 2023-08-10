class NewsArticleModel {
  String title;
  String description;
  String url;
  String imageUrl;

  NewsArticleModel({
    required this.title,
    required this.description,
    required this.url,
    required this.imageUrl,
  });

  factory NewsArticleModel.fromJson(Map<String, dynamic> json) {
    return NewsArticleModel(
      title: json['title']??"",
      description: json['description']??"",
      url: json['url']??"",
      imageUrl: json['urlToImage']??"",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'url': url,
      'imageUrl': imageUrl,
    };
  }
}
