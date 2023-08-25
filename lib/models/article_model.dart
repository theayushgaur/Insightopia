import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ArticleModel {
  String title;
  String description;
  String url;
  String urlToImage;
  // String content;

  ArticleModel({
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    // required this.content,
  });

  ArticleModel copyWith({
    String? title,
    String? description,
    String? url,
    String? urlToImage,
    String? content,
  }) {
    return ArticleModel(
      title: title ?? this.title,
      description: description ?? this.description,
      url: url ?? this.url,
      urlToImage: urlToImage ?? this.urlToImage,
      // content: content ?? this.content,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'description': description,
      'url': url,
      'urlToImage': urlToImage,
      // 'content': content,
    };
  }

  factory ArticleModel.fromMap(Map<String, dynamic> map) {
    return ArticleModel(
      title: map['title'] as String,
      description: map['description'] as String,
      url: map['url'] as String,
      urlToImage: map['urlToImage'] as String,
      // content: map['content'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ArticleModel.fromJson(String source) =>
      ArticleModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ArticleModel( title: $title, description: $description, url: $url, urlToImage: $urlToImage)';
  }

  @override
  bool operator ==(covariant ArticleModel other) {
    if (identical(this, other)) return true;

    return other.title == title &&
        other.description == description &&
        other.url == url &&
        other.urlToImage == urlToImage;
    // other.content == content;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        description.hashCode ^
        url.hashCode ^
        urlToImage.hashCode;
    // content.hashCode;
  }
}
