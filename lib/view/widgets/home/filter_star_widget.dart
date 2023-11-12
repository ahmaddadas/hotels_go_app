// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interview_test/logic/home_controller.dart';
import 'package:interview_test/utils/my_text.dart';
import 'package:interview_test/utils/theme.dart';

class FilterStarWidget extends StatelessWidget {
  final int star;
  final VoidCallback onTap;
  FilterStarWidget({
    super.key,
    required this.star,
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
              color: homeController.selectedStar.value == star
                  ? myMainColor
                  : Colors.white,
              borderRadius: BorderRadius.circular(myRadius(context) / 2),
              border: Border.all(
                  color: homeController.selectedStar.value == star
                      ? Colors.white
                      : myBlackColor,
                  width: 1)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.star,
                color: Colors.amber,
                size: size.width / 20,
              ),
              MyText(
                  color: myBlackColor,
                  text: star.toString(),
                  fontSize: size.width / 25,
                  fontWeight: FontWeight.normal)
            ],
          ),
        ),
      );
    });
  }
}
