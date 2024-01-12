import 'package:bmi/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bmi/widgets/left_bar.dart' as myleftbar;
import 'package:bmi/widgets/right_bar.dart' as drightbar;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _heightController = TextEditingController();
  TextEditingController _weightController = TextEditingController();

  double _bmiResult = 0;
  String _textResult = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "BMI Calculator",
          style: GoogleFonts.lato(
            color: accentcolor,
            fontWeight: FontWeight.normal,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      backgroundColor: maincolor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 130,
                  child: TextField(
                    controller: _heightController,
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w300,
                      color: accentcolor,
                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Height",
                        hintStyle: GoogleFonts.lato(
                          fontSize: 40,
                          fontWeight: FontWeight.w300,
                          color: Colors.white.withOpacity(0.4),
                        )),
                  ),
                ), //height container

                Container(
                  width: 130,
                  child: TextField(
                    controller: _weightController,
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w300,
                      color: accentcolor,
                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Weight",
                        hintStyle: GoogleFonts.lato(
                          fontSize: 40,
                          fontWeight: FontWeight.w300,
                          color: Colors.white.withOpacity(0.4),
                        )),
                  ),
                ), //weight container
              ],
            ),
            SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                double _h = double.parse(_heightController.text);
                double _w = double.parse(_weightController.text);
                setState(() {
                  _bmiResult = _w / (_h * _h);
                  if (_bmiResult > 25) {
                    _textResult = "You\'re Overweight";
                  } else if (_bmiResult >= 18.5 && _bmiResult <= 25) {
                    _textResult = "You have normal weight";
                  } else {
                    _textResult = "You\'re Underweight";
                  }
                });
              },
              child: Container(
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: accentcolor,
                ),
                child: Text(
                  "Calculate",
                  style: GoogleFonts.lato(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              child: Text(
                _bmiResult.toStringAsFixed(2),
                style: GoogleFonts.lato(
                  fontSize: 90,
                  color: accentcolor,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Visibility(
              visible: _textResult.isNotEmpty,
              child: Container(
                child: Text(
                  _textResult,
                  style: GoogleFonts.lato(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: accentcolor,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            myleftbar.LeftBar(barWidth: 40),
            SizedBox(
              height: 20,
            ),
            myleftbar.LeftBar(barWidth: 70),
            SizedBox(
              height: 20,
            ),
            myleftbar.LeftBar(barWidth: 40),
            SizedBox(
              height: 20,
            ),
            drightbar.RightBar(
              barWidth: 70,
            ),
            SizedBox(
              height: 30,
            ),
            drightbar.RightBar(barWidth: 100),
            SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
