// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../utils/theme.dart';

class SearchRow extends StatelessWidget {
  final VoidCallback onTapFilters;
  final TextEditingController searchController;
  final void Function(String) onChanged;
  const SearchRow(
      {super.key,
      required this.onTapFilters,
      required this.searchController,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            height: size.height / 20,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(myRadius(context)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: size.width / 30,
                  offset: const Offset(15, 5),
                ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.all(size.width / 80),
              child: TextField(
                onChanged: onChanged,
                controller: searchController,
                cursorColor: myBlackColor,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  hintText: 'Search for hotels',
                  prefixIcon: Icon(
                    Icons.search,
                    color: myMainColor,
                  ),
                  border: InputBorder.none,
                  errorBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  focusedErrorBorder: InputBorder.none,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          width: size.width / 40,
        ),
        InkWell(
          onTap: onTapFilters,
          child: Container(
            height: size.height / 20,
            width: size.width / 8,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(myRadius(context)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: size.width / 30,
                  offset: const Offset(15, 5),
                ),
              ],
            ),
            child: Center(
                child: SvgPicture.asset(
              'assets/icons/sliders.svg',
              color: myMainColor,
            )),
          ),
        )
      ],
    );
  }
}
