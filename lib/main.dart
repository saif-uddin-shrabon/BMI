import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text('BMI Calculator'),
      ),
      body: Container(

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
