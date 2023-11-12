import 'dart:convert';

List<HotelModel> hotelModelFromJson(String str) =>
    List<HotelModel>.from(json.decode(str).map((x) => HotelModel.fromJson(x)));

String hotelModelToJson(List<HotelModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HotelModel {
  String name;
  int starts;
  double price;
  String currency;
  String image;
  double reviewScore;
  String review;
  String address;

  HotelModel({
    required this.name,
    required this.starts,
    required this.price,
    required this.currency,
    required this.image,
    required this.reviewScore,
    required this.review,
    required this.address,
  });

  factory HotelModel.fromJson(Map<String, dynamic> json) => HotelModel(
        name: json["name"] ?? '',
        starts: json["starts"] ?? 0,
        price: json["price"] ?? 0.0,
        currency: json["currency"] ?? '',
        image: json["image"] ?? '',
        reviewScore: json["review_score"] ?? 0.0,
        review: json["review"] ?? '',
        address: json["address"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "starts": starts,
        "price": price,
        "currency": currency,
        "image": image,
        "review_score": reviewScore,
        "review": review,
        "address": address,
      };
}
