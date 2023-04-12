import 'package:http/http.dart';
import 'dart:convert';


class NetworkHelper{
  NetworkHelper(this.url){}

  final String url;

  Future getData() async{

    var url1=Uri.parse(url);
    Response response = await get(url1);
    if(response.statusCode==200){
      String data =response.body;
      var longi=jsonDecode(data)['lat'];
      var latit=jsonDecode(data)['lon'];

      var decodedData=jsonDecode(data);
      print(response.body);
      return decodedData;
    }
    else{
      print(response.statusCode);
    }

  }
}
