import 'package:flutter/material.dart';
import 'my_text.dart';
import 'theme.dart';

class MyButton extends StatelessWidget {
  final double height, width;
  final String text;
  final bool isWithIcon;
  final IconData? icon;
  final VoidCallback onTap;
  const MyButton(
      {super.key,
      required this.height,
      required this.width,
      required this.text,
      required this.onTap,
      required this.isWithIcon,
      this.icon});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            color: myMainColor,
            borderRadius: BorderRadius.circular(myRadius(context))),
        child: isWithIcon
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MyText(
                      color: Colors.white,
                      text: text,
                      fontSize: size.width / 20,
                      fontWeight: FontWeight.normal),
                  SizedBox(
                    width: size.width / 40,
                  ),
                  Icon(
                    icon,
                    color: Colors.white,
                    size: size.width / 20,
                  )
                ],
              )
            : Center(
                child: MyText(
                    color: Colors.white,
                    text: text,
                    fontSize: size.width / 20,
                    fontWeight: FontWeight.normal),
              ),
      ),
    );
  }
}
