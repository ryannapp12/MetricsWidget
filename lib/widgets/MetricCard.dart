import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tonal_metrics_widget/styles.dart';
import 'package:tonal_metrics_widget/widgets/MetricsWidget.dart';

class MetricCard extends StatefulWidget {
  const MetricCard({Key? key}) : super(key: key);

  @override
  _MetricCardState createState() => _MetricCardState();
}

class _MetricCardState extends State<MetricCard> {
  int _current = 0;
  dynamic _selectedIndex = {};

  CarouselController _carouselController = new CarouselController();

  List<dynamic> _metricswidget = [
    {
      'title': 'Upper Body',
      'image': MetricsWidget(),
    },
    {
      'title': 'Core',
      'image': MetricsWidget(),
    },
    {
      'title': 'Lower Body',
      'image': MetricsWidget(),
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.white,
          child: CarouselSlider(
              carouselController: _carouselController,
              options: CarouselOptions(
                  height: 400.0,
                  aspectRatio: 20/9,
                  viewportFraction: 0.75,
                  enlargeCenterPage: true,
                  enableInfiniteScroll: false,
                  pageSnapping: true,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  }
              ),
              items: _metricswidget.map((widgetCard) {
                return Builder(
                  builder: (BuildContext context) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          if (_selectedIndex == widgetCard) {
                            _selectedIndex = {};
                          } else {
                            _selectedIndex = widgetCard;
                          }
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          width: 300,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(150),
                              border: _selectedIndex == widgetCard ? Border.all(color: Color.fromRGBO(61, 165, 148, 1.0).withOpacity(0.5), width: 3) : null,
                          ),

                          // I added this extra scrollable area so that more information could be inserted and displayed underneath the MetricsWidget().
                          // When the card is clicked, the user can scroll vertically withing the card
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 245,
                                  margin: EdgeInsets.only(top: 10),
                                  clipBehavior: Clip.hardEdge,
                                  decoration: bubbleBoxDecoration,
                                  child: MetricsWidget(),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              }).toList()
          ),
        ),
      ),
    );
  }
}
