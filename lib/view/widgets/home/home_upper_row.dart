import 'package:flutter/material.dart';
import 'package:interview_test/utils/my_text.dart';
import 'package:interview_test/utils/theme.dart';

class HomeUpperRow extends StatelessWidget {
  final String image;
  final VoidCallback onTapProfile;
  const HomeUpperRow(
      {super.key, required this.image, required this.onTapProfile});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                MyText(
                    color: myMainColor,
                    text: 'Hotels',
                    fontSize: size.width / 15,
                    fontWeight: FontWeight.bold),
                MyText(
                    color: mySecondColor,
                    text: 'Go',
                    fontSize: size.width / 15,
                    fontWeight: FontWeight.bold),
              ],
            ),
            MyText(
                color: myBlackColor,
                text: 'Best hotels on the world',
                fontSize: size.width / 30,
                fontWeight: FontWeight.normal),
          ],
        ),
        InkWell(
          onTap: onTapProfile,
          child: Container(
            height: size.height / 18,
            width: size.width / 8.5,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(myRadius(context)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: size.width / 30,
                    offset: const Offset(15, 5),
                  ),
                ],
                image: DecorationImage(
                    image: NetworkImage(image), fit: BoxFit.cover)),
          ),
        )
      ],
    );
  }
}
