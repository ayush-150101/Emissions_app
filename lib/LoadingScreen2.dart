import 'dart:convert';

import 'package:emission_2_app/EmissionsRepo1.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'EmissionsRepo2.dart';

class LoadingScreen2 extends StatefulWidget {
  @override
  _LoadingScreen2State createState() => _LoadingScreen2State();
}

class _LoadingScreen2State extends State<LoadingScreen2> with AutomaticKeepAliveClientMixin<LoadingScreen2> {

  List<dynamic> ranking = [];
  List<dynamic> result = [];
  List<int> strength = [900,800,700,600,500,400,300,200,100,50,0];
  List<String> code = ['IN','CN','RU','US','BR','ID','PK','AU','IR','MX','VN','CA'];

  void printDateTime(int index) async{
    var cd = code[index];
    Response response = await get(
        "https://api.v2.emissions-api.org/api/v2/carbonmonoxide/average.json?country=$cd&limit=1");
    var data = jsonDecode(response.body);
    var startDateTime = DateTime.parse(data[0]["start"]);
    var endDateTime = DateTime.parse(data[0]["end"]);
    var startTime = startDateTime.hour + startDateTime.minute;
    var endTime = endDateTime.hour + endDateTime.minute;
    var date = startDateTime.day + startDateTime.month + startDateTime.year;
    var emission = data[0]["average"].toString();

    print("Emission: $emission  start:${startDateTime.hour}:${startDateTime.minute}   end: ${endDateTime.hour}:${endDateTime.minute}    data: ${startDateTime.day}-${startDateTime.month}-${startDateTime.year}");
  }

  void getCurrentEmissions() async{

    EmissionsRepo2 er = EmissionsRepo2();
    List data = await er.emissions();
    setState(() {
      result = er.SortList();
    });

    for(int i = 0;i<result.length;i++)
      ranking.add(result[i]);

    /*var avg = data[0]['average'];
    avg = avg.round();
    print(data);
    print(avg);*/
  }

  void initState() {
    // TODO: implement initState
    super.initState();

    getCurrentEmissions();
  }

  @override
  Widget build(BuildContext context) {
    int itemCount = ranking.length;
    return Scaffold(

      body:itemCount > 0
          ? ListView.builder(
        /*separatorBuilder: (context, index) => Divider(
          color: Colors.white,
        ),*/
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: itemCount,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(

            title: Text(ranking[index].toString(),style: TextStyle(fontSize: 18,letterSpacing:3,color: Colors.white),),
            //tileColor: Colors.red[strength[index]],
            onTap: (){
              printDateTime(index-1);
            },


          );
        },
      )
          : Center(child: const Text('Loading Items....')),

    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
  //bool get wantKeepAlive => throw UnimplementedError();
}
