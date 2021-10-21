import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'dart:ui';

class CirclesPainter extends CustomPainter {
  CirclesPainter({this.circles, this.progress, this.showPath,});

  final double circles, progress;
  bool showPath;


  var myPaint = Paint()
    ..color = Color(0xFFF54B00)
    ..style = PaintingStyle.stroke
    ..strokeWidth = 8.0
    ..strokeCap = StrokeCap.round ;

  double radius = 46;

  @override
  void paint(Canvas canvas, Size size) {
    var path = createPath();
    PathMetrics pathMetrics = path.computeMetrics();
    for (PathMetric pathMetric in pathMetrics) {
      Path extractPath = pathMetric.extractPath(
        0.0,
        pathMetric.length * progress,
      );
      if (showPath) {
        canvas.drawPath(extractPath, myPaint);
      }
    }
  }

  Path createPath() {
    var path = Path();
    int n = circles.toInt();
    var range = List<int>.generate(n, (i) => i + 1);
    double angle = 2 * math.pi / n;
    for (int i in range) {
      double x = radius * math.cos(i * angle);
      double y = radius * math.sin(i * angle);
      path.addOval(Rect.fromCircle(center: Offset(x, y), radius: radius, ));
    }
    return path;
  }

  @override
  bool shouldRepaint(CirclesPainter oldDelegate) {
    return true;
  }
}