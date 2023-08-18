import 'package:flutter/cupertino.dart';
import 'package:news_sample/model/header_response.dart';
import 'package:news_sample/model/secondary_response.dart';
import 'package:news_sample/repository/news_repository.dart';

class NewsController with ChangeNotifier{

  final NewsRepository _newsRepository = NewsRepository();

  HeaderNewsResponse? _headerNewsResponse;
  HeaderNewsResponse? get newsResponse => _headerNewsResponse;

  SecondaryNewsResponse? _secondaryNewsResponse;
  SecondaryNewsResponse? get secondaryNewsResponse => _secondaryNewsResponse;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void init()async{
    await getNews();
  }

  Future getNews() async {
    toggleLoading();
    _headerNewsResponse = await _newsRepository.getNews();
    _secondaryNewsResponse = await _newsRepository.getSecondaryNews();
    toggleLoading();
    debugPrint("response ${_secondaryNewsResponse?.secondaryArticles?[0].title.toString()}");
    debugPrint("response ${_headerNewsResponse?.articles?[0].title.toString()}");
    notifyListeners();
  }

  void toggleLoading() {
    _isLoading = !_isLoading;
    notifyListeners();
  }
}