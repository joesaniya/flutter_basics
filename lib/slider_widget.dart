import 'package:flutter/material.dart';

class SliderWidget extends StatefulWidget {
  const SliderWidget({super.key});

  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  double price_value = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Slider Example')),
      body: Column(
        children: [
          Text('Slider Widget Content Here'),
          Slider(
            label: price_value.toString(),
            value: price_value,
            min: 0,
            max: 10,
            divisions: 8,
            onChanged: (value) {
              setState(() {
                price_value = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
