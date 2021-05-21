import 'package:emission_2_app/LoadingScreen1.dart';
import 'package:emission_2_app/LoadingScreen2.dart';
import 'package:flutter/material.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Emissions Page'),
            centerTitle: true,
            bottom: TabBar(
              tabs: [
                Tab(text: "Methane"),
                Tab(text: "CO")
              ],
            ),
          ),
          body: TabBarView(
            children: [
              LoadingScreen1(),
              LoadingScreen2(),
            ],
          ),
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
  //bool get wantKeepAlive => throw UnimplementedError();

}
