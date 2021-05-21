import 'package:flutter/material.dart';

class InfoScreen1 extends StatefulWidget {
  //const InfoScreen1({Key key}) : super(key: key);

  @override
  _InfoScreen1State createState() => _InfoScreen1State();
}

class _InfoScreen1State extends State<InfoScreen1> {
  List<String> code = ['IN','CN','RU','US','BR','ID','PK','AU','IR','MX','VN','CA'];
  List<String> country = ['India','China','Russia','United States','Brazil','Indonesia','Pakistan','Australia','Iran','Mexico','Vietnam','Canada'];

  Map data;
  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    var country = data['country'];
    var day = data['day'];
    var month = data['month'];
    var year = data['year'];
    var nameText = Colors.white;
    var name = Colors.white;
    var text = Colors.white;
    var startHour = data['startHour'];
    var startMinute = data['startMinute'];
    var endHour = data['endHour'];
    var endMinute = data['endMinute'];


    return SizedBox.expand(
      child: Container(

        child: Scaffold(

          body: SizedBox.expand(
            child: Container(
              /*decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/$bgImage'),
                      fit: BoxFit.cover,
                    )
                ),*/

              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),

                child:
                SingleChildScrollView(
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.edit_location,size: 30,color: nameText,),
                            SizedBox(width: 10,),
                            Text('$name', style: TextStyle(color: nameText,fontSize: 26,letterSpacing: 2),),
                          ],
                        ),
                        SizedBox(height: 20,),
                        Opacity(opacity:0.4,child: Text('$country',style: TextStyle(color: text,fontSize: 78,letterSpacing: 3),)),
                        SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            SizedBox(width: 20,),
                            Opacity(opacity:0.7,child: Text('$day - $month - $year',style: TextStyle(color: text,fontSize: 24,letterSpacing: 3),)),
                          ],
                        ),
                        SizedBox(height: 40,),

                        Opacity(
                          opacity: 0.7,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              SizedBox(width: 20,),
                              Column(
                                children: [
                                  Text('Start Time : $startHour:$startMinute',style: TextStyle(color: text,fontSize: 26),),
                                  SizedBox(height: 30,),
                                  Text('End Time: $endHour:$endMinute ',style: TextStyle(color: text,fontSize: 26),),

                                ],
                              )
                            ],
                          ),
                        ),

                        FlatButton.icon(onPressed: () => Navigator.pop(context), icon: Icon(Icons.arrow_back), label: Text(""),),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
