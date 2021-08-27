// import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';
// import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'package:provider/provider.dart';
import 'package:water_level_app/provider/google_sign_in.dart';

class LoggedInWidget extends StatefulWidget {
  @override
  _LoggedInWidgetState createState() => _LoggedInWidgetState();
}

class _LoggedInWidgetState extends State<LoggedInWidget> {
  // bool _success;
  // List<double> traceData = List();
  // Timer _timer;
  // Map<String, double> dataMap = new Map();
  // List<Color> colorList = [Colors.red, Colors.green];
  // double globalCurrentSensorValue = 0;
  @override

  // void initState(){
  //   super.initState();
  //   _success = false;
  //   _timer =  Timer(Duration(milliseconds: 5000), _generateTrace)
  //   periodic(Duration(milliseconds:5000), _generateTrace);
  //   dataMap.putIfAbsent("Out of Range",()=> 100);
  //   dataMap.putIfAbsent("Below Range",()=> 0);

  // }

  // _generateTrace(Timer t){
  //   setState(()
  //   {
  //     traceData.add(globalCurrentSensorValue);
  //     });
  //   }

  //   Widget buildStreamBuilder(){
  //     return Container(
  //       child: !_success
  //       ? Center(
  //          child: CircularProgressIndicator(
  //           valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
  //          ),
  // )
  // :StreamBuilder(
  //   stream: Firestore.instance.collection('distance').snapshots(),
  //   builder: (context, snapshot) {
  //     if (!snapshot.hasData) {
  //           return Center(
  //             child: CircularProgressIndicator(
  //               valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
  //             ),
  //           );
  //         } else {
  //           snapshot.data.documents.forEach((f) {
  //             if (f.documentID == '4gLK62OhntvuprRtq3Lh') {
  //               print('current value = ${f['distance']}');
  //               globalCurrentSensorValue = f['distance'].toDouble();
  //               var tempDistanceValue = globalCurrentSensorValue;

  //               dataMap["distance"] = tempDistanceValue;
  //             }
  //           });
  //           return Center(
  //             child: Container(
  //               child: SfCartesianChart(
  //               title: ChartTitle(text: 'Flutter Chart'),
  //               legend: Legend(isVisible: true),
  //               series: getDefaultData(),
  //               tooltipBehavior: TooltipBehavior(enable: true),
  //               primaryXAxis: CategoryAxis(),
  //               series: <LineSeries<SalesData, String>>[
  //                 LineSeries<SalesData, String>(

  //             Column(
  //               mainAxisAlignment: MainAxisAlignment.center,
  //               children: <Widget>[

  //                 child: SfCartesianChart,
  //                 ),

  //                           )
  //                     ],
  //                   ),
  //                 )
  //               ],
  //             ),
  //           );
  //         }
  //         //       },
  //             ));
  // }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return Container(
      alignment: Alignment.center,
      color: Colors.white,
      // color: Colors.blueGrey.shade900,
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Logged In',
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(height: 8),
          CircleAvatar(
            maxRadius: 25,
            backgroundImage: NetworkImage(user.photoURL),
          ),
          SizedBox(height: 8),
          Text(
            'Name: ' + user.displayName,
            style: TextStyle(color: Colors.black),
          ),
          SizedBox(height: 8),
          Text(
            'Email: ' + user.email,
            style: TextStyle(color: Colors.black),
          ),
          SizedBox(height: 8),
          ElevatedButton(
            onPressed: () {
              final provider =
                  Provider.of<GoogleSignInProvider>(context, listen: false);
              provider.logout();
            },
            child: Text('Logout'),
          )
        ],
        //child: SfCartesianChart()
      ),
    );
  }
}
