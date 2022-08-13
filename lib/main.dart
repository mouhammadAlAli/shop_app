import 'package:flutter/material.dart';
import 'package:shop_app_course/modules/login/login_screen.dart';
import 'package:shop_app_course/shared/network/local/cache_helper.dart';
import 'package:shop_app_course/shared/network/remote/dio_helper.dart';
import 'styles/themes.dart';

import 'modules/on_boarding/on_boarding_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();
  bool onBoarding = CacheHelper.getData(key: "onBoarding");
  runApp(MyApp(onBoarding: onBoarding));
}

class MyApp extends StatelessWidget {
  bool onBoarding;

  MyApp({Key? key, required this.onBoarding}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,
      darkTheme: darkTheme,
      home: onBoarding ? const LoginScreen() : OnBoardingScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
