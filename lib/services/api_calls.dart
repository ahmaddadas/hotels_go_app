// ignore_for_file: avoid_print
import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class ApiCalls {
  // Get Hotels
  static Future<List<dynamic>> getHotels() async {
    final headers = {
      'Content-Type': 'application/json',
    };
    final response = await http.get(
      Uri.parse(
        'https://www.hotelsgo.co/test/hotels',
      ),
      headers: headers,
    );
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final List<dynamic> itemList = jsonData;
      return itemList;
    } else {
      Fluttertoast.showToast(msg: 'Something went wrong');
      throw Exception('Failed to load hotels');
    }
  }
}
