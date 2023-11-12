// ignore_for_file: must_be_immutable, deprecated_member_use
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interview_test/logic/home_controller.dart';
import 'package:interview_test/utils/theme.dart';
import 'package:interview_test/view/widgets/home/filters_container.dart';
import 'package:interview_test/view/widgets/home/home_upper_row.dart';
import 'package:interview_test/view/widgets/home/hotel_container.dart';
import 'package:interview_test/view/widgets/home/search_row.dart';
import 'package:interview_test/view/widgets/home/sort_row.dart';
import 'package:interview_test/view/widgets/home/sorting_container.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  HomeController homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return SafeArea(
      child: Scaffold(body: Obx(() {
        if (homeController.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(
              color: myMainColor,
            ),
          );
        } else {
          return Stack(
            alignment: Alignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(size.width / 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    HomeUpperRow(
                        image:
                            'https://images.unsplash.com/photo-1521252659862-eec69941b071?q=80&w=1525&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                        onTapProfile: () {}),
                    SizedBox(
                      height: size.height / 30,
                    ),
                    SearchRow(
                      onChanged: (value) {
                        homeController.performSearch(value);
                      },
                      onTapFilters: () {
                        homeController.isFiltersContainerOpened.value = true;
                      },
                      searchController: homeController.searchController,
                    ),
                    SizedBox(
                      height: size.height / 60,
                    ),
                    SortRow(onTapOurRecommendations: () {
                      homeController.ourRecommendations();
                    }, onTapRatingAndRecommendations: () {
                      homeController.ratingAndRecommended();
                    }, onTapAll: () {
                      homeController.isSortingContainerOpened.value = true;
                    }),
                    SizedBox(
                      height: size.height / 30,
                    ),
                    Expanded(
                        child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      padding: const EdgeInsets.all(0),
                      physics: const BouncingScrollPhysics(),
                      itemCount: homeController.isSearching.value
                          ? homeController.searchedHotels.length
                          : homeController.selectedHotels.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: size.width / 40),
                          child: HotelContainer(
                              hotel: homeController.isSearching.value
                                  ? homeController.searchedHotels[index]
                                  : homeController.selectedHotels[index]),
                        );
                      },
                    ))
                  ],
                ),
              ),
              if (homeController.isSortingContainerOpened.value ||
                  homeController.isFiltersContainerOpened.value)
                InkWell(
                  onTap: () {
                    homeController.isSortingContainerOpened.value = false;
                    homeController.isFiltersContainerOpened.value = false;
                  },
                  child: SizedBox(
                    height: size.height,
                    width: size.width,
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                      child: Container(
                        color: Colors.grey.withOpacity(0.2),
                      ),
                    ),
                  ),
                ),
              SortingContainer(),
              FiltersContainer()
            ],
          );
        }
      })),
    );
  }
}
