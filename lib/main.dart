import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tonal_metrics_widget/metricsForm.dart';
import 'package:tonal_metrics_widget/viewModel/form_view_model.dart';
import 'package:tonal_metrics_widget/widgets/MetricCard.dart';
import 'package:animate_do/animate_do.dart';

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
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ChangeNotifierProvider(
          create: (context) => FormViewModel(),
          child: MyHomePage(),
        ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin{

  var metricIndex = 0;

  var currentColor = Color.fromRGBO(1, 0, 1, 1.0);


  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<FormViewModel>(context);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 33.0, vertical: 40.0),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 0.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.account_circle,
                              size: 70.0,
                              color: Color.fromRGBO(138, 196, 188, 1.0),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0.0,10.0,0.0,12.0),
                        child: Text(
                          "Hello, Ryan.",
                          style: TextStyle(
                            fontSize: 30.0,
                            color: Colors.black,
                            fontFamily: "Helvetica",
                          ),
                        ),
                      ),
                      Text(
                        "You're almost at your daily goal.",
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: "sans-serif"
                        ),
                      ),
                      Text(
                        "Keep it up!",
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'sans-serif'
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Container(
                height: 300.0,
                alignment: FractionalOffset.center,
                child: Container(
                  child: MetricCard(vm: vm),
                ),
              ),

              SizedBox(height: 20,),

              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FadeInUp(
                    duration: Duration(milliseconds: 1000),
                    delay: Duration(milliseconds: 500),
                    child: Container(
                        padding: EdgeInsets.only(left: 30, top: 30, right: 1, bottom: 50),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(60),
                            topRight: Radius.circular(60),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromRGBO(61, 165, 148, 1.0).withOpacity(0.5),
                              offset: Offset(0, -5),
                              blurRadius: 5,
                            ),
                          ],
                        ),
                        child: MetricsForm(vm: vm),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
