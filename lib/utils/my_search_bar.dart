import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'theme.dart';

class MySearchBar extends StatelessWidget {
  final void Function(String)? onChanged;
  const MySearchBar({Key? key, this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height / 25,
      width: size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(myRadius(context)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            spreadRadius: -5,
            blurRadius: 10,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: TextFormField(
          onChanged: onChanged,
          cursorColor: Colors.grey,
          decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(size.width / 30),
                  borderSide: BorderSide.none),
              hintText: 'search'.tr,
              hintStyle: GoogleFonts.poppins(
                  color: Colors.black87,
                  fontSize: size.width / 55,
                  fontWeight: FontWeight.normal),
              suffixIcon: const Icon(Icons.search),
              suffixIconColor: Colors.black54)),
    );
  }
}
