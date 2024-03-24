import 'dart:ui';

import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

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

  bool isMaleSelected = false;
  bool isFemaleSelected = false;
  var result = '';
  final _listItem = ["ft","cm"];
  String? _slectedVal = "ft";
  final _listOfWItem = ["kg","lb","st"];
  String? _selectedWval= "kg";

  Color backgroundColor = Colors.black;

  Color VSUColor = Colors.black;
  Color SUColor = Colors.black;
  Color UColor = Colors.black;
  Color NColor = Colors.black;
  Color OWColor = Colors.black;
  Color OIColor = Colors.black;
  Color OIICOLOR = Colors.black;
  Color OIIIColor = Colors.black;


  // Define variables to store user input and BMI result
  String gender = 'Male';
  double ageValue = 0.0;
  double weightValue = 0.0;
  double heightFtValue = 0.0;
  double heightInValue = 0.0;
  double bmi = 0.0;
  double rangeValue = 0.0;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Color(0xFFF0F5EF),

        title: Text('BMI Calculator'),
      ),
      body: Container(

        // backgroud color
        color: Color(0xFFFBFDF8),


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


                       Container(
                           width: 50,
                           height: 60,


                           child:  DropdownButtonFormField(
                               value: _slectedVal,
                               items: _listItem.map(
                                       (e) => DropdownMenuItem(child: Text(e),value: e,)

                               ).toList(),
                               onChanged: (val){
                                 setState(() {
                                   _slectedVal = val as String;
                                 });
                               }
                           )



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



                       // Feet container

                       Container(
                         width: 70,
                         height: 60,

                         child:   Column(


                           children: [

                             TextField(
                               controller: wtController,

                               decoration: const InputDecoration(
                                 labelText: "Weight",
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
                       ),




                       Container(
                           width: 50,
                           height: 60,


                           child:  DropdownButtonFormField(
                               value: _selectedWval,
                               items: _listOfWItem.map(
                                       (e) => DropdownMenuItem(child: Text(e),value: e,)

                               ).toList(),
                               onChanged: (val){
                                 setState(() {
                                   _selectedWval = val as String;
                                 });
                               }
                           )



                       ),

                     ],
                   ),
                 ],
               ),
             ),



             Container(
               height: 250,
               margin: const EdgeInsets.symmetric(vertical: 20.0),
               child: SfRadialGauge(
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
                         value: rangeValue ?? 0,


                         markerHeight: 15,
                         markerWidth: 18,
                         markerType: MarkerType.triangle,
                         enableAnimation: true,
                         animationDuration: 4500,
                         markerOffset: 38,
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
                child:  Column(
                  children: [
                  SizedBox(height: 10.0,),
                    Container(
                      color: Colors.white,
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Normal Weight"),
                          Text("---"),
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


  void checkFiled() {

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






  // Method to calculate BMI
  void calculateBMI() {
    double heightInInches = (heightFtValue * 12) + heightInValue;
    double meeter = heightInInches / 39.3701;
    bmi = weightValue / (meeter * meeter);



    // state update
    setState(() {
      result = bmi.toStringAsFixed(1);
      rangeValue = (bmi + 30);
      getBMICategory();

    });
  }



  getBMICategory() {
    print("colorbmi: $bmi");
    if (bmi <= 15.9) {
      setState(() {
        VSUColor = Colors.blue;
      });

    } else if (bmi >= 16.0 && bmi <= 16.9) {
      setState(() {
        SUColor = Colors.blue;
      });
    } else if (bmi >= 17.0 && bmi <= 18.4) {
      setState(() {
        UColor = Colors.blue;
      });
    } else if (bmi >= 18.5 && bmi <= 24.9) {
      setState(() {
        NColor = Colors.green;
      });
    } else if (bmi >= 25.0 && bmi <= 29.9) {
      setState(() {
        OWColor = Colors.red;
      });
    } else if (bmi >= 30.0 && bmi <= 34.9) {
      setState(() {
        OIColor = Colors.red;
      });
    } else if (bmi >= 35.0 && bmi <= 39.9) {
      setState(() {
        OIICOLOR = Colors.red;
      });
    } else {
      setState(() {
        OIIIColor = Colors.red;
      });
    }
  }












}
