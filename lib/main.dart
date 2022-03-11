import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'constants/Routes.dart';
import 'constants/ScreenRoutes.dart';
import 'styles/ThemeStyle.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: homeScreen,
      theme: themeData(false, context),
      debugShowCheckedModeBanner: false,
      getPages: Routes.routes,
    );
  }
}
