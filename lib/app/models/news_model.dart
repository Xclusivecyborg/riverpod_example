class NewsModel {
  final String? author;
  final String? title;
  final String? url;
  final String? content;

  NewsModel({this.author, this.title, this.url, this.content});

  factory NewsModel.fromJson(json) {
    return NewsModel(
      author: json['author'] ?? '',
      content: json['content'] ?? '',
      title: json['title'] ?? '',
      url: json['urlToImage'] ?? '',
    );
  }

  @override
  String toString() {
    return 'author : $author , title: $title, url: $url, content: $content ';
  }
}
