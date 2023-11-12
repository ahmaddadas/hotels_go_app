// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interview_test/logic/home_controller.dart';
import 'package:interview_test/utils/my_button.dart';
import 'package:interview_test/utils/my_text.dart';
import 'package:interview_test/utils/theme.dart';
import 'package:interview_test/view/widgets/home/filter_review_widget.dart';
import 'package:interview_test/view/widgets/home/filter_star_widget.dart';
import 'package:interview_test/view/widgets/home/reset_filters_button.dart';

class FiltersContainer extends StatelessWidget {
  FiltersContainer({super.key});
  HomeController homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Obx(() => AnimatedPositioned(
          duration: const Duration(milliseconds: 600),
          curve: Curves.fastOutSlowIn,
          bottom:
              homeController.isFiltersContainerOpened.value ? 0 : -size.height,
          child: Container(
            height: size.height / 1.4,
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
                        text: 'Filter Results',
                        fontSize: size.width / 25,
                        fontWeight: FontWeight.bold),
                  ),
                  MyText(
                      color: myBlackColor,
                      text: 'Price',
                      fontSize: size.width / 25,
                      fontWeight: FontWeight.bold),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyText(
                        color: myBlackColor,
                        text:
                            'From 0 to ${homeController.filterPrice.value.toInt()} USD',
                        fontSize: size.width / 30,
                        fontWeight: FontWeight.normal,
                      ),
                      Slider(
                        value: homeController.filterPrice.value,
                        min: 0.0,
                        max: 500.0,
                        onChanged: (value) {
                          homeController.filterPrice.value = value;
                        },
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MyText(
                          color: myBlackColor,
                          text: '0 USD',
                          fontSize: size.width / 30,
                          fontWeight: FontWeight.normal),
                      MyText(
                          color: myBlackColor,
                          text: '500 USD',
                          fontSize: size.width / 30,
                          fontWeight: FontWeight.normal),
                    ],
                  ),
                  MyText(
                      color: myBlackColor,
                      text: 'Rating',
                      fontSize: size.width / 25,
                      fontWeight: FontWeight.bold),
                  SizedBox(
                    height: size.height / 25,
                    width: size.width,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.all(0),
                      physics: const BouncingScrollPhysics(),
                      itemCount: homeController.starsFilterList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: size.width / 40),
                          child: FilterStarWidget(
                            star: homeController.starsFilterList[index].star,
                            onTap: () {
                              homeController.selectedStar.value =
                                  homeController.starsFilterList[index].star;
                              homeController.update();
                            },
                          ),
                        );
                      },
                    ),
                  ),
                  MyText(
                      color: myBlackColor,
                      text: 'Review',
                      fontSize: size.width / 25,
                      fontWeight: FontWeight.bold),
                  SizedBox(
                    height: size.height / 25,
                    width: size.width,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.all(0),
                      physics: const BouncingScrollPhysics(),
                      itemCount: homeController.reviewFilterList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: size.width / 40),
                          child: FilterReviewWidget(
                            number:
                                homeController.reviewFilterList[index].number,
                            onTap: () {
                              homeController.selectedReview.value =
                                  homeController.reviewFilterList[index].number;
                              homeController.update();
                            },
                          ),
                        );
                      },
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: MyButton(
                            height: size.height / 20,
                            width: size.width,
                            text: 'Apply',
                            onTap: () {
                              homeController.applyFilters();
                              homeController.isFiltersContainerOpened.value =
                                  false;
                            },
                            isWithIcon: false),
                      ),
                      SizedBox(
                        width: size.width / 100,
                      ),
                      ResetFiltersButton(onTap: () {
                        homeController.resetFilters();
                        homeController.update();
                      })
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
