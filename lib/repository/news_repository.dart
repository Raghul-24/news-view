import 'package:flutter/cupertino.dart';
import 'package:news_sample/model/header_response.dart';
import 'package:news_sample/networking/api_endpoint.dart';
import 'package:news_sample/networking/api_service.dart';

class NewsRepository{
  final ApiService _apiService = ApiService();

  Future<HeaderNewsResponse> getNews() async {
    return await _apiService.getDocumentData<HeaderNewsResponse>(
      endpoint: ApiEndpoint.news(NewsEndpoint.headNews),
      converter: (responseBody) {
        debugPrint("profile response $responseBody}");
        return HeaderNewsResponse.fromJson(responseBody);
      },
    );
  }
}