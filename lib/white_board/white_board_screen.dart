import 'dart:developer';

import 'package:basic_1/white_board/drawing_point_modal.dart';
import 'package:basic_1/white_board/white_board_pointer.dart';
import 'package:flutter/material.dart';

class WhiteboardScreen extends StatefulWidget {
  const WhiteboardScreen({Key? key}) : super(key: key);

  @override
  State<WhiteboardScreen> createState() => _WhiteboardScreenState();
}

class _WhiteboardScreenState extends State<WhiteboardScreen> {
  List<List<DrawingPoint>> strokes = [];
  List<DrawingPoint> currentStroke = [];
  Color selectedColor = Colors.black;
  double strokeWidth = 3.0;

  final List<Color> colors = [
    Colors.black,
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.orange,
    Colors.purple,
    Colors.pink,
  ];

  void _onPanStart(DragStartDetails details) {
    setState(() {
      currentStroke = [
        DrawingPoint(
          details.localPosition,
          Paint()
            ..color = selectedColor
            ..strokeWidth = strokeWidth
            ..strokeCap = StrokeCap.round,
        ),
      ];
    });
  }

  void _onPanUpdate(DragUpdateDetails details) {
    setState(() {
      currentStroke.add(
        DrawingPoint(
          details.localPosition,
          Paint()
            ..color = selectedColor
            ..strokeWidth = strokeWidth
            ..strokeCap = StrokeCap.round,
        ),
      );
    });
  }

  void _onPanEnd(DragEndDetails details) {
    setState(() {
      strokes.add(List.from(currentStroke));
      currentStroke = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Whiteboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.clear),
            onPressed: () {
              strokes.clear();
              strokeWidth = 3.0;
              selectedColor = Colors.black;
              currentStroke.clear();
              setState(() {});
            },
          ),
          IconButton(
            icon: const Icon(Icons.undo),
            onPressed: () {
              if (strokes.isNotEmpty) {
                setState(() {
                  strokes.removeLast();
                });
              }
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ...colors.map(
                  (color) => GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedColor = color;
                      });
                    },
                    child: Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        color: color,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: selectedColor == color
                              ? Colors.blue
                              : Colors.grey,
                          width: selectedColor == color ? 3 : 1,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                const Text('Stroke Width: '),
                Expanded(
                  child: Slider(
                    value: strokeWidth,
                    min: 1.0,
                    max: 20.0,
                    divisions: 19,
                    label: strokeWidth.round().toString(),
                    onChanged: (value) {
                      setState(() {
                        strokeWidth = value;
                      });
                    },
                  ),
                ),
                Text('${strokeWidth.round()}'),
              ],
            ),
          ),

          Expanded(
            child: Container(
              color: Colors.white,
              child: GestureDetector(
                onPanStart: _onPanStart,
                onPanUpdate: _onPanUpdate,
                onPanEnd: _onPanEnd,
                child: CustomPaint(
                  painter: WhiteboardPainter(
                    strokes: strokes,
                    currentStroke: currentStroke,
                  ),
                  child: Container(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
