import 'package:flutter/material.dart';
import 'package:news_sample/textStyles.dart';
import 'package:news_sample/utils.dart';

class SecondaryNewsCard extends StatelessWidget {
  const SecondaryNewsCard({super.key, this.headLines, this.image, this.time});
  final String?  headLines;
  final String? image;
  final String? time;

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: double.infinity,
      color: Colors.grey.shade900,
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: Padding(
        padding:
        const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    headLines??"HeadLines",
                    style: TextStyles.secondTitleTextStyle,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      children: [
                        Text(
                          "2 min read",
                          style: TextStyles.secondItalicStyle,
                        ),
                        const SizedBox(width: 6),
                        const Icon(
                          Icons.circle,
                          color: Colors.white,
                          size: 5,
                        ),
                        const SizedBox(width: 6),
                        Text(
                         Utils.reportTimeFormat(time),
                          style: TextStyles.secondItalicStyle,
                        ),
                        const SizedBox(width: 6),
                        const Icon(
                          Icons.circle,
                          color: Colors.white,
                          size: 5,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          "markets",
                          style: TextStyles.orangeItalicStyle,
                        ),
                        const SizedBox(width: 6),
                        const Icon(
                          Icons.more_horiz_outlined,
                          color: Colors.white,
                          size: 25,
                        )
                      ],
                    ),
                  ),

                ],
              ),
            ),
            Container(
              width: 100,
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                image: DecorationImage(
                    image: NetworkImage(image??"https://images.wsj.net/im-834584/social"),
                    fit: BoxFit.cover
                ),
              ), ),
          ],
        ),
      ),
    );
  }
}
