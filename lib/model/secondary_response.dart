import 'package:news_sample/model/header_response.dart';

class SecondaryNewsResponse {
  final String? status;
  final int? totalResults;
  final List<Articles>? secondaryArticles;

  SecondaryNewsResponse({
    this.status,
    this.totalResults,
    this.secondaryArticles,
  });

  SecondaryNewsResponse.fromJson(Map<String, dynamic> json)
      : status = json['status'] as String?,
        totalResults = json['totalResults'] as int?,
        secondaryArticles = (json['articles'] as List?)?.map((dynamic e) => Articles.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'status' : status,
    'totalResults' : totalResults,
    'articles' : secondaryArticles?.map((e) => e.toJson()).toList()
  };
}
