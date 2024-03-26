import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff4B3EAE),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.light),
        elevation: 0,
        centerTitle: true,
        title: Column(
          children: [
            textCard("Today's Weather", Color(0xffF5F5F5), 24, FontWeight.w800),
            SizedBox(
              height: 3,
            ),
            textCard(
                "Sunday, 8 March 2021", Color(0xffF5F5F5), 11, FontWeight.w700),
          ],
        ),
      ),
      body: ListView(children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(
              height: 50,
            ),
            Container(
              width: 315,
              height: 165,
              decoration: BoxDecoration(
                color: Colors.white30,
                borderRadius: BorderRadius.circular(40),
                border: Border.all(width: 2, color: Color(0xffFFFFFF)),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  bottom: 20,
                  left: 20,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      "img/Moon cloud fast wind.png",
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        textCard("23º", Color(0xffF5F5F5), 70, FontWeight.w700),
                        textCard("Moon Cloud Fast Wind", Color(0xffF5F5F5), 11,
                            FontWeight.w900),
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Stack(children: [
              Center(
                child: Container(
                  width: 289,
                  height: 407,
                  decoration: BoxDecoration(
                      color: Colors.white30,
                      borderRadius: BorderRadius.circular(40)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Center(
                  child: Container(
                    width: 315,
                    height: 459,
                    decoration: BoxDecoration(
                        color: Color(0xffFFFFFF),
                        borderRadius: BorderRadius.circular(40)),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 25, top: 25, right: 25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                              width: 138,
                              height: 25,
                              child: textCard("Future Weather",
                                  Color(0xff333333), 18, FontWeight.w900)),
                          rowCard(
                              "img/Sun cloud angled rain.png",
                              "29º",
                              "Monday",
                              "9 March 2021",
                              36,
                              FontWeight.w900,
                              Color(0xffDDDBF3)),
                          paddingCard(1.0),
                          rowCard(
                              "img/Sun cloud little rain.png",
                              "22º",
                              "Tuesday",
                              "10 March 2021",
                              36,
                              FontWeight.w900,
                              Color(0xffDDDBF3)),
                          paddingCard(1.0),
                          rowCard(
                              "img/Big rain drops.png",
                              "19º",
                              "Wednesday",
                              "11 March 2021",
                              36,
                              FontWeight.w900,
                              Color(0xffDDDBF3)),
                          paddingCard(0.0),
                          rowCard(
                              "img/Sun cloud mid rain.png",
                              "28º",
                              "Thursday",
                              "12 March 2021",
                              36,
                              FontWeight.w900,
                              Color(0xffDDDBF3)),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ])
          ],
        ),
      ]),
    );
  }

  Padding paddingCard(double size) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: size),
      child: Divider(
        color: Color(0xffE0E0E0),
      ),
    );
  }

  Row rowCard(String image, String text1, String text2, String text3,
      double font, fontWeight, color) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      children: [
        Image.asset(image),
        Text(text1,
            style: GoogleFonts.nunitoSans(
                fontWeight: fontWeight,
                fontSize: font,
                color: Color(0xff333333))),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(text2,
                style: GoogleFonts.nunitoSans(
                    fontSize: 13,
                    fontWeight: FontWeight.w800,
                    color: Color(0xff333333))),
            Text(text3,
                style: GoogleFonts.nunitoSans(
                    fontSize: 13, fontWeight: FontWeight.w800, color: color)),
          ],
        ),
      ],
    );
  }

  Text textCard(String text, color, double fontsize, fontWeight) {
    return Text(
      text,
      style: GoogleFonts.nunitoSans(
          color: color, fontSize: fontsize, fontWeight: fontWeight),
    );
  }
}
