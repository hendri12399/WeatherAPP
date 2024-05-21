import "package:dio/dio.dart";

class ApiServices {
  final dio = Dio();

  Future<Map<String,dynamic>> getWeather(String latitude, String longitude) async {
    final response = await dio.get(
        'https://api.openweathermap.org/data/2.5/weather',
        queryParameters: {
          "lat":latitude,
          "lon":longitude,
          "appid":"838f1bd1ec438cb3f686f31141a2299f",
          "units":"metric"
        });
    return response.data;
  }

  Future<Map<String,dynamic>> getWeather2(String latitude, String longitude) async {
    final response = await dio.get(
        'https://api.openweathermap.org/data/2.5/forecast',
        queryParameters: {
          "lat":latitude,
          "lon":longitude,
          "appid":"838f1bd1ec438cb3f686f31141a2299f",
          "units":"metric"
        });
    return response.data;
  }

//   Future<Map<String,dynamic>> getWeather2()async {
//     final response = await dio.get('https://pro.openweathermap.org/data/2.5/forecast/hourly',
//         queryParameters: {
//           "lat": "37.4219983",
//           "lon": "-122.084",
//           "appid": "838f1bd1ec438cb3f686f31141a2299f"
//         });
//     print(response.data);
//     print(response.statusMessage);
//     print(response.statusCode);
//     return response.data ;
//   }
}