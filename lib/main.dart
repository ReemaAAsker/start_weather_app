import 'package:flutter/material.dart';
import 'package:starter_temp_weather_app/screens/loading_scree.dart';

void main(List<String> args) {
  runApp(MaterialApp(home: LoadingScreen()));
}

/*

Future >> data , error  >> Future.value   , Future.value



1. Loading screen that load the position of the user by GEOLOCATOR 
2. then Navigate to the location screen with the user Position 
3. print inside the location screen the passing Position by widget keyword


for seperated logic and arrgment can be :

2. Location = Position = lat ,long  , getLocATION .. >> Model
3. create UserLocation Model 
4. put the getLocation method in it and handle errors by print or snakbar






*/
