import 'package:flutter/material.dart';
import 'package:kurdwork/routes/home.dart';
import 'package:kurdwork/routes/settings.dart';

class RouteGenerator {
  static const String homePage = "./screens/home.dart";
  static const String settingsPage = "./screens/settings.dart";

  RouteGenerator._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homePage:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case settingsPage:
        return MaterialPageRoute(builder: (_) => const Settings());
      default:
        throw const FormatException("Route not found");
    }
  }
}
