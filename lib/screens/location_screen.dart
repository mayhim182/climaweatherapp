
import 'package:climaweatherapp/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:climaweatherapp/services/weather.dart';


class LocationScreen extends StatefulWidget {
  // const LocationScreen({Key? key}) : super(key: key);

  LocationScreen({this.weatherData}){}

  final weatherData;

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weatherModel=new WeatherModel();
  var temperature;
  var condition;
  var cityName;
  String weatherIcon='';
  String weatherMessage='';

  @override
  void initState() {
    super.initState();
    updateUI();
  }

  void updateUI(){
    setState(() {
      var weatherDesc=widget.weatherData['current']['weather'][0]['description'];
      temperature=widget.weatherData['current']['temp'];
      condition=widget.weatherData['current']['weather'][0]['id'];
      cityName=widget.weatherData['timezone'];
      weatherIcon=weatherModel.getWeatherIcon(condition);
      weatherMessage=weatherModel.getMessage(temperature);
    });
    print(temperature);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image:DecorationImage(
              image: AssetImage('images/location_background.jpg'),
              fit:BoxFit.cover,
              colorFilter:ColorFilter.mode(
                  Colors.white.withOpacity(0.8),
                  BlendMode.dstATop
              ),
          )
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                    Row(
                      children: [
                        TextButton(
                            onPressed: (){},
                            child: Icon(
                              Icons.near_me,
                              size: 50.0,
                            ),
                        ),
                        TextButton(
                            onPressed: (){},
                            child:Icon(
                              Icons.location_city,
                              size: 50.0,
                            )
                        ),
                      ],
                    ),
                  Padding(
                      padding:EdgeInsets.only(left: 15.0),
                      child: Row(
                        children: <Widget>[
                            Text(
                              '$temperature°C',
                              style: kTempTextStyle,
                            ),
                          Text(
                            weatherIcon,
                            style: kConditionTextStyle,
                          ),
                        ],
                      ),
                  ),
                  Padding(
                      padding:EdgeInsets.only(right: 15.0),
                    child: Text(
                      "$weatherMessage in $cityName",
                      textAlign: TextAlign.right,
                      style: kMessageTextStyle,
                    ),
                  )
                ],
            )),
      ),
    );
  }
}


//
// var weatherDesc=weatherData['current']['weather'][0]['description'];
// var temperature=weatherData['current']['temp'];
// var weatherId=weatherData['current']['weather'][0]['id'];
// var timeZone=weatherData['timezone'];
