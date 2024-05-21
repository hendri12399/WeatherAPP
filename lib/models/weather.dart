import 'package:weather_app3/models/image.dart';

// class Sys {
//   String country;
//
//   Sys(this.country);
//
//   factory Sys.fromJson(Map<String, dynamic> json) {
//     return Sys(json["country"]);
//   }
// }
// class WeatherObject1 {
//   int dt;
//   List<Weather> weather;
//   Main main;
//
//   WeatherObject1({required this.dt, required this.weather, required this.main});
//
//   factory WeatherObject1.fromJson(Map<String, dynamic> json) {
//     return WeatherObject1(
//         dt: json["dt"] is int ? (json['dt'] as int).toString() : json['dt'],
//         weather: (json["weather"] as List)
//             .map((element) => Weather.fromJson(element))
//             .toList(),
//         main: Main.fromJson(json["main"]),
//      );
//   }
// }
//
// class WindObject {
//   List<Weather> weather;
//   Wind wind;
//   Deskripsi deskripsi;
//
//   WindObject({required this.wind, required this.weather, required this.deskripsi});
//
//   factory WindObject.fromJson(Map<String, dynamic> json) {
//     return WindObject(
//       weather: (json["weather"] as List)
//           .map((element) => Weather.fromJson(element))
//           .toList(),
//     wind: Wind.fromJson(json["speed"]),
//     deskripsi : Deskripsi.fromJson(json ["description"]),
//     );
//   }
// }

class WeatherObject {
  int dt;
  String dtTxt;
  List<Weather> weather;
  List<WeatherObject> weatherObject;
  Main main;
  Wind wind;
  int visibility;
  List<WeatherDetail> weatherDetail;

  WeatherObject(
      {required this.dtTxt,
      required this.dt,
      required this.weather,
      this.weatherObject = const [],
      required this.main,
      required this.wind,
      required this.visibility,
      required this.weatherDetail});

  factory WeatherObject.fromJson(Map<String, dynamic> json) {
    return WeatherObject(
        dtTxt: json["dt_txt"],
        dt: json["dt"],
        weather: (json["weather"] as List)
            .map((element) => Weather.fromJson(element))
            .toList(),
        main: Main.fromJson(json["main"]),
        wind: Wind.fromJson(json["wind"]),
        visibility: json["visibility"],
        weatherDetail: List.generate(WeatherNameDetails.values.length, (index) {
          WeatherNameDetails weatherNameDetails =
              WeatherNameDetails.values[index];
          return WeatherDetail(weatherNameDetails.getImage,
              weatherNameDetails.getPoint(json), weatherNameDetails.name);
        }));
  }
}

enum WeatherNameDetails {
  wind,
  humidity,
  visibility,
}

/// menambahkan fungsi di suatu object
extension HelperWeatherNameDetails on WeatherNameDetails {
  String get getImage {
    switch (this) {
      case WeatherNameDetails.wind:
        return wind;
      case WeatherNameDetails.visibility:
        return visibilty;
      case WeatherNameDetails.humidity:
        return humidity;
    }
  }

  dynamic getPoint(Map<String, dynamic> json) {
    switch (this) {
      case WeatherNameDetails.wind:
        return json["wind"]["speed"];
      case WeatherNameDetails.visibility:
        return json["visibility"];
      case WeatherNameDetails.humidity:
        return json["main"]["humidity"];
    }
  }
}

class WeatherDetail {
  String image;
  dynamic point;
  String description;

  WeatherDetail(this.image, this.point, this.description);
}

class Weather {
  String main;
  String description;
  String image;

  Weather(this.main, this.description, {required this.image});

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(json["main"], json["description"],
        image: getImageFromJsonData("main"));
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
  dynamic speed;

  Wind(this.speed);

  factory Wind.fromJson(Map<String, dynamic> json) {
    return Wind(json["speed"]);
  }
}

class Deskripsi {
  String description;

  Deskripsi({required this.description});

  factory Deskripsi.fromJson(Map<String, dynamic> json) {
    return Deskripsi(description: json["description"]);
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
