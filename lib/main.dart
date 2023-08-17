import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:news_sample/common_news_cards/head_news_card.dart';
import 'package:news_sample/common_news_cards/secondary_news_card.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Colors.black12,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              children: [
                for(int i =0;i<3;i++)...[const HeadNewsCard(), const SizedBox(height: 5),],
                for(int i =0;i<8;i++)...[const SecondaryNewsCard(), const SizedBox(height: 5),],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
