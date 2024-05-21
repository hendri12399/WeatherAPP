import 'package:get/get.dart';
import 'package:intl/date_time_patterns.dart';
import 'package:weather_app3/services/service_weather.dart';
import '../models/weather.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class WeatherController extends GetxController {
  var apiServices = ApiServices();
  Rxn<Coordinate> coordinate = Rxn<Coordinate>();

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }


  /// untuk memasukan data dari model dan memanggilnya dalam bentuk list, pake syntax ini
  var listweatherObject0 = <WeatherObject>[].obs;

  /// variabel address untuk menampung nilai dari placemarks dan obs (harus di ikuti dengan .value saat mengisi nilainya. dibawah)
  var addres = "".obs;

  //= List<WeatherObject0> listweatherObject1 = List.generate(4,
  //     (index) => WeatherObject1(dt: 0, weather: [], main: Main(0.0, 0, 0)));


  // Future getWeather(double latitude, double longitude) async {
  //   var data = await _determinePosition();
  //   var response = await apiServices.getWeather(data.latitude.toString(), data.longitude.toString());
  //   listweatherObject0.add(WeatherObject.fromJson(response));
  //
  // }

  Future getWeather2(double latitude, double longitude) async {
    var data = await _determinePosition();
    var response = await apiServices.getWeather2(
        data.latitude.toString(), data.longitude.toString());
    for (var item in response["list"]) {
      /// variabel object isinya WeatherObject json
      var object = WeatherObject.fromJson(item);
      /// dibuat variable untuk menampung hasil nya
      object.weatherObject = [];
      /// variable tanggal diabuat yang isinya merupakan dt text yang sebelumnya telah di parse (sttring)
      var date = DateTime.parse(object.dtTxt);

      /// kemudian dibuat logica nya.
      /// is empty = tidak ada. nah kalo ga ada, listweatherobject akan mennambahkan sesuatu dalam hal ini object diatas
      //
      if (listweatherObject0.isEmpty) {
        listweatherObject0.add(object);
        /// continue digunakan untuk menskipp
        continue;
      }

      /// index where untuk mencari nilai dari index. tapi nyari index dulu
      var index = listweatherObject0.indexWhere((element) {
        var dateList = DateTime.parse(element.dtTxt);
        if (dateList.year == date.year && dateList.month == date.month && dateList.day == date.day) return true;
        return false;
      } );
      /// variable index sebelumnya dipanggil, jika hasilnya lebih dari 0, maka logic yang dijalankan yaitu menambahkan nilai dari index
      if (index >=0){
        listweatherObject0[index].weatherObject.add(object);
      }
      /// jika tidak hanya mengeksekusi penambahan object saja
      else {
        listweatherObject0.add(object);
      }
    }
  }

  @override
  // onInit = void main, kalo onInit cuma untuk di controller

  void onInit() async {
    var data = await _determinePosition();
    getWeather2(data.latitude, data.longitude);
    List<Placemark> placemarks = await placemarkFromCoordinates(
        data.latitude, data.longitude);

    /// addres.value karena variabel addres diatas menggunakan .obs
    addres.value = placemarks.reversed.last.administrativeArea.toString();
    print(data);
  }
}
