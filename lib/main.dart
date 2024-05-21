import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app3/views/home_page.dart';


void main() {
  runApp(const WeatherApp3());
}

class WeatherApp3 extends StatefulWidget {
  const WeatherApp3({super.key});

  @override
  State<WeatherApp3> createState() => _WeatherApp3State();
}

class _WeatherApp3State extends State<WeatherApp3> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage()
    );
  }
}
