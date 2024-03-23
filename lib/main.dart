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
  var result = '';
  final _listItem = ["ft","cm"];
  String? _slectedVal = "ft";
  final _listOfWItem = ["kg","lb","st"];
  String? _selectedWval= "kg";

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

                   child:   const Row(


                     children: [

                       // Mail icon
                       Icon(Icons.man,size: 20,),
                       // Vertical divider
                       VerticalDivider(
                         thickness: 1.0,
                         color: Colors.grey,
                       ),

                       // Female icon
                       Icon(Icons.woman,size: 20,),


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
                         controller: age,

                         decoration: const InputDecoration(
                           labelText: "Weight",
                           labelStyle: TextStyle(
                             fontSize: 12,

                           ) ,
                           contentPadding: EdgeInsets.symmetric(horizontal: 12.0),
                         ),
                         keyboardType: TextInputType.number,
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

             SfRadialGauge(

               enableLoadingAnimation: true, animationDuration: 4500,
               axes:<RadialAxis>[

                 RadialAxis(

                     showLabels: false,
                     showAxisLine: false,
                     showTicks: false,
                     minimum: 0, maximum: 99,
                     startAngle: 150,
                     endAngle: 35,


                     ranges: <GaugeRange>[
                       GaugeRange(startValue: 0, endValue: 33,
                         color: Color(0xFF21A6F3),
                           label: 'Underweight',
                         sizeUnit: GaugeSizeUnit.factor,
                         labelStyle: GaugeTextStyle(
                             fontFamily: 'Times',
                             fontSize:  20 ,
                             color: Colors.white),
                         startWidth: 0.65, endWidth: 0.65
                     ),GaugeRange(startValue: 33, endValue: 66,
                       color:Color(0xFF40BC64), label: 'Normal',
                       labelStyle: GaugeTextStyle(fontFamily: 'Times', fontSize:   20,color: Colors.white),
                       startWidth: 0.65, endWidth: 0.65, sizeUnit: GaugeSizeUnit.factor,
                     ),
                       GaugeRange(startValue: 66, endValue: 99,
                         color:Color(0xFFFC5449), label: 'Overweight',
                         labelStyle: GaugeTextStyle(fontFamily: 'Times', fontSize:   20,color: Colors.white),
                         sizeUnit: GaugeSizeUnit.factor,
                         startWidth: 0.65, endWidth: 0.65,
                       ),

                     ],


                     pointers: <GaugePointer>[NeedlePointer(value:20, )],
                     annotations: <GaugeAnnotation>[
                       GaugeAnnotation(widget: Container(child:
                       Text('20.0',style: TextStyle(fontSize: 25,fontWeight:FontWeight.bold))),
                           angle: 90,positionFactor: 0.5)]



                 )
               ],
             ),


             // Horizontal divider
              const Divider(
                thickness: 1.0,
                color: Colors.grey,
              ),


              const Column(
                children: [


                  SizedBox(height: 10.0,),


                  Row(


                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [


                      Padding(
                        padding: EdgeInsets.only(left: 20.0),
                        child: Text("Very Severely Underweight"),
                      ),

                      Padding(
                        padding: EdgeInsets.only(right: 20.0),
                        child: Text("<= 15.9"),
                      ),




                    ],
                  ),


                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Padding(
                        padding: EdgeInsets.only(left: 20.0),
                        child: Text("Underweight"),
                      ),

                      Padding(
                          padding: EdgeInsets.only(right: 20.0),
                          child:  Text("16.0 - 18.4")
                      ),



                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Padding(
                        padding: EdgeInsets.only(left: 20.0),
                        child: Text("Normal"),
                      ),

                      Padding(
                          padding: EdgeInsets.only(right: 20.0),
                          child:  Text("18.5 - 24.9")
                      ),



                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Padding(
                        padding: EdgeInsets.only(left: 20.0),
                        child: Text("Overweight"),
                      ),

                      Padding(
                          padding: EdgeInsets.only(right: 20.0),
                          child:  Text("25.0 - 29.9")
                      ),



                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Padding(
                        padding: EdgeInsets.only(left: 20.0),
                        child: Text("Obese Class I (Moderately obese)"),
                      ),

                      Padding(
                          padding: EdgeInsets.only(right: 20.0),
                          child:  Text("30.0 - 34.9")
                      ),



                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Padding(
                        padding: EdgeInsets.only(left: 20.0),
                        child: Text("Obese Class II (Severely obese)"),
                      ),

                      Padding(
                          padding: EdgeInsets.only(right: 20.0),
                          child:  Text("35.0 - 39.9")
                      ),


                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Padding(
                        padding: EdgeInsets.only(left: 20.0),
                        child: Text("Obese Class III (Very severely obese)"),
                      ),

                      Padding(
                          padding: EdgeInsets.only(right: 20.0),
                          child:  Text(">= 40.0")
                      ),



                    ],
                  ),
                ],
              ),






              ElevatedButton(
                onPressed: (){
                  var wt = wtController.text.toString();
                  var ft = ftController.text.toString();
                  var inch = inController.text.toString();
                  var ag = age.text.toString();

                  if(!wt.isEmpty && !ft.isEmpty && !inch.isEmpty){

                    // calculate also age
                    var hight = int.parse(ft) * 12 + int.parse(inch);
                    var bmi = (int.parse(wt) / (hight * hight)) * 703;






                    setState(() {
                      result = 'Your BMI is ${bmi.toStringAsFixed(2)}';
                    });
                  }else{
                    setState(() {
                      result = 'Please enter all fields';
                    });
                  }




                },
                child: Text('Calculate'),),
              Text(result)
             

             
 
           ],
          ),
        ),

    // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
