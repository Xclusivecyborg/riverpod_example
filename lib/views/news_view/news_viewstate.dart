import 'package:riverpod_example/app/models/news_model.dart';

class NewsViewState {
  final bool isLoading;
  final List<NewsModel> news;
  bool isChecked;

  NewsViewState({required this.news, this.isChecked = false, this.isLoading = true});

  NewsViewState update({bool? isLoading, bool? isChecked, List<NewsModel>? news}) {
    return NewsViewState(
        isLoading: isLoading ?? this.isLoading, 
        news: news ?? this.news,
        isChecked: isChecked ?? this.isChecked,
        );
  }
}
