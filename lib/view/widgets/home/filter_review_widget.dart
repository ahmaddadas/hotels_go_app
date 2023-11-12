// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interview_test/logic/home_controller.dart';
import 'package:interview_test/utils/my_text.dart';
import 'package:interview_test/utils/theme.dart';

class FilterReviewWidget extends StatelessWidget {
  final double number;
  final VoidCallback onTap;
  FilterReviewWidget({
    super.key,
    required this.number,
    required this.onTap,
  });
  HomeController homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return GetBuilder<HomeController>(builder: (homeController) {
      return InkWell(
        onTap: onTap,
        child: Container(
          height: size.height / 25,
          width: size.width / 7,
          decoration: BoxDecoration(
              color: homeController.selectedReview.value == number
                  ? mySecondColor
                  : Colors.white,
              borderRadius: BorderRadius.circular(myRadius(context) / 2),
              border: Border.all(
                  color: homeController.selectedReview.value == number
                      ? Colors.white
                      : myBlackColor,
                  width: 1)),
          child: Center(
            child: MyText(
                color: myBlackColor,
                text: '$number +',
                fontSize: size.width / 25,
                fontWeight: FontWeight.normal),
          ),
        ),
      );
    });
  }
}
