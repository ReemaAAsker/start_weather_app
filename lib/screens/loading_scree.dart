import 'package:flutter/material.dart';
import 'package:starter_temp_weather_app/models/user_Location.dart';
import 'package:starter_temp_weather_app/screens/location_screen.dart';
import 'package:starter_temp_weather_app/utils/constants.dart';
import 'package:starter_temp_weather_app/utils/networking.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  getLocation() async {
    UserLocation userLocation = UserLocation();
    await userLocation.getLocation(context);
    print('${userLocation.latitude}, ${userLocation.longitude}');
    Map<String, dynamic> weather_info = await NetworkHelper(
      "https://api.openweathermap.org/data/2.5/weather?lat=${userLocation.latitude}&lon=${userLocation.longitude}&appid=$API_KEY&units=metric",
    ).getData();
    print(weather_info);
    if (mounted) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LocationScreen(weather_data: weather_info),
        ),
      );
    }
  }

  // Future<void> getData(double lat, double lon) async {
  //   String url =
  //       "https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$API_KEY&units=metric";

  //   // Uri.parse(url);

  //   // http.get(Uri.parse(url));
  //   http.Response response = await http.get(Uri.parse(url));
  //   // Response always have body and statusCode
  //   // print(response.statusCode);
  //   // print(response.body);

  //   // print(response.body['main']['temp']);
  //   if (response.statusCode == 200) {
  //     Map<String, dynamic> data = jsonDecode(response.body);
  //     print(data['temp']);
  //   }
  // }

  @override
  void initState() {
    super.initState();

    getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}
