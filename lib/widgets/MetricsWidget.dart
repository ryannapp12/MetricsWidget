import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:tonal_metrics_widget/styles.dart';

class MetricsWidget extends StatefulWidget {
  final MetricsModel metricsModel;
  const MetricsWidget({Key? key, required this.metricsModel}) : super(key: key);

  @override
  _MetricsWidgetState createState() => _MetricsWidgetState();
}

class _MetricsWidgetState extends State<MetricsWidget> {

  String unit = 'lbs';

  @override
  Widget build(BuildContext context) {
    final metricsWidget = Provider.of<MetricsModel>(context);
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 16,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(metricsWidget.labelName, style: labelTextStyle,),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      metricsWidget.weight.toString(),
                      style: weightTextStyle,
                    ),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(unit,
                      style: unitTextStyle,
                    ),
                  ],
                ),
              ],
            ),

          ],
        ),
        radius: 200,
      ),
    );
  }
}

class MetricsModel extends ChangeNotifier {

  String labelName = "";
  int weight = 0;

  //TODO: Add units if needed
  // String units = "lbs";

  updateWidget(String labelValue, String weightValue) {
    labelName = labelValue;
    weight = int.parse(weightValue);
    notifyListeners();

    //TODO: Add units if needed
    // units = unitsValue;
  }
}