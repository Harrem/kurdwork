import 'package:flutter/material.dart';
import 'package:kurdwork/routes/home.dart';
import 'package:kurdwork/routes/jobPostScreen.dart';
import 'package:kurdwork/routes/settings.dart';

class RouteGenerator {
  static const String homePage = "./routes/home.dart";
  static const String settingsPage = "./routes/settings.dart";
  static const String postPage = "./routes/jobPostScreen.dart";

  RouteGenerator._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homePage:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case settingsPage:
        return MaterialPageRoute(builder: (_) => const Settings());
      case postPage:
        return MaterialPageRoute(builder: (_) => const JobPost());
      default:
        throw const FormatException("Route not found");
    }
  }
}
