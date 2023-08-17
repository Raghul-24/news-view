import 'package:flutter/material.dart';
import 'package:news_sample/textStyles.dart';


class HeadNewsCard extends StatelessWidget {
  const HeadNewsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230,
      color: Colors.grey.shade900,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 8),
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            image: DecorationImage(
                image: NetworkImage("https://img.freepik.com/free-photo/low-angle-shot-tall-city-building-with-blue-sky-background-new-york_181624-20345.jpg?w=2000"),
                fit: BoxFit.cover
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("Infosys, Relience, JSW steel, among Top gainers losers today; check full list",
                  style: TextStyles.headerTitleTextStyle,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text("2 min read",style: TextStyles.headerItalicStyle,),
                        const SizedBox(width: 6),
                        const Icon(Icons.square, color: Colors.white, size: 10,),
                        const SizedBox(width: 6),
                        Text("04:05 pm IST",style: TextStyles.headerItalicStyle,),
                        const SizedBox(width: 6),
                        const Icon(Icons.square, color: Colors.white, size: 10,),
                        const SizedBox(width: 6),
                        Text("markets",style: TextStyles.headerItalicStyle,),
                        const SizedBox(width: 6),
                      ],
                    ),
                    const Icon(Icons.more_vert_outlined, color: Colors.white, size: 25,),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}