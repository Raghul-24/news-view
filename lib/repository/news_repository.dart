import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:news_sample/model/header_response.dart';
import 'package:news_sample/model/secondary_response.dart';
import 'package:news_sample/networking/api_endpoint.dart';
import 'package:news_sample/networking/api_service.dart';

class NewsRepository{
  final ApiService _apiService = ApiService();

  Future<HeaderNewsResponse> getNews() async {
    log(ApiEndpoint.news(NewsEndpoint.headNews));
    return await _apiService.getDocumentData<HeaderNewsResponse>(
      endpoint: ApiEndpoint.news(NewsEndpoint.headNews),
      converter: (responseBody) {
        debugPrint("profile response $responseBody}");
        return HeaderNewsResponse.fromJson(responseBody);
      },
      onError: (s){
        log("Error Occured Man");
      }
    );
  }

  Future<SecondaryNewsResponse> getSecondaryNews() async {
    log(ApiEndpoint.news(NewsEndpoint.secondaryNews));
    return await _apiService.getDocumentData<SecondaryNewsResponse>(
        endpoint: ApiEndpoint.news(NewsEndpoint.secondaryNews),
        converter: (responseBody) {
          debugPrint("profile response $responseBody}");
          return SecondaryNewsResponse.fromJson(responseBody);
        },
        onError: (s){
          log("Error Occured Man");
        }
    );
  }
}