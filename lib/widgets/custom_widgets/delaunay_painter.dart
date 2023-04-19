import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'dart:ui' as ui;

class DelaunayPainter extends CustomPainter {
  const DelaunayPainter({
    required this.nodes,
    this.circleRadius = 20, 
    this.distance = 60,
    this.color = Colors.white,
    this.stroke = 6,
  });

  final List<Offset> nodes;
  final double circleRadius;
  final double distance;
  final Color color;
  final double stroke;

  Offset moveFunction(Offset node, Size size) {
    double dx = node.dx;
    double dy = node.dy;
    return Offset(
      math.min(math.max(circleRadius, dx), size.width-circleRadius), 
      math.min(math.max(circleRadius, dy), size.height-circleRadius)
    );
  }

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = color
      ..strokeWidth = stroke;
    // draw delauney nest line
    for (Offset node1 in nodes) {
      for (Offset node2 in nodes) {
        canvas.drawLine(node1, node2, paint);
      }
    }
    // draw nodes
    for (Offset node in nodes) {
      canvas.drawCircle(node, circleRadius, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}