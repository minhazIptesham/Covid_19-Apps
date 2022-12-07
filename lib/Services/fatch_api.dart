import 'dart:convert';
import 'package:covid_19_with_api/Models/World_Model.dart';
import 'package:covid_19_with_api/Services/api_url.dart';
import 'package:http/http.dart' as http;

class Stateservices {
  Future<WorldModel> fatchworldstateRecord()async{
    final response = await http.get(Uri.parse(ApiUrl.worldUrl));
    if(response.statusCode==200){
      var data = jsonDecode(response.body);
      return WorldModel.fromJson(data);
    }else{
      throw Exception(Error);
    }

  }

  Future<List<dynamic>> fatchcountriesRecord()async{
    var data;
    final response = await http.get(Uri.parse(ApiUrl.countriesUrl));
    if(response.statusCode==200){
      data = jsonDecode(response.body);
      return data;
    }else{
      throw Exception(Error);
    }
  }
}