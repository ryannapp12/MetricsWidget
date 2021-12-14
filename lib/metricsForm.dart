import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tonal_metrics_widget/widgets/MetricCard.dart';
import 'package:tonal_metrics_widget/widgets/MetricsWidget.dart';
import 'package:tonal_metrics_widget/widgets/showSnackBar.dart';

class MetricsForm extends StatefulWidget {
  final MetricsModel metricsModel;
  const MetricsForm({Key? key, required this.metricsModel}) : super(key: key);

  @override
  _MetricsFormState createState() => _MetricsFormState();
}

class _MetricsFormState extends State<MetricsForm> {


  TextEditingController labelInput = TextEditingController();
  TextEditingController weightInput = TextEditingController();
  TextEditingController unitInput = TextEditingController();

  bool editFlag = false;
  bool loadingFlag = false;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    setState(() {
      loadingFlag = true;
      editFlag = false;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(labelInput.text + " Metrics",
                style: TextStyle(
                  fontSize: 22,
                  // decoration: TextDecoration.underline,
                  fontFamily: "Helvetica",
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(61, 165, 148, 1.0),
                ),),
              GestureDetector(
                onTap: () async {
                  if ((labelInput.text.isEmpty ||
                      weightInput.text.isEmpty) &&
                      editFlag) {
                    showSnackBar(
                        "Please input a label name and weight", context
                    );
                  }
                  int x;
                  int y;
                  try {
                    x = int.parse(weightInput.text);
                    y = int.parse(weightInput.text);
                  } catch (error) {
                    x = 0;
                    y = 350;
                  }
                  if((x <= 0 || y > 350) && editFlag) {
                    showSnackBar("Please input a weight between 1 and 350", context);
                  }
                  // Map<String, Object> temp = new Map();
                  // print("object");
                  if (editFlag) {
                    //TODO: Add update to 'units' if needed
                    widget.metricsModel.updateWidget(labelInput.text, weightInput.text);
                    showSnackBar("Successfully updated!", context);
                  }
                  setState(() {
                    editFlag = !editFlag;
                  });
                },
                child: Container(
                  color: Colors.transparent,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          editFlag ? Icons.save : Icons.edit,
                          color: Colors.black,
                        ),
                        SizedBox(width: 5,),
                        Text(
                          editFlag ? "Save" : "Edit",
                          style: TextStyle(
                            fontSize: 18,
                            color: Color.fromRGBO(61, 165, 148, 1.0),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 20,),

          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: TextFormField(
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                  controller: labelInput,
                  enabled: editFlag,
                  decoration: InputDecoration(
                    border: new OutlineInputBorder(
                      borderRadius: const BorderRadius.all(const Radius.circular(10.0)),
                        borderSide: new BorderSide(color: Color.fromRGBO(61, 165, 148, 1.0))),
                    prefixIcon: const Icon(
                      Icons.edit,
                      color: Color.fromRGBO(61, 165, 148, 1.0),
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    labelText: "Label Name",
                    // hintText: "ex. 'Upper Body'",
                    contentPadding: EdgeInsets.only(left: 2, right: 2),
                    labelStyle:
                    TextStyle(color: Colors.black, fontSize: 20),
                    alignLabelWithHint: true,
                    focusedBorder: UnderlineInputBorder(
                      borderSide: const BorderSide(
                          color: Colors.grey, width: 1.0),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: const BorderSide(
                          color: Colors.grey, width: 1.0),
                    ),
                  ),
                  textInputAction: TextInputAction.done,
                ),
              ),


              SizedBox(height: 30,),


              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: TextFormField(
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                  controller: weightInput,
                  enabled: editFlag,
                  decoration: InputDecoration(
                    border: new OutlineInputBorder(
                        borderRadius: const BorderRadius.all(const Radius.circular(10.0)),
                        borderSide: new BorderSide(color: Color.fromRGBO(61, 165, 148, 1.0))),
                    prefixIcon: const Icon(
                      Icons.add_chart,
                      color: Color.fromRGBO(61, 165, 148, 1.0),
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    labelText: "Weight",
                    // hintText: "ex. 'Upper Body'",
                    contentPadding: EdgeInsets.only(left: 2, right: 2),
                    labelStyle:
                    TextStyle(color: Colors.black, fontSize: 20),
                    alignLabelWithHint: true,
                    focusedBorder: UnderlineInputBorder(
                      borderSide: const BorderSide(
                          color: Colors.grey, width: 1.0),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: const BorderSide(
                          color: Colors.grey, width: 1.0),
                    ),
                  ),
                  textInputAction: TextInputAction.done,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

