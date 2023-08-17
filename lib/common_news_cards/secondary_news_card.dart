import 'package:flutter/material.dart';
import 'package:news_sample/textStyles.dart';

class SecondaryNewsCard extends StatelessWidget {
  const SecondaryNewsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 180,
      width: double.infinity,
      color: Colors.grey.shade900,
      child: Padding(
        padding:
        const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Infosys, Relience, JSW steel, among Top gainers losers today; check full list",
                    style: TextStyles.secondTitleTextStyle,
                  ),
                  Row(
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
                        "04:05 pm IST",
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

                ],
              ),
            ),
            Container(
              width: 100,
              height: 120,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                image: DecorationImage(
                    image: NetworkImage("https://images.barrons.com/im-470039/social"),
                    fit: BoxFit.cover
                ),
              ), ),
          ],
        ),
      ),
    );
  }
}
