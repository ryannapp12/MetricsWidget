import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MetricsWidget extends StatefulWidget {
  const MetricsWidget({Key? key}) : super(key: key);

  @override
  _MetricsWidgetState createState() => _MetricsWidgetState();
}

class _MetricsWidgetState extends State<MetricsWidget> {
  
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Color.fromRGBO(61, 165, 148, 1.0),
      child: SvgPicture.asset("images/graph.svg", matchTextDirection: false,),
    );
  }
}


class MetricsModel {
  
  String widgetTitle;
  int weight;
  String unit;

  
  MetricsModel(this.widgetTitle, this.weight, this.unit,);
}

// const List<String> metricsIcon = <String>[
//   'images/graph.svg',
// ];
