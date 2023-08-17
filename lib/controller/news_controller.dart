import 'package:flutter/cupertino.dart';
import 'package:news_sample/model/header_response.dart';
import 'package:news_sample/repository/news_repository.dart';

class NewsController with ChangeNotifier{

  final NewsRepository _newsRepository = NewsRepository();

  HeaderNewsResponse? _headerNewsResponse;
  HeaderNewsResponse? get newsResponse => HeaderNewsResponse();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void init()async{
   await getNews();
  }

  Future<HeaderNewsResponse?> getNews() async {
    toggleLoading();
    _headerNewsResponse = await _newsRepository.getNews();
    toggleLoading();
    debugPrint("response ${_headerNewsResponse?.articles?[0].title.toString()}");
    return _headerNewsResponse;
  }

  void toggleLoading() {
    _isLoading = !_isLoading;
    notifyListeners();
  }
}