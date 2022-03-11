import 'package:get/get.dart';

import '../bindings/HomeBinding.dart';
import '../screens/HomeScreen.dart';
import 'ScreenRoutes.dart';

class Routes {
  static final routes = [
    GetPage(
      name: homeScreen,
      page: () => HomeScreen(),
      binding: HomeBinding(),
    ),
  ];
}
