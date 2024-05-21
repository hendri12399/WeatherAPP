import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app3/models/image.dart';


class WeatherObject {
  String name;
  Coordinate coordinate;
  int dt;
  List<Weather> weather;
  Main main;
  Wind wind;
  int visibility;

  WeatherObject(this.name, this.coordinate, this.dt, this.weather,this.main, this.wind,this.visibility);

  factory WeatherObject.fromJson(Map<String, dynamic> json) {
    return WeatherObject(
        json["name"],
        Coordinate.fromJson(json ["coord"]),
        json["dt"],
        (json["weather"] as List)
            .map((element) => Weather.fromJson(element))
            .toList(),
        Main.fromJson(json["main"]),
        Wind.fromJson(json["wind"]),
        json ["visibility"]
    );
  }
}

class Weather {
  String main;
  String description;
  String image;

  Weather(this.main, this.description, {required this.image});

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
        json["main"], json["description"], image: getImageFromJsonData("main"));
  }
}

class Coordinate {
  double lon;
  double lat;

  Coordinate(this.lon, this.lat);

  factory Coordinate.fromJson(Map<String, dynamic> json) {
    return Coordinate(json["lon"], json["lat"]);
  }
}

class Main {
  double temp;
  int pressure;
  int humidity;

  Main(this.temp, this.pressure, this.humidity);

  factory Main.fromJson(Map<String, dynamic> json) {
    return Main(json["temp"], json["pressure"], json["humidity"]);
  }
}

class Wind {
  double speed;

  Wind(this.speed);

  factory Wind.fromJson(Map<String, dynamic> json) {
    return Wind(json["speed"]);
  }
}


String getImageFromJsonData(String data) {
  switch (data) {
    case "Big Rain Drops":
      return bigRainDrops;
    case "Thunder":
      return thunderZap;
    case "Moon Cloud":
      return moonCloud;
    case "Cloud Angled Rain":
      return cloudAngledRain;
    case "Cloud Little Rain":
      return cloudLittleRain;
    case "Cloud Mid Rain":
      return cloudMidRain;
    default:
      return moonCloud;
  }
}


// {
// "coord": {
// "lon": 10.99,
// "lat": 44.34
// },
// "weather": [
// {
// "id": 501,
// "main": "Rain",
// "description": "moderate rain",
// "icon": "10d"
// }
// ],
// "base": "stations",
// "main": {
// "temp": 298.48,
// "feels_like": 298.74,
// "temp_min": 297.56,
// "temp_max": 300.05,
// "pressure": 1015,
// "humidity": 64,
// "sea_level": 1015,
// "grnd_level": 933
// },
// "visibility": 10000,
// "wind": {
// "speed": 0.62,
// "deg": 349,
// "gust": 1.18
// },
// "rain": {
// "1h": 3.16
// },
// "clouds": {
// "all": 100
// },
// "dt": 1661870592,
// "sys": {
// "type": 2,
// "id": 2075663,
// "country": "IT",
// "sunrise": 1661834187,
// "sunset": 1661882248
// },
// "timezone": 7200,
// "id": 3163858,
// "name": "Zocca",
// "cod": 200
// }

// class Weather2 {
//   String dttext;
//   String image;
//   int temp;
//
//   Weather2(this.dttext, this.image, this.temp);
//
//   factory Weather2.fromJson(Map<String, dynamic> json) {
//     return Weather2(
//         json["dttext"], getImageFromJsonData(json["image"]), json["temp"]);
//   }
// }

// class Weather3 {
//   String image;
//   int visibility;
//
//   Weather3(this.image, this.visibility);
//
//   factory Weather3.fromJson(Map<String, dynamic> json) {
//     return Weather3(getImageFromJsonData(json["image"]), json["visibilty"]);
//   }
// }


void main() {
  test("hi",()async{
    // var apiServices = ApiServices();
    // var response = await apiServices.getWeather();
    // // var response2 = await apiServices.getWeather2();
    // // var sys = Sys.fromJson(response);
    // WeatherObject weather = WeatherObject.fromJson(response);
    // var weather2 = Weather2.fromJson(response2);
    // var weather3 = Weather3.fromJson(response);
    // print(sys.country);
    // print(weather.name);
    // print(weather.coordinate.lat);
    // print(weather.coordinate.lon);
    // print(weather.dt);
    // for (var data in weather.weather) {
    //   print(data.main);
    //   print(data.description);
    //   print(data.image);
    // }
    // print(weather.main.temp);
    // print(weather.main.pressure);
    // print(weather.main.humidity);
    // print(weather.wind.speed);
    // print(weather.visibility);

    // print(weather2.dttext);
    // print(weather2.image);
    // print(weather3.image);
    // print(weather3.visibility);
  });
}