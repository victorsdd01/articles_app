import 'package:equatable/equatable.dart';

class ArticleResponse {
  List<Article> articles;

  ArticleResponse({required this.articles});

  factory ArticleResponse.fromMap(List<dynamic> data) => ArticleResponse(articles: List<Article>.from(data.map((e)=> Article.fromJson(e))));
}

class Article extends Equatable {
    String? id;
    String author;
    String title;
    String description;
    String url;
    String urlToImage;
    DateTime publishedAt;

    Article({
        this.id,
        required this.author,
        required this.title,
        required this.description,
        required this.url,
        required this.urlToImage,
        required this.publishedAt,
    });

    factory Article.fromJson(Map<String, dynamic> json) => Article(
        id: json["_id"],
        author: json["author"],
        title: json["title"],
        description: json["description"],
        url: json["url"],
        urlToImage: json["urlToImage"],
        publishedAt: DateTime.parse(json["publishedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "author": author,
        "title": title,
        "description": description,
        "url": url,
        "urlToImage": urlToImage,
        "publishedAt": publishedAt.toIso8601String(),
    };

    Map<String, dynamic> newArticle() => {
        "author": author,
        "title": title,
        "description": description,
        "url": url,
        "urlToImage": urlToImage,
        "publishedAt": DateTime.timestamp().toString()
    };
    
      @override
      List<Object?> get props => [
        id,
        author,
        title,
        description,
        url,
        urlToImage,
        publishedAt,
      ];
}