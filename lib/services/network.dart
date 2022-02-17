import 'package:dio/dio.dart';
import 'package:riverpod_example/app/models/news_model.dart';

class NetworkRequest {
  NetworkRequest({ required this.dio});
  Dio dio;
  String appUrl =
      'https://newsapi.org/v2/everything?q=apple&from=2022-02-16&to=2022-02-16&sortBy=popularity&apiKey=c5810690c39b416d8b642f75e41612e9';
  Future<List<NewsModel>>? getNews() async {
    try {
      final response = await dio.get(appUrl);
      if (response.statusCode == 200) {}
      List news = response.data['articles'];
      List<NewsModel> newList = news.map((e) => NewsModel.fromJson(e)).toList();
      return newList;
    } catch (e) {
      rethrow;
    }
  }
}
