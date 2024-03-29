
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/widgets.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';







class Settings extends StatefulWidget {
  @override
  _SettingsState  createState() => _SettingsState();
}

class _SettingsState  extends State<Settings> {
  final List<String> classificationItems = [
    'WHO',
    'DGE',
  ];

  String? selectedValue;

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),

      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children:[
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    padding: EdgeInsets.only(left: 20),
                    margin: EdgeInsets.only(top: 20),
                    child: Text(
                      'Evaluation',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFF627674),
                      ),

                    ),
                  ),

                 Container(
                   width: MediaQuery.of(context).size.width * 0.5,
                   margin: EdgeInsets.only(right: 100, top: 10),
                   padding: EdgeInsets.only(left: 2),
                   child: DropdownButtonFormField2<String>(
                      isExpanded: true,
                      decoration: InputDecoration(
                        // Add Horizontal padding using menuItemStyleData.padding so it matches
                        // the menu padding when button's width is not specified.
                        contentPadding: const EdgeInsets.symmetric(vertical: 16),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        // Add more decoration..
                      ),
                      hint: const Text(
                        'Classification',
                        style: TextStyle(fontSize: 14),
                      ),
                      items: classificationItems
                          .map((item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ))
                          .toList(),
                      validator: (value) {
                        if (value == null) {
                          return 'Please Classification';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        //Do something when selected item is changed.
                      },
                      onSaved: (value) {
                        selectedValue = value.toString();
                      },
                      buttonStyleData: const ButtonStyleData(
                        padding: EdgeInsets.only(right: 8),
                      ),
                      iconStyleData: const IconStyleData(
                        icon: Icon(
                          Icons.arrow_drop_down,
                          color: Colors.black45,
                        ),
                        iconSize: 24,
                      ),
                      dropdownStyleData: DropdownStyleData(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      menuItemStyleData: const MenuItemStyleData(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                      ),
                    ),
                 ),
                ],

              ),

              Container(
                margin: EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Text Field and Tagalog button
                  Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      'Adults Only',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Container(

                    height: 40,
                    margin: EdgeInsets.only(right: 20),
                    padding: EdgeInsets.only(left: 20),
                    child: LiteRollingSwitch(
                      width: 80,

                      value: true,
                      colorOn: Colors.green,
                      colorOff: Colors.grey,
                      iconOn: Icons.done,
                      iconOff: Icons.remove_circle_outline,
                      textSize: 1.0,
                      onChanged: (bool state) {
                        //Use it to manage the different states
                        print('Current State of TAGALOG/ENGLISH: $state');
                      }, onDoubleTap: () {
                        //You can pass any function you want
                        print('This function is passed to the double tap');

                    },
                      onTap: () {
                        //You can pass any function you want
                        print('This function is passed to the tap');
                      },
                      onSwipe: () {
                        //You can pass any function you want
                        print('This function is passed to the swipe');
                      },
                    ),
                  ),


                      ],

                  )

              ),

              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    width: MediaQuery.of(context).size.width * 0.95,
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      'Units',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFF627674),
                      ),
                    ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        width: MediaQuery.of(context).size.width * 0.4,
                        padding: EdgeInsets.only(left: 20),
                        child: DropdownButtonFormField2<String>(
                          isExpanded: true,
                          decoration: InputDecoration(
                            // Add Horizontal padding using menuItemStyleData.padding so it matches
                            // the menu padding when button's width is not specified.
                            contentPadding: const EdgeInsets.symmetric(vertical: 16),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            // Add more decoration..
                          ),
                          hint: const Text(
                            'Height(ft)',
                            style: TextStyle(fontSize: 14),
                          ),
                          items: classificationItems
                              .map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ))
                              .toList(),
                          validator: (value) {
                            if (value == null) {
                              return 'Please Classification';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            //Do something when selected item is changed.
                          },
                          onSaved: (value) {
                            selectedValue = value.toString();
                          },
                          buttonStyleData: const ButtonStyleData(
                            padding: EdgeInsets.only(right: 8),
                          ),
                          iconStyleData: const IconStyleData(
                            icon: Icon(
                              Icons.arrow_drop_down,
                              color: Colors.black45,
                            ),
                            iconSize: 24,
                          ),
                          dropdownStyleData: DropdownStyleData(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          menuItemStyleData: const MenuItemStyleData(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                          ),
                        ),
                      ),

                      Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        padding: EdgeInsets.only(left: 20),
                        child: DropdownButtonFormField2<String>(
                          isExpanded: true,
                          decoration: InputDecoration(
                            // Add Horizontal padding using menuItemStyleData.padding so it matches
                            // the menu padding when button's width is not specified.
                            contentPadding: const EdgeInsets.symmetric(vertical: 16),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            // Add more decoration..
                          ),
                          hint: const Text(
                            'Weight(kg)',
                            style: TextStyle(fontSize: 14),
                          ),
                          items: classificationItems
                              .map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ))
                              .toList(),
                          validator: (value) {
                            if (value == null) {
                              return 'Please Classification';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            //Do something when selected item is changed.
                          },
                          onSaved: (value) {
                            selectedValue = value.toString();
                          },
                          buttonStyleData: const ButtonStyleData(
                            padding: EdgeInsets.only(right: 8),
                          ),
                          iconStyleData: const IconStyleData(
                            icon: Icon(
                              Icons.arrow_drop_down,
                              color: Colors.black45,
                            ),
                            iconSize: 24,
                          ),
                          dropdownStyleData: DropdownStyleData(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          menuItemStyleData: const MenuItemStyleData(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                          ),
                        ),
                      ),


                ],


              ),


            ],
              ),

              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.95,
                    padding: EdgeInsets.only(left: 20),
                    margin: EdgeInsets.only(top: 20),
                    child: Text(
                      'More',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFF627674),
                      ),
                    ),
                  ),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 30),
                        width: MediaQuery.of(context).size.width * 0.9,
                        padding: EdgeInsets.only(left: 20),
                        child: Text(
                          'Help & feedback',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),

                      Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        margin: EdgeInsets.only(top: 30),
                        padding: EdgeInsets.only(left: 20),
                        child: Text(
                          'Rate this app',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),

                      Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        margin: EdgeInsets.only(top: 30),
                        padding: EdgeInsets.only(left: 20),
                        child: Text(
                          'More apps',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),



                    ],


                  ),


                ],
              ),




            ],

          ),
    ),
      ),
    );
  }
}
