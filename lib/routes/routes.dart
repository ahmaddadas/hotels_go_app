import 'package:get/get.dart';
import '../view/screens/home_screen.dart';

class AppRoutes {
  static const firstScreen = Routes.homeScreen;

  static final routes = [
    GetPage(name: Routes.homeScreen, page: () => HomeScreen()),
  ];
}

class Routes {
  static const homeScreen = '/homeScreen';
}
