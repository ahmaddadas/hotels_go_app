// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interview_test/model/filter_review_model.dart';
import 'package:interview_test/model/filter_star_model.dart';
import 'package:interview_test/model/hotel_model.dart';
import 'package:interview_test/services/api_calls.dart';

class HomeController extends GetxController {
  var isLoading = false.obs;
  TextEditingController searchController = TextEditingController();
  var apiHotels = <HotelModel>[].obs;
  var selectedHotels = <HotelModel>[].obs;
  var isSortingContainerOpened = false.obs;
  var isFiltersContainerOpened = false.obs;
  var isSearching = false.obs;
  var searchedHotels = <HotelModel>[];
  Future<void> fetchHotels() async {
    try {
      isLoading(true);
      var items = await ApiCalls.getHotels();
      apiHotels.assignAll(
          items.map((itemJson) => HotelModel.fromJson(itemJson)).toList());
    } catch (e) {
      print('Failed to fetch hotels : $e');
    } finally {
      isLoading(false);
    }
  }

  @override
  onInit() {
    selectedHotels.addAll(myHotels);
    super.onInit();
  }

  ///////////////////////// Local data ///////////////////

  List<HotelModel> myHotels = [
    HotelModel(
        name: "Hotel Fairmont Nile City",
        starts: 5,
        price: 100.0,
        currency: 'USD',
        image:
            "https://images.unsplash.com/photo-1455587734955-081b22074882?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        reviewScore: 8.8,
        review: 'Excellent',
        address: "12 miles from the center"),
    HotelModel(
        name: "Waldorf Astoria Cairo Heliopolis",
        starts: 4,
        price: 152,
        currency: 'USD',
        image:
            "https://images.unsplash.com/photo-1542314831-068cd1dbfeeb?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        reviewScore: 9.5,
        review: 'Good',
        address: "12 miles from the center"),
    HotelModel(
        name: "The St. Regis Cairo",
        starts: 5,
        price: 450,
        currency: 'USD',
        image:
            "https://images.unsplash.com/photo-1566073771259-6a8506099945?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        reviewScore: 10.0,
        review: 'Excellent',
        address: "12 miles from the center"),
    HotelModel(
        name: "Hilton Cairo Zamalek Residences",
        starts: 4,
        price: 357,
        currency: 'USD',
        image:
            "https://images.unsplash.com/photo-1582719508461-905c673771fd?q=80&w=1325&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        reviewScore: 7.5,
        review: 'Very Good',
        address: "12 miles from the center"),
    HotelModel(
        name: "The Nile Ritz-Carlton, Cairo",
        starts: 4,
        price: 152,
        currency: 'USD',
        image:
            'https://images.unsplash.com/photo-1584132967334-10e028bd69f7?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        reviewScore: 9.5,
        review: "Excellent",
        address: "12 miles from the center"),
    HotelModel(
        name: "Sofitel Cairo Nile El Gezirah",
        starts: 4,
        price: 357,
        currency: 'USD',
        image:
            'https://images.unsplash.com/photo-1535827841776-24afc1e255ac?q=80&w=1335&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        reviewScore: 7.5,
        review: 'Very Good',
        address: "12 miles from the center"),
    HotelModel(
        name: "The Nile Ritz-Carlton, Cairo",
        starts: 3,
        price: 345,
        currency: 'USD',
        image:
            'https://images.unsplash.com/photo-1590447158019-883d8d5f8bc7?q=80&w=1332&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        reviewScore: 9.5,
        review: 'Excellent',
        address: "12 miles from the center")
  ];

  ////////////////////// Searching //////////////////

  performSearch(String text) {
    if (text.isEmpty) {
      isSearching.value = false;
    } else {
      isSearching.value = true;
      searchedHotels = selectedHotels
          .where((element) =>
              element.name.toLowerCase().contains(text.toLowerCase()))
          .toList();
    }
  }

  ////////////////////// Sorting ////////////////////

  void ourRecommendations() {
    selectedHotels.clear();
    List<HotelModel> sortedHotels = List.from(myHotels);
    sortedHotels.sort((a, b) => b.reviewScore.compareTo(a.reviewScore));
    selectedHotels.addAll(sortedHotels.take(3));
    update();
  }

  void ratingAndRecommended() {
    selectedHotels.clear();
    List<HotelModel> sortedHotels = List.from(myHotels);
    sortedHotels.sort((a, b) {
      int compare = b.starts.compareTo(a.starts);
      if (compare == 0) {
        compare = b.reviewScore.compareTo(a.reviewScore);
      }
      return compare;
    });
    selectedHotels.addAll(sortedHotels.take(3));
    update();
  }

  void priceAndRecommended() {
    selectedHotels.clear();
    List<HotelModel> sortedHotels = List.from(myHotels);
    sortedHotels.sort((a, b) {
      int compare = a.price.compareTo(b.price);
      if (compare == 0) {
        compare = b.reviewScore.compareTo(a.reviewScore);
      }
      return compare;
    });
    selectedHotels.addAll(sortedHotels.take(3));
    update();
  }

  void distanceAndRecommended() {
    selectedHotels.clear();
    List<HotelModel> sortedHotels = List.from(myHotels);
    sortedHotels.sort((a, b) {
      int compare = int.parse(a.address.split(' ')[0])
          .compareTo(int.parse(b.address.split(' ')[0]));
      if (compare == 0) {
        compare = b.reviewScore.compareTo(a.reviewScore);
        update();
      }
      return compare;
    });
    selectedHotels.addAll(sortedHotels.take(3));
  }

  void ratingOnly() {
    selectedHotels.clear();
    List<HotelModel> sortedHotels = List.from(myHotels);
    sortedHotels.sort((a, b) => b.starts.compareTo(a.starts));
    selectedHotels.addAll(sortedHotels.take(3));
    update();
  }

  void priceOnly() {
    selectedHotels.clear();
    List<HotelModel> sortedHotels = List.from(myHotels);
    sortedHotels.sort((a, b) => a.price.compareTo(b.price));
    selectedHotels.addAll(sortedHotels.take(3));
    update();
  }

  void distanceOnly() {
    selectedHotels.clear();
    List<HotelModel> sortedHotels = List.from(myHotels);
    sortedHotels.sort((a, b) => int.parse(a.address.split(' ')[0])
        .compareTo(int.parse(b.address.split(' ')[0])));
    selectedHotels.addAll(sortedHotels.take(3));
    update();
  }

  void allHotels() {
    selectedHotels.clear();
    selectedHotels.addAll(myHotels);
    update();
  }

  ///////////////////// Filters ///////////////////////
  var selectedStar = 0.obs;
  var selectedReview = 100.0.obs;
  var filterPrice = 0.0.obs;
  List<FilterStarModel> starsFilterList = [
    FilterStarModel(1, 0),
    FilterStarModel(2, 1),
    FilterStarModel(3, 2),
    FilterStarModel(4, 3),
    FilterStarModel(5, 4),
  ];
  List<FilterReviewModel> reviewFilterList = [
    FilterReviewModel(0.0, 0),
    FilterReviewModel(7.0, 1),
    FilterReviewModel(7.5, 2),
    FilterReviewModel(8.0, 3),
    FilterReviewModel(8.5, 4),
  ];

  void applyFilters() {
    selectedHotels.clear();

    double maxPrice = filterPrice.value;
    int star = selectedStar.value;
    double review = selectedReview.value;

    List<HotelModel> filteredHotels = myHotels.where((hotel) {
      return hotel.price <= maxPrice &&
          hotel.starts == star &&
          hotel.reviewScore >= review;
    }).toList();

    selectedHotels.addAll(filteredHotels);
    update();
  }

  resetFilters() {
    selectedHotels.clear();
    selectedHotels.addAll(myHotels);
    filterPrice.value = 0.0;
    selectedStar.value = 0;
    selectedReview.value = 100.0;
    update();
  }
}
