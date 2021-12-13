import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tonal_metrics_widget/metricsForm.dart';
import 'package:tonal_metrics_widget/styles.dart';

class MetricsWidget extends StatefulWidget {
  const MetricsWidget({Key? key}) : super(key: key);

  @override
  _MetricsWidgetState createState() => _MetricsWidgetState();
}

class _MetricsWidgetState extends State<MetricsWidget> {

  String widgetTitle = '';
  int weight = 0;
  String unit = 'lbs';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircleAvatar(
        backgroundColor: Color.fromRGBO(61, 165, 148, 1.0),
        child: Stack(
          children: [
            SvgPicture.asset(
              'images/graph.svg',
              alignment: Alignment.bottomCenter,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
            Positioned(
                top: 40,
                left: 83,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(widgetTitle, style: labelTextStyle,),
                  ],
                )
            ),

            Positioned(
                top: 50,
                left: 90,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      weight.toString(),
                      style: weightTextStyle,
                    ),
                  ],
                )
            ),

            Positioned(
                top: 180,
                left: 120,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(unit,
                      style: unitTextStyle,
                    ),
                  ],
                )
            ),

          ],
        ),
        radius: 200,
      ),
    );
  }

  void onMetricWidgetChange(MetricsForm metricsForm) {
    setState(() {
      
    });
  }
}

// void onMetricWidgetChange
//
//
// class MetricsModel {
//
//   MetricsModel(this.widgetTitle, this.weight, this.unit);
//
//   String widgetTitle = '';
//   int weight = 0;
//   String unit = 'lbs';
//
// }
