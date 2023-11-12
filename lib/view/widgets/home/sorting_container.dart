// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interview_test/logic/home_controller.dart';
import 'package:interview_test/utils/my_text.dart';
import 'package:interview_test/utils/theme.dart';
import 'package:interview_test/view/widgets/home/sort_item_widget.dart';

class SortingContainer extends StatelessWidget {
  SortingContainer({super.key});
  HomeController homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 600),
      curve: Curves.fastOutSlowIn,
      bottom: homeController.isSortingContainerOpened.value ? 0 : -size.height,
      child: Container(
        height: size.height / 1.5,
        width: size.width,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(myRadius(context) * 4),
                topRight: Radius.circular(myRadius(context) * 4))),
        child: Padding(
          padding: EdgeInsets.all(size.width / 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Center(
                child: Container(
                  height: size.width / 80,
                  width: size.width / 10,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius:
                          BorderRadius.circular(myRadius(context) / 4)),
                ),
              ),
              Center(
                child: MyText(
                    color: myBlackColor,
                    text: 'Sort Results',
                    fontSize: size.width / 25,
                    fontWeight: FontWeight.bold),
              ),
              SortItemWidget(
                  text: 'Our Recommendations',
                  onTap: () {
                    homeController.ourRecommendations();
                    homeController.isSortingContainerOpened.value = false;
                  }),
              SortItemWidget(
                  text: 'Rating & Recommended',
                  onTap: () {
                    homeController.ratingAndRecommended();
                    homeController.isSortingContainerOpened.value = false;
                  }),
              SortItemWidget(
                  text: 'Price & Recommended',
                  onTap: () {
                    homeController.priceAndRecommended();
                    homeController.isSortingContainerOpened.value = false;
                  }),
              SortItemWidget(
                  text: 'Distance & Recommended',
                  onTap: () {
                    homeController.distanceAndRecommended();
                    homeController.isSortingContainerOpened.value = false;
                  }),
              SortItemWidget(
                  text: 'Rating Only',
                  onTap: () {
                    homeController.ratingOnly();
                    homeController.isSortingContainerOpened.value = false;
                  }),
              SortItemWidget(
                  text: 'Price Only',
                  onTap: () {
                    homeController.priceOnly();
                    homeController.isSortingContainerOpened.value = false;
                  }),
              SortItemWidget(
                  text: 'Distance Only',
                  onTap: () {
                    homeController.distanceOnly();
                    homeController.isSortingContainerOpened.value = false;
                  }),
              SortItemWidget(
                  text: 'All Hotels',
                  onTap: () {
                    homeController.allHotels();
                    homeController.isSortingContainerOpened.value = false;
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
