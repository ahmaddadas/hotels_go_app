import 'package:flutter/material.dart';
import 'package:interview_test/utils/my_text.dart';
import 'package:interview_test/utils/theme.dart';

class SortRow extends StatelessWidget {
  final VoidCallback onTapOurRecommendations,
      onTapRatingAndRecommendations,
      onTapAll;

  const SortRow({
    Key? key,
    required this.onTapOurRecommendations,
    required this.onTapRatingAndRecommendations,
    required this.onTapAll,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 2,
          child: InkWell(
            onTap: onTapOurRecommendations,
            child: Container(
              height: size.height / 30,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: size.width / 30,
                    offset: const Offset(15, 5),
                  ),
                ],
                color: Colors.white,
                borderRadius: BorderRadius.circular(myRadius(context)),
              ),
              child: Center(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: MyText(
                    color: myBlackColor,
                    text: 'Our recommendations',
                    fontSize: size.width / 35,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          width: size.width / 100,
        ),
        Expanded(
          flex: 2,
          child: InkWell(
            onTap: onTapRatingAndRecommendations,
            child: Container(
              height: size.height / 30,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: size.width / 30,
                    offset: const Offset(15, 5),
                  ),
                ],
                color: Colors.white,
                borderRadius: BorderRadius.circular(myRadius(context)),
              ),
              child: Center(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: MyText(
                    color: myBlackColor,
                    text: 'Rating & Recommended',
                    fontSize: size.width / 35,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          width: size.width / 100,
        ),
        Expanded(
          flex: 1,
          child: InkWell(
            onTap: onTapAll,
            child: Container(
              height: size.height / 30,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: size.width / 30,
                    offset: const Offset(15, 5),
                  ),
                ],
                color: Colors.white,
                borderRadius: BorderRadius.circular(myRadius(context)),
              ),
              child: Center(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: MyText(
                    color: myBlackColor,
                    text: 'All +',
                    fontSize: size.width / 35,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
