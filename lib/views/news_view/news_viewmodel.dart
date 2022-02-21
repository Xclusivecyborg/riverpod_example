import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/services/network.dart';
import 'package:riverpod_example/views/news_view/news_viewstate.dart';

class NewsViewModel extends StateNotifier<NewsViewState> {
  NewsViewModel(this._network) : super(NewsViewState(news: []));

  final NetworkRequest _network;

  Future<void> getNews() async {
    try {
      final response = await _network.getNews();
      state = state.updateState(
        isLoading: false,
        news: response,
      );
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  void upDateChecked(bool val) {
    state = state.updateState(isChecked: val);
  }
}
