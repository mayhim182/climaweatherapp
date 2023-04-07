import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:climaweatherapp/services/location.dart';

class LoadingScreen extends StatefulWidget {
  // const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {


  void initState(){
    super.initState();
    getLocation();
  }

  void getLocation() async{
    Location location=Location();
    await location.getCurrentLocation();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
    );
  }
}
