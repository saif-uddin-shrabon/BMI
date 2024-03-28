import 'dart:ui';

import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }



}




class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();
  var age = TextEditingController();
  var heightInCm = TextEditingController();
  var stController = TextEditingController();
  var lbController = TextEditingController();

  bool isMaleSelected = false;
  bool isFemaleSelected = false;
  var result = '';
  final _listItem = ["ft","cm"];
  String? _slectedVal = "ft";
  final _listOfWItem = ["kg","lb","st"];
  String? _selectedWval= "kg";
  // state changeble string
  String weightRange = "---";
  String title = "Normal";
  String titleValue = "Normal";
  bool isGone = true;
  var totalHighetInMeeter = 0.0;

  var feetInmeeter = 0.0;
  var inchesInmeeter = 0.0;


  Color backgroundColor = Colors.black;

  Color VSUColor = Colors.black;
  Color SUColor = Colors.black;
  Color UColor = Colors.black;
  Color NColor = Colors.black;
  Color OWColor = Colors.black;
  Color OIColor = Colors.black;
  Color OIICOLOR = Colors.black;
  Color OIIIColor = Colors.black;
  Color weightRangeColor = Colors.black;


  // Define variables to store user input and BMI result
  String gender = 'Male';
  double ageValue = 0.0;
  double weightValue = 0.0;
  double heightFtValue = 0.0;
  double heightInValue = 0.0;
  double bmi = 0.0;
  double rangeValue = 0.0;
  double heightInCmValue = 0.0;
  double st = 0.0;
  double lb = 0.0;
  double heightInInches = 0.0;

  @override
  Widget build(BuildContext context) {

    return Scaffold(

   backgroundColor: Color(0xFFFBFDF8),
      appBar: AppBar(


        backgroundColor: Color(0xFFF0F5EF),

        title: Text('BMI Calculator'),
      ),
      body: SingleChildScrollView(

        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: Column(


            mainAxisAlignment: MainAxisAlignment.start,

           children: [


             Listener(
               child: Column(
                 children: [
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     children: [

                       Container(
                         width: 50,
                         height: 60,

                         child:   Column(


                           children: [

                             TextField(
                               controller: age,
                               decoration: const InputDecoration(
                                 labelText: "Age",
                                 contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                               ),
                               keyboardType: TextInputType.number,
                               // call checkFiled method when text field is changed
                                onChanged: (value) {
                                  checkFiled();
                                },
                             ),

                           ],
                         ),
                       ),




                       // Feet container

                       Container(
                         width: 50,
                         height: 40,
                         child: Column(

                           children: [
                             Container(
                               height: 14.0,
                               alignment: Alignment.centerRight,
                               child: Text(
                                 "'",
                                 style: TextStyle(fontSize: 24.0),
                               ),
                             ),
                             Expanded(
                               child: TextField(
                                 controller: ftController,
                                 keyboardType: TextInputType.number,
                                 onChanged: (value) {
                                   checkFiled();
                                 },
                               ),
                             ),
                           ],
                         ),
                       ),

                       // incich container
                       Container(
                         width: 50,
                         height: 40,

                         child:   Column(

                           children: [

                             Container(
                               height: 14.0,
                               alignment: Alignment.centerRight,
                               child: Text(
                                 "''",
                                 style: TextStyle(fontSize: 24.0),
                               ),
                             ),



                             Expanded(
                               child: TextField(
                                 controller: inController,


                                 keyboardType: TextInputType.number,
                                 onChanged: (value) {
                                   checkFiled();
                                 },
                               ),
                             ),

                           ],
                         ),
                       ),






                       /*
                       _slectedVal == "ft" ?
                       Row(
                         children: [
                           
                           // incich container
                           Container(
                             width: 50,
                             height: 40,
                             // margin: EdgeInsets.only(left: 10.0),
                             margin: EdgeInsets.only(left: 16.0),
                                child:   Column(

                               children: [

                                 Container(
                                   height: 14.0,
                                   alignment: Alignment.centerRight,
                                   child: Text(
                                     "''",
                                     style: TextStyle(fontSize: 24.0),
                                   ),
                                 ),



                                 Expanded(
                                   child: TextField(
                                     controller: inController,


                                     keyboardType: TextInputType.number,
                                     onChanged: (value) {
                                       
                                       checkFiled();
                                     },
                                   ),
                                 ),

                               ],
                             ),
                           ),


                         ],
                       ) :
                       Container(
                         width: 70,
                         height: 60,

                         child:   Column(


                           children: [

                             TextField(
                               controller: heightInCm,

                               decoration: const InputDecoration(
                                 labelText: "Height",
                                 labelStyle: TextStyle(
                                   fontSize: 12,

                                 ) ,
                                 contentPadding: EdgeInsets.symmetric(horizontal: 12.0),
                               ),
                               keyboardType: TextInputType.number,
                               onChanged: (value) {
                                 checkFiled();
                               },
                             ),

                           ],
                         ),
                       ) ,
                       */


                       // select ft or cm
                       Container(
                         width: 50,
                         height: 60,
                         child: DropdownButtonFormField(
                           value: _slectedVal,
                           items: _listItem.map(
                                 (e) => DropdownMenuItem(child: Text(e), value: e),
                           ).toList(),
                           onChanged: (val) {
                             setState(() {
                               _slectedVal = val as String;
                               // if(_slectedVal == "ft"){
                               //   heightInCm.clear();
                               //
                               //  }else{
                               //   ftController.clear();
                               //   inController.clear();
                               // }
                             });
                           },
                         ),
                       ),



                     ],
                   ),





                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceAround,
                     children: [
                       Container(
                         width: 60,
                         height: 40,
                         child: Row(
                           children: [
                             GestureDetector(
                               onTap: selectMale,
                               child: Icon(
                                 Icons.man,
                                 size: 20,
                                 color: isMaleSelected ? Colors.blue : Colors.grey,
                               ),
                             ),
                             VerticalDivider(
                               thickness: 1.0,
                               color: Colors.grey,
                             ),
                             GestureDetector(
                               onTap: selectFemale,
                               child: Icon(
                                 Icons.woman,
                                 size: 20,
                                 color: isFemaleSelected ? Colors.pink : Colors.grey,
                               ),
                             ),
                           ],
                         ),
                       ),
                       Container(
                         width: 70,
                         height: 60,
                         child: Column(
                           children: [
                             TextField(
                               controller: wtController,
                               decoration: const InputDecoration(
                                 labelText: "Weight",
                                 labelStyle: TextStyle(
                                   fontSize: 12,
                                 ),
                                 contentPadding: EdgeInsets.symmetric(horizontal: 12.0),
                               ),
                               keyboardType: TextInputType.number,
                               onChanged: (value) {
                                 checkFiled();
                               },
                             ),
                           ],
                         ),
                       ),


                       // // Conditionally render based on _selectedWval value
                       // if (_selectedWval == "kg")
                       //   Container(
                       //     width: 70,
                       //     height: 60,
                       //     child: Column(
                       //       children: [
                       //         TextField(
                       //           controller: wtController,
                       //           decoration: const InputDecoration(
                       //             labelText: "Weight",
                       //             labelStyle: TextStyle(
                       //               fontSize: 12,
                       //             ),
                       //             contentPadding: EdgeInsets.symmetric(horizontal: 12.0),
                       //           ),
                       //           keyboardType: TextInputType.number,
                       //           onChanged: (value) {
                       //             checkFiled();
                       //           },
                       //         ),
                       //       ],
                       //     ),
                       //   )
                       // else if (_selectedWval == "lb")
                       //   Container(
                       //     width: 70,
                       //     height: 60,
                       //     child: Column(
                       //       children: [
                       //         TextField(
                       //           controller: wtController,
                       //           decoration: const InputDecoration(
                       //             labelText: "Weight",
                       //             labelStyle: TextStyle(
                       //               fontSize: 12,
                       //             ),
                       //             contentPadding: EdgeInsets.symmetric(horizontal: 12.0),
                       //           ),
                       //           keyboardType: TextInputType.number,
                       //           onChanged: (value) {
                       //             checkFiled();
                       //           },
                       //         ),
                       //       ],
                       //     ),
                       //   )
                       // else if (_selectedWval == "st")
                       //     Row(
                       //       children: [
                       //         Container(
                       //           width: 50,
                       //           height: 60,
                       //
                       //           child:   Column(
                       //
                       //
                       //             children: [
                       //
                       //               TextField(
                       //                 controller: stController,
                       //                 decoration: const InputDecoration(
                       //                   labelText: "st",
                       //                   contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                       //                 ),
                       //                 keyboardType: TextInputType.number,
                       //                 // call checkFiled method when text field is changed
                       //                 onChanged: (value) {
                       //                   checkFiled();
                       //                 },
                       //               ),
                       //
                       //             ],
                       //           ),
                       //         ),
                       //
                       //
                       //         Container(
                       //           width: 50,
                       //           height: 60,
                       //           margin: EdgeInsets.only(left: 15.0),
                       //
                       //           child:   Column(
                       //
                       //
                       //             children: [
                       //
                       //               TextField(
                       //                 controller: lbController,
                       //                 decoration: const InputDecoration(
                       //                   labelText: "lb",
                       //                   contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                       //                 ),
                       //                 keyboardType: TextInputType.number,
                       //                 // call checkFiled method when text field is changed
                       //                 onChanged: (value) {
                       //                   checkFiled();
                       //                 },
                       //               ),
                       //
                       //             ],
                       //           ),
                       //         ),
                       //
                       //
                       //
                       //       ],
                       //     ) ,

                       Container(
                         width: 50,
                         height: 60,
                         child: DropdownButtonFormField(
                           value: _selectedWval,
                           items: _listOfWItem.map(
                                 (e) => DropdownMenuItem(child: Text(e), value: e),
                           ).toList(),
                           onChanged: (val) {
                             setState(() {
                               _selectedWval = val as String;

                                if(_selectedWval == "kg"){
                                  stController.clear();
                                  lbController.clear();
                                }else if(_selectedWval == "lb"){
                                  stController.clear();
                                  lbController.clear();
                                }else{
                                  wtController.clear();

                                }
                             });
                           },
                         ),
                       ),
                     ],
                   ),

                 ],
               ),
             ),



             SfRadialGauge(

               enableLoadingAnimation: true,
               animationDuration: 4500,
               axes: <RadialAxis>[
                 RadialAxis(
                   showLabels: false,
                   showAxisLine: false,
                   showTicks: false,
                   minimum: 0,
                   maximum: 99,
                   startAngle: 150,
                   endAngle: 35,
                   ranges: <GaugeRange>[
                     GaugeRange(
                       startValue: 12,
                       endValue: 35,
                       color: Color(0xFF21A6F3),
                       label: 'Underweight',
                       sizeUnit: GaugeSizeUnit.factor,
                       labelStyle: const GaugeTextStyle(
                         fontFamily: 'Times',
                         fontSize: 15,
                         color: Colors.white,
                       ),
                       startWidth: 0.4,
                       endWidth: 0.4,
                     ),
                     GaugeRange(
                       startValue: 35,
                       endValue: 60,
                       color: Color(0xFF40BC64),
                       label: 'Normal',
                       labelStyle: const GaugeTextStyle(
                         fontFamily: 'Times',
                         fontSize: 15,
                         color: Colors.white,
                       ),
                       startWidth: 0.4,
                       endWidth: 0.4,
                       sizeUnit: GaugeSizeUnit.factor,
                     ),
                     GaugeRange(
                       startValue: 60,
                       endValue: 85,
                       color: Color(0xFFFC5449),
                       label: 'Overweight',
                       labelStyle: const GaugeTextStyle(
                         fontFamily: 'Times',
                         fontSize: 15,
                         color: Colors.white,
                       ),
                       sizeUnit: GaugeSizeUnit.factor,
                       startWidth: 0.4,
                       endWidth: 0.4,
                     ),
                   ],
                   pointers:  <GaugePointer>[
                     MarkerPointer(
                       color: Colors.white,
                       // add result + 30 to show the pointer on the gauge or null
                       // value:  double.parse(result) + 30 ?? 0,
                       value: rangeValue,


                       markerHeight: 15,
                       markerWidth: 18,
                       markerType: MarkerType.triangle,
                       enableAnimation: true,
                       animationDuration: 4500,
                       markerOffset: 58,
                     )
                   ],
                   annotations: <GaugeAnnotation>[
                     GaugeAnnotation(
                       axisValue: 50,
                       positionFactor: 0.1,
                       widget: Text(
                       result,
                         style: TextStyle(
                           fontWeight: FontWeight.bold,
                           fontSize: 20,
                         ),
                       ),
                     ),
                   ],
                 ),
               ],
             ),


             Container(



               child:  Column(
                 children: [
                   Container(
                     color: Colors.white,
                     child:  Padding(
                       padding: EdgeInsets.symmetric(horizontal: 20.0),
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           Text(
                               title,
                                style: TextStyle(
                                  color: weightRangeColor,

                                )
                           ),

                           title == 'Normal'
                               ? Icon(Icons.done_outline_rounded, color: Colors.green)
                               : Text(
                               titleValue ?? "---",
                                   style: TextStyle(
                                     color: weightRangeColor,
                                   )
                           ),

                         ],
                       ),
                     ),
                   ),
                 ],
               ),

             ),
             Divider(
               color: Colors.black,
               thickness: 1.0,
             ),


             Container(
               child:  Column(
                 children: [
                   SizedBox(height: 10.0,),
                   Container(

                     child:  Padding(
                       padding: EdgeInsets.symmetric(horizontal: 20.0),
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           Text("Very Severely Underweight",
                             style: TextStyle(
                               color: VSUColor,
                             )
                           ),
                           Text("<= 15.9",
                               style: TextStyle(
                                 color: VSUColor,
                               )),

                         ],
                       ),
                     ),
                   ),

                   Container(

                     child:  Padding(
                       padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 5.0),
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           Text("Severely Underweight",
                               style: TextStyle(
                                 color: SUColor,
                               )),
                           Text("16.0 - 16.9",
                               style: TextStyle(
                                 color: SUColor,
                               )),
                         ],
                       ),
                     ),
                   ),

                   Container(

                     child:  Padding(
                       padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 5.0),
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           Text("Underweight",
                               style: TextStyle(
                                 color: UColor,
                               )),
                           Text("16.0 - 18.4",
                               style: TextStyle(
                                 color: UColor,
                               )),
                         ],
                       ),
                     ),
                   ),

                   Container(

                     child:  Padding(
                       padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 5.0),
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           Text("Normal",
                               style: TextStyle(
                                 color: NColor,
                               )),
                           Text("18.5 - 24.9",
                               style: TextStyle(
                                 color: NColor,
                               )),
                         ],
                       ),
                     ),
                   ),

                   Container(

                     child:  Padding(
                       padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 5.0),
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           Text("Overweight",
                               style: TextStyle(
                                 color: OWColor
                               )),
                           Text("25.0 - 29.9",
                               style: TextStyle(
                                 color: OWColor,
                               )),
                         ],
                       ),
                     ),
                   ),

                   Container(

                     child:  Padding(
                       padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 5.0),
                       child: Row(

                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           Text("Obese Class I (Moderately obese)",
                               style: TextStyle(
                                 color: OIColor,
                               )),
                           Text("30.0 - 34.9",
                               style: TextStyle(
                                 color: OIColor,
                               )),
                         ],
                       ),
                     ),
                   ),

                   Container(

                     child:  Padding(
                       padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 5.0),
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           Text("Obese Class II (Severely obese)",
                               style: TextStyle(
                                 color: OIICOLOR,
                               )),
                           Text("35.0 - 39.9",
                               style: TextStyle(
                                 color: OIICOLOR,
                               )),
                         ],
                       ),
                     ),
                   ),

                   Container(

                     child:  Padding(
                       padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 5.0),
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           Text("Obese Class III (Very severely obese)",
                               style: TextStyle(
                                 color: OIIIColor,
                               )),
                           Text(">= 40.0",
                               style: TextStyle(
                                 color: OIIIColor,
                               )),
                         ],
                       ),
                     ),
                   ),



                 ],
               ),

             ),


            Divider(
              color: Colors.black,
              thickness: 1.0,
            ),


              Container(
                // padding bottom 20
                padding: EdgeInsets.only(bottom: 20.0),


                child:  Column(
                  children: [
                  SizedBox(height: 10.0,),
                    Container(
                      color: Colors.white,
                      child:  Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Normal Weight"),
                          Text(weightRange  ?? "---"),
                      ],
                      ),
                      ),
                      ),
            ],
                ),

              ),


           ],
          ),
        ),
      ),


    );
  }


// Function to handle the selection of male icon
  void selectMale() {
    setState(() {
      isMaleSelected = true;
      isFemaleSelected = false;

    });
  }

// Function to handle the selection of female icon
  void selectFemale() {
    setState(() {
      isMaleSelected = false;
      isFemaleSelected = true;

    });
  }

  /*

  void checkFiled() {
    print("function called: **************");

    st = double.parse(stController.text);
    lb = double.parse(lbController.text);
    heightInCmValue = double.parse(heightInCm.text);
    ageValue = double.parse(age.text);

    print("heightInCmValue: ${ double.parse(ftController.text)}");



    if (st != 0.0 && lb != 0.0) {
      var stToKg = st * 6.35029;
      var lbToKg = lb * 0.453592;
      weightValue = stToKg + lbToKg;
    } else {
      weightValue = double.parse(wtController.text);
    }

    if (heightInCmValue != 0.0) {
      var cmToMeter = heightInCmValue / 100;
      heightInInches = cmToMeter * 39.3701;
      totalHighetInMeeter = cmToMeter;
    } else {
      heightFtValue = double.parse(ftController.text);
      heightInValue = double.parse(inController.text);
      feetInmeeter = heightFtValue * 0.3048;
      inchesInmeeter = heightInValue * 0.0254;
      totalHighetInMeeter = feetInmeeter + inchesInmeeter;
      heightInInches = (heightFtValue * 12) + heightInValue;
    }

    calculateBMI(); // Move the calculation outside the conditional blocks
  }
*/


  void checkFiled() {

    ageValue = double.parse(age.text);

    // print value
    print("agecontroler: ${age.text} , ftController: ${ftController.text} , inController: ${inController.text} , wtController: ${wtController.text}");
    if (age.text.isNotEmpty &&
        ftController.text.isNotEmpty &&
        inController.text.isNotEmpty &&
        wtController.text.isNotEmpty) {

      ageValue = double.parse(age.text);
      heightFtValue = double.parse(ftController.text);
      heightInValue = double.parse(inController.text);
      weightValue = double.parse(wtController.text);
      calculateBMI();
    }
  }



  void WeightRangeBasedOnBmi(double min , double max){

    heightFtValue = double.parse(ftController.text);
    heightInValue = double.parse(inController.text);
    feetInmeeter = heightFtValue * 0.3048;
    inchesInmeeter = heightInValue * 0.0254;
    totalHighetInMeeter = feetInmeeter + inchesInmeeter;
    heightInInches = (heightFtValue * 12) + heightInValue;

      //get one decimal value
      totalHighetInMeeter = double.parse(totalHighetInMeeter.toStringAsFixed(1));

    var minimumWeight = double.parse((min * (totalHighetInMeeter * totalHighetInMeeter)).toStringAsFixed(1));
     var  maximumWeight = double.parse((max * (totalHighetInMeeter * totalHighetInMeeter)).toStringAsFixed(1));

     if(weightValue < minimumWeight){
       isGone = true;
        var diff = minimumWeight - weightValue;
        titleValue = "-${double.parse(diff.toStringAsFixed(1))} kg";
     }else if(weightValue > maximumWeight){
       isGone = true;
       var diff = weightValue - maximumWeight;
        titleValue = "+${double.parse(diff.toStringAsFixed(1))} kg";

     }else{
      //right sign
       isGone = false;
     }

      setState(() {
        weightRange = "$minimumWeight - $maximumWeight kg";
      });




  }


  void selectedIcon(double heightInInches) {
    if(isMaleSelected ){
      if(ageValue >= 18 && ageValue < 65 && heightInInches >= 5.5 && heightInInches <= 5.9){
        var normalBmiRange ="18.5 - 25.9";
        WeightRangeBasedOnBmi(18.5, 25.9);
      }else if(ageValue >= 18 && ageValue < 65 && heightInInches >= 6.0 && heightInInches < 6){
        var normalBmiRange ="20.0 - 27.0";
        WeightRangeBasedOnBmi(20.0, 27.0);
      }else if(ageValue >= 18 && ageValue < 65 ) {
        var normalBmiRange = "21.0 - 24.9";
        WeightRangeBasedOnBmi(21.0, 24.9);
      }
    }
    else if(isFemaleSelected){

      if(ageValue >= 18 && ageValue < 65 && heightInInches >= 5.5 && heightInInches <= 5.9){
        var normalBmiRange ="18.5 - 25.9";
        WeightRangeBasedOnBmi(18.5, 25.9);
      }else if(ageValue >= 18 && ageValue < 65 && heightInInches >= 6.0 && heightInInches < 6){
        var normalBmiRange ="20.0 - 27.0";
        WeightRangeBasedOnBmi(20.0, 27.0);
      }else if(ageValue >= 18 && ageValue < 65 ) {
        var normalBmiRange = "21.0 - 24.9";
        WeightRangeBasedOnBmi(21.0, 24.9);
      }

    }
  }




  // Method to calculate BMI
  void calculateBMI() {
    double heightInInches = (heightFtValue * 12) + heightInValue;
    double meeter = heightInInches / 39.3701;
    bmi = weightValue / (meeter * meeter);









    // state update
    setState(() {
      result = bmi.toStringAsFixed(1);
      if(bmi < 18.5){
        if(bmi < 12) {
          rangeValue = bmi+12;
        }else if(bmi > 35){
          rangeValue = 34.5;
        }else{
          rangeValue = bmi;
        }
      }else if(bmi >= 18.5 && bmi <= 24.9){
        if(bmi < 35) {
          rangeValue = bmi+35;
        }else if(bmi > 60){
          rangeValue = 24.8;
        }else{
          rangeValue = bmi;
        }
      }else if(bmi >= 25.0 && bmi <= 29.9){
        if(bmi < 60) {
          rangeValue = bmi+60;
        }else if(bmi > 85){
          rangeValue = 29.8;
        }else{
          rangeValue = bmi;
        }
      }

      getBMICategory();

      selectedIcon(heightInInches);


    });
  }



  getBMICategory() {
    print("colorbmi: $bmi");
    if (bmi <= 15.9) {
      setState(() {
        VSUColor = Colors.blue;
        weightRangeColor = Colors.blue;
        title = "Very Severely Underweight";
        // all are black
        SUColor = Colors.black;
        UColor = Colors.black;
        NColor = Colors.black;
        OWColor = Colors.black;
        OIColor = Colors.black;
        OIICOLOR = Colors.black;
        OIIIColor = Colors.black;

      });

    } else if (bmi >= 16.0 && bmi <= 16.9) {
      setState(() {
        SUColor = Colors.blue;
        weightRangeColor = Colors.blue;
        title = "Severely Underweight";
        VSUColor = Colors.black;
        UColor = Colors.black;
        NColor = Colors.black;
        OWColor = Colors.black;
        OIColor = Colors.black;
        OIICOLOR = Colors.black;
        OIIIColor = Colors.black;
      });
    } else if (bmi >= 17.0 && bmi <= 18.4) {
      setState(() {
        UColor = Colors.blue;
        weightRangeColor = Colors.blue;
        title = "Underweight";
        VSUColor = Colors.black;
        // all are black
        SUColor = Colors.black;
        NColor = Colors.black;
        OWColor = Colors.black;
        OIColor = Colors.black;
        OIICOLOR = Colors.black;
        OIIIColor = Colors.black;
      });
    } else if (bmi >= 18.5 && bmi <= 24.9) {
      setState(() {
        NColor = Colors.green;
        weightRangeColor = Colors.green;
        title = "Normal";

        VSUColor = Colors.black;
        // all are black
        SUColor = Colors.black;
        UColor = Colors.black;
        OWColor = Colors.black;
        OIColor = Colors.black;
        OIICOLOR = Colors.black;
        OIIIColor = Colors.black;
      });
    } else if (bmi >= 25.0 && bmi <= 29.9) {
      setState(() {
        OWColor = Colors.red;
        weightRangeColor = Colors.red;
        title = "Overweight";

        VSUColor = Colors.black;
        SUColor = Colors.black;
        UColor = Colors.black;
        NColor = Colors.black;
        OIColor = Colors.black;
        OIICOLOR = Colors.black;
        OIIIColor = Colors.black;
      });
    } else if (bmi >= 30.0 && bmi <= 34.9) {
      setState(() {
        OIColor = Colors.red;
        weightRangeColor = Colors.red;
        title = "Obese Class I (Moderately obese)";
        VSUColor = Colors.black;
        // all are black
        SUColor = Colors.black;
        UColor = Colors.black;
        NColor = Colors.black;
        OWColor = Colors.black;
        OIICOLOR = Colors.black;
        OIIIColor = Colors.black;
      });
    } else if (bmi >= 35.0 && bmi <= 39.9) {
      setState(() {
        OIICOLOR = Colors.red;
        weightRangeColor = Colors.red;
        title = "Obese Class II (Severely obese)";

        VSUColor = Colors.black;
        // all are black
        SUColor = Colors.black;
        UColor = Colors.black;
        NColor = Colors.black;
        OWColor = Colors.black;
        OIColor = Colors.black;
        OIIIColor = Colors.black;
      });
    } else {
      setState(() {
        OIIIColor = Colors.red;
        weightRangeColor = Colors.red;
        title = "Obese Class III (Very severely obese)";

        VSUColor = Colors.black;
        // all are black
        SUColor = Colors.black;
        UColor = Colors.black;
        NColor = Colors.black;
        OWColor = Colors.black;
        OIColor = Colors.black;
        OIICOLOR = Colors.black;

      });
    }
  }












}
