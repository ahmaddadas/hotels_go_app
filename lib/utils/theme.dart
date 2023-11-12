import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;

Color myMainColor = const Color(0xff0973bb);
Color mySecondColor = const Color(0xffec8a23);
Color myBlackColor = Colors.black87;
double myRadius(BuildContext context) {
  Size size = MediaQuery.sizeOf(context);
  return size.width / 30;
}
