import 'package:flutter/material.dart';
import 'package:interview_test/utils/my_text.dart';

import '../../../utils/theme.dart';

class SortItemWidget extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const SortItemWidget({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MyText(
            color: myBlackColor,
            text: text,
            fontSize: size.width / 25,
            fontWeight: FontWeight.normal),
        IconButton(
            onPressed: onTap,
            icon: Icon(
              Icons.arrow_forward,
              color: myBlackColor,
              size: size.width / 20,
            ))
      ],
    );
  }
}
