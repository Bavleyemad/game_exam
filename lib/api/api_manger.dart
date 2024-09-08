import 'dart:convert';
import 'dart:io';
import 'package:game_exam/api/agent_model.dart';
import 'package:game_exam/api/maps_model.dart';
import 'package:game_exam/api/weapon_model.dart';
import 'package:http/http.dart' as http;
 class EndPoints{
   static const String SOURCES_agents="v1/agents";
   static const String SOURCES_maps="v1/maps";
   static const String SOURCES_weapons="v1/weapons";
 }
class ApiManger{
  static const String Base_URL="valorant-api.com";
static Future<AgentsApi?> getSourcesResponce()async{
var url_agents=Uri.https(Base_URL,EndPoints.SOURCES_agents);
try{
  var response= await http.get(url_agents);

  var data = jsonDecode(response.body);
  var sourse_respone=AgentsApi.fromJson(data);
  return sourse_respone;
}on SocketException{

}on HttpException{

}on FormatException{

}
  return null;
}
  static Future<MapsApi?> getSourcesResponceMaps()async{
    var url_maps=Uri.https(Base_URL,EndPoints.SOURCES_maps);

    try{
      var response= await http.get(url_maps);
      var data_map = jsonDecode(response.body);
      var map_respone=MapsApi.fromJson(data_map);
      return map_respone;
    }on SocketException{

    }on HttpException{

    }on FormatException{

    }
    return null;
  }
  static Future<WeaponsApi?> getSourcesResponceWeapons()async{
    var url_weapons=Uri.https(Base_URL,EndPoints.SOURCES_weapons);

    try{
      var response= await http.get(url_weapons);
      var data_weapon = jsonDecode(response.body);
      var weapon_respone=WeaponsApi.fromJson(data_weapon);
      return weapon_respone;
    }on SocketException{

    }on HttpException{

    }on FormatException{

    }
    return null;
  }

}