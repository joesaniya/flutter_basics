import 'dart:developer';

import 'package:flutter/material.dart';

class RadioButtonWidget extends StatefulWidget {
  const RadioButtonWidget({super.key});

  @override
  State<RadioButtonWidget> createState() => _RadioButtonWidgetState();
}

class _RadioButtonWidgetState extends State<RadioButtonWidget> {
  String selectedValue = "Female";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Radio Button Example')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
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
        ],
      ),
    );
  }
}
