import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

void main(List<String> args) {
  runApp(MaterialApp(home: LoadingScreen()));
}

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void getLocation() {
    // try {
    //   Position p = await Geolocator.getCurrentPosition();
    //   print(p);
    // } catch (e) {
    //   print(e);
    // }

    Geolocator.getCurrentPosition()
        .then((position) {
          print(position);
        })
        .catchError((e) {
          print(e);
        });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            getLocation();
          },
          child: const Text("Get Location"),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
          ),
        ),
      ),
    );
  }
}
/*

Future >> data , error




*/