import 'package:flutter/material.dart';
import 'package:news_sample/textStyles.dart';
import 'package:news_sample/utils.dart';


class HeadNewsCard extends StatelessWidget {
  const HeadNewsCard({super.key, this.image, this.headLines, this.time});
  final String? image;
  final String? headLines;
  final String? time;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height/3,
      width: MediaQuery.of(context).size.width,
      color: Colors.grey.shade900,
      child:
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 8),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            image: DecorationImage(
                image: NetworkImage(image ?? "https://images.wsj.net/im-836261/social"),
                fit: BoxFit.cover
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(headLines??"headlines",
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
                        Text(Utils.reportTimeFormat(time),style: TextStyles.headerItalicStyle,),
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
