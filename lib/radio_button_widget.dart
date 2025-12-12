import 'dart:developer';

import 'package:basic_1/slider_widget.dart';
import 'package:flutter/material.dart';

class RadioButtonWidget extends StatefulWidget {
  const RadioButtonWidget({super.key});

  @override
  State<RadioButtonWidget> createState() => _RadioButtonWidgetState();
}

class _RadioButtonWidgetState extends State<RadioButtonWidget> {
  String selectedValue = "Female";

  bool isChecked = false;

  bool fruitCheck1 = false;
  bool fruitCheck2 = false;
  bool fruitCheck3 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Radio Button Example')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                PageRouteBuilder(
                  transitionDuration: Duration(milliseconds: 500),
                  pageBuilder: (context, animation, secondaryAnimation) {
                    return RotationTransition(
                      turns: animation,
                      child: SliderWidget(),
                    );
                    //fadein
                    /* return FadeTransition(
                      opacity: animation,
                      child: SliderWidget(),
                    );*/
                  },
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.purple, width: 2),
                borderRadius: BorderRadius.circular(8),
              ),
              padding: EdgeInsets.all(16),
              child: Text('Slide widget'),
            ),
          ),
          SizedBox(height: 10),
          Container(
            child: Column(
              children: [
                Text('Radio Buttons'),
                SizedBox(height: 20),
                Row(
                  children: [
                    Radio<String>(
                      activeColor: Colors.purple,
                      value: 'Female',
                      hoverColor: Colors.purple.shade100,
                      groupValue: selectedValue,
                      onChanged: (value) {
                        setState(() {
                          selectedValue = value!;
                          log(' Selected Value: $selectedValue  ');
                        });
                      },
                    ),
                    SizedBox(width: 8),
                    Text('Female'),
                  ],
                ),
                Row(
                  children: [
                    Radio<String>(
                      activeColor: Colors.purple,
                      value: 'Male',
                      hoverColor: Colors.purple.shade100,
                      groupValue: selectedValue,
                      onChanged: (value) {
                        setState(() {
                          selectedValue = value!;
                          log(' Selected Value: $selectedValue  ');
                        });
                      },
                    ),
                    SizedBox(width: 8),
                    Text('Male'),
                  ],
                ),
              ],
            ),
          ),

          SizedBox(height: 20),
          Container(
            child: Column(
              children: [
                Text('Radio List Tiles'),
                SizedBox(height: 20),
                RadioListTile(
                  title: Text('Female'),
                  value: selectedValue,
                  groupValue: selectedValue,
                  onChanged: (value) {
                    setState(() {
                      selectedValue = value!;
                      log(' Selected Value: $selectedValue  ');
                    });
                  },
                ),
                RadioListTile(
                  title: Text('Male'),
                  value: selectedValue,
                  groupValue: selectedValue,
                  onChanged: (value) {
                    setState(() {
                      selectedValue = value!;
                      log(' Selected Value: $selectedValue  ');
                    });
                  },
                ),
              ],
            ),
          ),

          Container(
            child: Column(
              children: [
                Text(
                  'Checkbox',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),

                Row(
                  children: [
                    Text('Accept Terms and Conditions'),
                    Checkbox(
                      value: isChecked,
                      onChanged: (value) {
                        setState(() {
                          isChecked = value!;
                          log(' Checkbox isChecked: $isChecked  ');
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),

          Container(
            child: Column(
              children: [
                Text(
                  'CheckboxListTile',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),

                CheckboxListTile(
                  value: isChecked,
                  activeColor: Colors.green,
                  title: Text('Accept Terms and Conditions'),
                  onChanged: (value) {
                    setState(() {
                      isChecked = value!;
                      log(' Checkbox isChecked: $isChecked  ');
                    });
                  },
                ),
              ],
            ),
          ),

          Container(
            child: Column(
              children: [
                Text(
                  'Multiple option using Checkbox',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),

                Row(
                  children: [
                    Text('Fruit 1'),
                    Checkbox(
                      value: fruitCheck1,
                      onChanged: (value) {
                        setState(() {
                          fruitCheck1 = value!;
                          log(' Checkbox isChecked: $fruitCheck1 ');
                        });
                      },
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text('Fruit 2'),
                    Checkbox(
                      value: fruitCheck2,
                      onChanged: (value) {
                        setState(() {
                          fruitCheck2 = value!;
                          log(' Checkbox isChecked: $fruitCheck2 ');
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
