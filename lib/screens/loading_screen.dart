import 'package:climaweatherapp/screens/location_screen.dart';
import 'package:climaweatherapp/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:climaweatherapp/services/location.dart';
import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';


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
    NetworkHelper networkHelper=NetworkHelper('https://api.openweathermap.org/data/2.5/onecall?lat=${location.latitude}&lon=${location.longitude}&exclude=minutely,hourly,daily,alert&appid=3d94cda811980c81b4e170fff8e3396b&units=metric');

    var weatherData=await networkHelper.getData();

    Navigator.push(context, MaterialPageRoute(builder: (context){
      return LocationScreen(weatherData: weatherData,);
    }));

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body:Center(
        child: SpinKitWave(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}
