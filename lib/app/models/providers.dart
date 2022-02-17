import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/services/network.dart';
import 'package:riverpod_example/views/news_view/news_viewmodel.dart';
import 'package:riverpod_example/views/news_view/news_viewstate.dart';

final newsService = Provider((ref) => NetworkRequest(dio: Dio()));
final newsViewmodelProvider =
    StateNotifierProvider<NewsViewModel, NewsViewState>(
  (ref) => NewsViewModel(
    ref.read(newsService),
  ),
);
