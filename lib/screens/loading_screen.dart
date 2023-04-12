import 'package:climaweatherapp/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:climaweatherapp/services/location.dart';
import 'dart:convert';


class LoadingScreen extends StatefulWidget {
  // const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  double latitude=0.0;
  double longitude=0.0;



  void initState(){
    super.initState();
    getLocationData();
  }

  void getLocationData() async{
    Location location=Location();
    await location.getCurrentLocation();
    this.latitude=location.latitude;
    this.longitude=location.longitude;

    // getData();



    NetworkHelper networkHelper=NetworkHelper('https://api.openweathermap.org/data/2.5/onecall?lat=$latitude&lon=$longitude&exclude=minutely,hourly,daily,alert&appid=3d94cda811980c81b4e170fff8e3396b');

    var weatherData=await networkHelper.getData();

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

    );
  }
}
