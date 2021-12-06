import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tonal_metrics_widget/widgets/MetricsWidget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin{

  var appColors = [
    Color.fromRGBO(61, 165, 148, 1.0),
    Color.fromRGBO(242, 243, 235, 1.0),
    Color.fromRGBO(168, 210, 202, 1.0),
    Color.fromRGBO(138, 196, 188, 1.0),
    Color.fromRGBO(196, 228, 212, 1.0),
    Color.fromRGBO(1, 0, 1, 1.0),
    Color.fromRGBO(255, 254, 254, 1.0),
  ];

  var metricIndex = 0;
  //TODO: might need to take out 'late' modifier
  late ScrollController scrollController;
  var currentColor = Color.fromRGBO(1, 0, 1, 1.0);

  var metricList = [MetricsModel("Upper Body", 45, "lbs",), MetricsModel("Core", 123, "lbs",), MetricsModel("Lower Body", 315, "lbs",),];

  //TODO: might need to take out 'late' modifier
  late AnimationController animationController;
  late ColorTween colorTween;
  late CurvedAnimation curvedAnimation;

  @override
  void initState(){
    super.initState();
    scrollController = new ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: currentColor,
      appBar: new AppBar(
        title: Padding(
          padding: const EdgeInsets.only(bottom: 24),
          child: new Text(
            "METRICS",
            style: TextStyle(
              fontFamily: "Helvetica",
              fontWeight: FontWeight.bold,
              fontSize: 33.0,
              color: Color.fromRGBO(168, 210, 202, 1.0),
            ),
          ),
        ),
        backgroundColor: currentColor,
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0, top: 5),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextButton.icon(
                    icon: Icon(Icons.edit, color: Colors.white, size: 20,),
                    label: Text("EDIT", style: TextStyle(fontFamily: "Helvetica", fontSize: 15, color: Colors.white,),),
                    onPressed: (){

                    },
                  ),
                ],
              ),
            ),
          ),
        ],
        elevation: 0.0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 32.0),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Icon(Icons.account_circle, size: 70.0, color: appColors.first,),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0.0,16.0,0.0,12.0),
                      child: Text("Hello, Ryan.", style: TextStyle(fontSize: 30.0, color: Color.fromRGBO(242, 243, 235, 1.0), fontFamily: "Helvetica",),),
                    ),
                    Text("You're almost at your daily goal.", style: TextStyle(color: Color.fromRGBO(242, 243, 235, 1.0)),),
                    Text("Keep it up!", style: TextStyle(color: Color.fromRGBO(242, 243, 235, 1.0),),),
                  ],
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 64.0, vertical: 16.0),
                  child: Text("TODAY : SEP 21, 2022", style: TextStyle(color: Color.fromRGBO(242, 243, 235, 1.0), fontFamily: "Helvetica"),),
                ),
                Container(
                  height: 350.0,
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                      itemCount: 3,
                      controller: scrollController,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, position) {
                      return GestureDetector(
                       child: Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: Card(
                           child: Container(
                             width: 250.0,
                             child: Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               children: [
                                 Padding(
                                   padding: const EdgeInsets.all(8.0),
                                   child: Row(
                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                     children: [
                                       MetricsWidget(),
                                     ],
                                   ),
                                 ),
                               ],
                             ),
                           ),
                         ),
                       ), 
                      );
                      }
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
