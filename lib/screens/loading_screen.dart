import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:climaweatherapp/services/location.dart';
import 'package:http/http.dart';

class LoadingScreen extends StatefulWidget {
  // const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  var url=Uri.parse('https://api.openweathermap.org/data/2.5/onecall?lat=33.44&lon=-94.04&exclude=minutely,hourly,daily,alert&appid=3d94cda811980c81b4e170fff8e3396b');

  void initState(){
    super.initState();
    getLocation();
  }

  void getLocation() async{
    Location location=Location();
    await location.getCurrentLocation();
  }

  void getData() async{
    Response response = await get(url);
    if(response.statusCode==200){
      print(response.body);
    }
    else{
      print(response.statusCode);
    }
  }



  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold(
    );
  }
}
