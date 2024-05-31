import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:weather_app3/views/second_page.dart';
import 'package:weather_app3/models/weather.dart';
import 'package:weather_app3/controllers/weather_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  WeatherController controller = Get.put(WeatherController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      backgroundColor: const Color(0xffF1F0FA),
      appBar: AppBar(
        elevation: 0,
        toolbarOpacity: 0,
        toolbarHeight: 25,
        backgroundColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark),
      ),
      body: ListView(
        children: [
          Obx(() => textCard(30, '${controller.addres}', FontWeight.w800, 24)),
          textCard(
              16.37, DateFormat.jm().format(DateTime.now()), FontWeight.w600,
              12),
          const SizedBox(
            height: 20,
          ),
          ///buat no2
          SingleChildScrollView(
            controller: controller.scrollController,
            physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Obx(
                  () =>
                  Row(
                    children: [
                      for (WeatherObject weather in controller
                          .listweatherObject0)
                        cardWeather(context, weather),
                    ],
                  ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 110,
                width: 315,
                decoration: BoxDecoration(
                  color: const Color(0xffFFFFFF),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Obx(
                        () =>
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            for (WeatherDetail weatherdetails in (controller
                                .listweatherObject0
                                .firstOrNull
                                ?.weatherDetail ??
                                []))
                              cardWeather3(weatherdetails),
                          ],
                        ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 30),
          rowCard1(110, "Today", 95, "Next 7 Days"),
          const SizedBox(
            height: 30,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Obx(() =>
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (controller.listweatherObject0.isNotEmpty)
                      for (WeatherObject weather in controller
                          .listweatherObject0.last.weatherObject)
                        cardWeather2(weather),
                  ],
                ),
            ),
          )
        ],
      ),
    );
  }

  Row rowCard1(double width1, String text1, double width2, String text2) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(
          width: width1,
          child: Text(text1,
              style: GoogleFonts.nunitoSans(
                  fontSize: 16, fontWeight: FontWeight.w900)),
        ),
        Row(
          children: [
            SizedBox(
              width: width2,
              child: Text(text2,
                  style: GoogleFonts.nunitoSans(
                      fontSize: 16, fontWeight: FontWeight.w900)),
            ),
            Icon(Icons.arrow_forward_ios)
          ],
        ),
      ],
    );
  }

  SizedBox textCard(double height, String text, fontWeight, double font) {
    return SizedBox(
      height: height,
      child: Text(
        text,
        style: GoogleFonts.nunitoSans(
            fontWeight: fontWeight, color: Colors.black, fontSize: font),
        textAlign: TextAlign.center,
      ),
    );
  }

  Column cardWeather3(WeatherDetail weatherObject) {
    return Column(children: [
      Image.asset(
        weatherObject.image,
        width: 24,
        height: 24,
      ),
      Text(
        weatherObject.point.toString(),
        style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w900,
            color: Color(0xff333333),
            fontFamily: "Nunito Sans"),
      ),
      Text(
        weatherObject.description,
        style: TextStyle(
            fontSize: 9,
            fontWeight: FontWeight.w900,
            color: Color(0xffDBD9F2),
            fontFamily: "Nunito Sans"),
      ),
    ]);
  }

  ///ini buat no 4
  Padding cardWeather2(WeatherObject weather) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 132,
        width: 92,
        decoration: BoxDecoration(
          color: const Color(0xff4B3EAE),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Stack(children: [
          Positioned(
            top: 15,
            right: 20,
            child: Text(
              DateFormat.jm().format(DateTime.parse(weather.dtTxt)),
              style: TextStyle(
                  color: Color(0xffF5F5F5),
                  fontFamily: "Nunito Sans",
                  fontWeight: FontWeight.w600,
                  fontSize: 12),
            ),
          ),
          Positioned(
              top: 10,
              child: Image.asset(
                weather.weather.first.image,
                height: 90,
                width: 90,
              )),
          Positioned(
            top: 95,
            left: 25,
            child: Text(
              "${weather.main.temp}°C",
              style: TextStyle(
                  color: Color(0xffF5F5F5),
                  fontFamily: "Nunito Sans",
                  fontWeight: FontWeight.w900,
                  fontSize: 18),
            ),
          ),
        ]),
      ),
    );
  }

  /// ini buat no 2
  Padding cardWeather(BuildContext context, WeatherObject weather) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SizedBox(
        width: MediaQuery
            .of(context)
            .size
            .width / 2 + 24.5,
        child: InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const SecondPage();
            }));
          },
          child: Stack(children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Container(
                padding: const EdgeInsets.only(bottom: 15),
                height: 274.94,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xff4B3EAE),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Column(
                  children: [
                    Image.asset(
                      weather.weather.first.image,
                      width: 165,
                    ),
                    Expanded(
                      child: Text(
                        "${weather.main.temp}°C",
                        style: GoogleFonts.nunitoSans(
                            fontWeight: FontWeight.w600,
                            fontSize: 40,
                            color: Color(0xffF5F5F5)),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(
                        weather.weather.first.description,
                        style: GoogleFonts.nunitoSans(
                            fontWeight: FontWeight.w900,
                            fontSize: 12,
                            color: Color(0xffF5F5F5))
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  Container(
                    width: 140,
                    height: 34,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: const Color(0xffFFFFFF),
                        borderRadius: BorderRadius.circular(40)),
                    child: Text(DateFormat("yyyy-MM-dd HH:mm").format(
                        DateTime.parse(weather.dtTxt)),
                      style: GoogleFonts.nunitoSans(
                          color: Color(0xff333333),
                          fontSize: 11,
                          fontWeight: FontWeight.w700),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
