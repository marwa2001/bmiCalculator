import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pretty_gauge/pretty_gauge.dart';
import 'package:share_plus/share_plus.dart';

class BMIResultScreen extends StatefulWidget {
  late int result;
  bool isMale;
  int age;
  String? bmiStatus;
  String? bmiInterpretation;
  Color? bmiStatusColor;

  // AssetLottie? lttie;

  BMIResultScreen({
    required this.result,
    required this.isMale,
    required this.age,
  });

  @override
  State<BMIResultScreen> createState() => _BMIResultScreenState();
}

class _BMIResultScreenState extends State<BMIResultScreen> {
  String? bmiStatus;

  String? bmiInterpretation;

  Color? bmiStatusColor;
  dynamic lttie;


  @override
  Widget build(BuildContext context) {
    setBmiInterPretation();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI Result',
          style: TextStyle(
              fontSize: 20, color: Colors.blue, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Your HEALTH ',
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                color: Colors.blue[800],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            PrettyGauge(
              gaugeSize: 200,
              minValue: 0,
              maxValue: 40,
              segments: [
                GaugeSegment('Under weight', 18.5, Colors.red),
                GaugeSegment('Normal', 6.4, Colors.green),
                GaugeSegment('Over Weight', 5, Colors.orange),
                GaugeSegment('Obese', 10.1, Colors.pink),
              ],
              valueWidget: Text(
                widget.result.toStringAsFixed(1),
                style: const TextStyle(fontSize: 40),
              ),
              currentValue: widget.result.toDouble(),
              needleColor: Colors.blue,
            ),
          if (widget.result >= 30)
            Container(
              width: 100,
              height: 100,
              child: Lottie.asset(
                'lottie/${'obse.json'}',
              ),
            ),
            if (widget.result >= 25 && widget.result < 30)
            Container(
              width: 100,
              height: 100,
              child: Lottie.asset(
                'lottie/${'over.json'}',
              ),
            ),
            if (widget.result  >= 18.5 && widget.result < 25)
            Container(
              width: 100,
              height: 100,
              child: Lottie.asset(
                'lottie/${'overwight.json'}',
              ),
            ),if (widget.result  < 18.5 )
            Container(
              width: 100,
              height: 100,
              child: Lottie.asset(
                'lottie/${'underweight (1).json'}',
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              bmiStatus!,
              style: TextStyle(
                  fontSize: 30,
                  color: bmiStatusColor!,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              bmiInterpretation!,
              style: TextStyle(
                  fontSize: 15,
                  color: bmiStatusColor!,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('RE Calculate')),
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: ElevatedButton(
                      onPressed: () {
                        Share.share('my BMI is ${widget.result} ${bmiStatus}');
                      },
                      child: Text('Share')),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void setBmiInterPretation() {
    if (widget.result > 30) {
      bmiStatus = "obsese";
      bmiInterpretation = "Please work to reduce obesity";
      bmiStatusColor = Colors.pink;

    } else if (widget.result >= 25) {
      bmiStatus = "OverWieght";
      bmiInterpretation = "Do regular exersice & reduce the wieght ";
      bmiStatusColor = Colors.orange;


    } else if (widget.result >= 18.5) {
      bmiStatus = "Normal";
      bmiInterpretation = "Enjoy you are fit";
      bmiStatusColor = Colors.green;

    } else if (widget.result < 18.5) {
      bmiStatus = "Under weight";
      bmiInterpretation = "Try to increase the weight";
      bmiStatusColor = Colors.red;

    }
  }

}
