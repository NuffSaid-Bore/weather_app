
import 'package:flutter/material.dart';
import '../views/main_page.dart';


class RouteManager {
  static const String mainPage = '/';
  static const String weatherPage = '/weatherPage';
  static const String detailsPage = '/deatailsPage';

  static Route<dynamic> routes(RouteSettings settings) 
  {
    switch (settings.name) 
    {
      case mainPage:
        return MaterialPageRoute(
          builder: (context) => const MainPage(),
        );

      // case weatherPage:
      //   return MaterialPageRoute(
      //     builder: (context) => const MainPage(),
      //   );

      // case detailsPage:
      //   return MaterialPageRoute(
      //     builder: (context) =>  WeatherDetails(),
      //   );

      default:
        throw const FormatException('Route not found! Please check  and make sure route exists');
    }
  }
}
