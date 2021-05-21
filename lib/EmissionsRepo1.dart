import 'dart:convert';

import 'package:http/http.dart';

class EmissionsRepo1{

  List<String> code = ['IN','CN','RU','US','BR','ID','PK','AU','IR','MX','VN','CA'];
  List<String> country = ['India','China','Russia','United States','Brazil','Indonesia','Pakistan','Australia','Iran','Mexico','Vietnam','Canada'];
  List<dynamic> average = [];
  List<dynamic> avg = [];
  List<String> result = [];

  Future<List> emissions() async{
    try{
      var data;
      for(int i = 0;i<code.length;i++){
        var cd = code[i];
        print('Getting emissions for $cd');
      Response response = await get(
          "https://api.v2.emissions-api.org/api/v2/methane/average.json?country=$cd&limit=1");
      data = jsonDecode(response.body);
      var d = data[0]['average'];
      average.add(d.round());
      avg.add(d.round());
      }
      print(average);
      return data;
    }catch(e){
      print(e);
      return null;
    }
  }

  List<dynamic> SortList(){
    average.sort();
    List<dynamic> reversedList = [];
    for(int i = average.length - 1;i>=0;i--)
      reversedList.add(average[i]);

    print(reversedList);
    int rank = 1;
    for(int i = 0;i<10;i++){
      for(int j = 0;j<avg.length;j++){
        if(reversedList[i] == avg[j]){
          var cntry = country[j];
          var emission = avg[j];
          String s = "";
          int space = 20-cntry.length;
          s+="$rank";
          s+="       ";
          s+=cntry;
          for(int i = 0;i<space;i++)
            s+=" ";
          s+="   ";

          s+="$emission";

          result.add(s);
          print("$rank  $cntry $emission");
          rank++;
        }
      }
    }
    print(result);
    return result;

  }



}