import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:news_sample/common_news_cards/head_news_card.dart';
import 'package:news_sample/common_news_cards/secondary_news_card.dart';
import 'package:news_sample/controller/news_controller.dart';
import 'package:news_sample/textStyles.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'News App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final NewsController _newsController = NewsController();

  @override
  void initState() {
    _newsController.addListener(() {
      setState(() {});
    });
    super.initState();
    _newsController.init();
  }

  @override
  void dispose() {
    _newsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: _newsController.isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
            child: Column(
              children: [
                if (_newsController.newsResponse?.articles != null)
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 3,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount:
                          _newsController.newsResponse?.articles!.length,
                      itemBuilder: (context, index) => HeadNewsCard(
                        headLines: _newsController
                            .newsResponse?.articles![index].title,
                        image: _newsController
                            .newsResponse?.articles![index].urlToImage,
                        time: _newsController
                            .newsResponse?.articles![index].publishedAt,
                      ),
                    ),
                  ),
                ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  primary: false,
                  itemCount: _newsController.secondaryNewsResponse
                      ?.secondaryArticles!.length,
                  itemBuilder: (context,index)=>
                    SecondaryNewsCard(
                      headLines: _newsController.secondaryNewsResponse
                          ?.secondaryArticles![index].title,
                      image: _newsController.secondaryNewsResponse
                          ?.secondaryArticles![index].urlToImage,
                      time: _newsController.secondaryNewsResponse
                          ?.secondaryArticles![index].publishedAt,
                    ),),
              ],
            ),
          ),
    );
  }
}
