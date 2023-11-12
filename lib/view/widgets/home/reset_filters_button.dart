import 'package:flutter/material.dart';
import 'package:interview_test/utils/my_text.dart';
import 'package:interview_test/utils/theme.dart';

class ResetFiltersButton extends StatelessWidget {
  final VoidCallback onTap;
  const ResetFiltersButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return InkWell(
      onTap: onTap,
      child: Container(
        height: size.height / 20,
        width: size.width / 5,
        decoration: BoxDecoration(
            color: mySecondColor,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: size.width / 30,
                offset: const Offset(15, 5),
              ),
            ],
            borderRadius: BorderRadius.circular(myRadius(context))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.history,
              color: Colors.white,
              size: size.width / 20,
            ),
            MyText(
                color: Colors.white,
                text: 'Reset',
                fontSize: size.width / 30,
                fontWeight: FontWeight.normal)
          ],
        ),
      ),
    );
  }
}
