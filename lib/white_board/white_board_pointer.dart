import 'package:basic_1/white_board/drawing_point_modal.dart';
import 'package:flutter/material.dart';

class WhiteboardPainter extends CustomPainter {
  final List<List<DrawingPoint>> strokes;
  final List<DrawingPoint> currentStroke;

  WhiteboardPainter({required this.strokes, required this.currentStroke});

  @override
  void paint(Canvas canvas, Size size) {
    
    for (var stroke in strokes) {
      _drawStroke(canvas, stroke);
    }

  
    if (currentStroke.isNotEmpty) {
      _drawStroke(canvas, currentStroke);
    }
  }

  void _drawStroke(Canvas canvas, List<DrawingPoint> stroke) {
    for (int i = 0; i < stroke.length - 1; i++) {
      if (stroke[i].offset != Offset.zero &&
          stroke[i + 1].offset != Offset.zero) {
        canvas.drawLine(
          stroke[i].offset,
          stroke[i + 1].offset,
          stroke[i].paint,
        );
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
