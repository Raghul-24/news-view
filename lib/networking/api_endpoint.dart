import 'package:flutter/material.dart';

@immutable
class ApiEndpoint {
  const ApiEndpoint._();
  static const String baseUrl = stagingUrl;
  static const String stagingUrl = 'https://newsapi.org/v2';
  static const String newsAPIkey = '2236525b77d8465192b7db07da520343';

  static String news(NewsEndpoint endpoint) {
    var path = baseUrl;
    switch (endpoint) {
      case NewsEndpoint.headNews:
        return '$path/top-headlines?country=us&category=business&apiKey=$newsAPIkey';
      case NewsEndpoint.secondaryNews:
        return '$path/everything?domains=wsj.com&apiKey=$newsAPIkey';
    }
  }
}

enum NewsEndpoint {
  headNews,
  secondaryNews,
}

