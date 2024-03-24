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

             // create a container and set height to 200 and inter child to SfRadialGauge
              Container(


                height: 250,
                // set container background color
                color: Color(0xFF4E7711),
                margin: const EdgeInsets.symmetric(vertical: 20.0),



                child: SfRadialGauge(




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
                       GaugeRange(startValue: 12, endValue: 35,
                         color: Color(0xFF21A6F3),
                           label: 'Underweight',
                           sizeUnit: GaugeSizeUnit.factor,
                         labelStyle: const GaugeTextStyle(
                             fontFamily: 'Times',
                             fontSize:  15 ,
                             color: Colors.white,


                         ),
                         startWidth: 0.4, endWidth: 0.4
                     ),GaugeRange(
                         startValue: 35,
                         endValue: 60,
                       color:Color(0xFF40BC64),
                         label: 'Normal',
                       labelStyle: const GaugeTextStyle(
                           fontFamily: 'Times',
                           fontSize:   15,
                           color: Colors.white),
                       startWidth: 0.4,
                         endWidth: 0.4,
                         sizeUnit: GaugeSizeUnit.factor,
                     ),
                       GaugeRange(
                         startValue: 60,
                         endValue: 85,
                         color:Color(0xFFFC5449),
                         label: 'Overweight',
                         labelStyle: const GaugeTextStyle(
                             fontFamily: 'Times',
                             fontSize:   15,
                             color: Colors.white),




                         sizeUnit: GaugeSizeUnit.factor,
                         startWidth: 0.4, endWidth: 0.4,
                       ),

                     ],


                     pointers: const <GaugePointer>[
                       MarkerPointer(
                         // change pointer color
                            color: Colors.white,
                           value: 20,
                           markerHeight: 15,
                           markerWidth: 18,

                         // change pointer side directio
                             markerType: MarkerType.triangle,
                           enableAnimation: true,
                           animationDuration: 4500,
                            markerOffset: 38,



                       )
                     ],
                     annotations: const <GaugeAnnotation>[
                       GaugeAnnotation(
                           axisValue: 50,
                           positionFactor: 0.1,
                           widget: Text('50.0', style:
                           TextStyle(
                               fontWeight: FontWeight.bold,
                               fontSize: 20),
                           )


                       )




                     ]



                 )

               ],

             ),

              ),




             // Horizontal divider
              const Divider(
                thickness: 1.0,
                color: Colors.grey,
              ),



             Column(
               children: [
                 SizedBox(height: 10.0,),
                 Container(
                   color: Colors.white,
                   child: const Padding(
                     padding: EdgeInsets.symmetric(horizontal: 20.0),
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Text("Very Severely Underweight"),
                         Text("<= 15.9"),
                       ],
                     ),
                   ),
                 ),

                 Container(
                   color: Colors.white,
                   child: const Padding(
                     padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 5.0),
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Text("Severely Underweight"),
                         Text("16.0 - 16.9"),
                       ],
                     ),
                   ),
                 ),

                 Container(
                   color: Colors.white,
                   child: const Padding(
                     padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 5.0),
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Text("Underweight"),
                         Text("16.0 - 18.4"),
                       ],
                     ),
                   ),
                 ),

                 Container(
                   color: Colors.white,
                   child: const Padding(
                     padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 5.0),
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Text("Normal"),
                         Text("18.5 - 24.9"),
                       ],
                     ),
                   ),
                 ),

                  Container(
                    color: Colors.white,
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Overweight"),
                          Text("25.0 - 29.9"),
                        ],
                      ),
                    ),
                  ),

                  Container(
                    color: Colors.white,
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Obese Class I (Moderately obese)"),
                          Text("30.0 - 34.9"),
                        ],
                      ),
                    ),
                  ),

                  Container(
                    color: Colors.white,
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Obese Class II (Severely obese)"),
                          Text("35.0 - 39.9"),
                        ],
                      ),
                    ),
                  ),

                  Container(
                    color: Colors.white,
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Obese Class III (Very severely obese)"),
                          Text(">= 40.0"),
                        ],
                      ),
                    ),
                  ),



               ],
             ),






             /*
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

              */
             

             
 
           ],
          ),
        ),

    // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
