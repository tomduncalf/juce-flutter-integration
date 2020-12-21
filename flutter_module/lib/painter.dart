import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class Painter extends CustomPainter {
  final List<double> points;
  double yCenter = 200;

  Painter(this.points);

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();

    var pointSpacing = 1000.0 / points.length;

    paint.strokeWidth = 1;
    paint.style = PaintingStyle.fill;
    // paint.color = Colors.red;
    paint.color = Colors.black; //.withAlpha(40);
    paint.style = PaintingStyle.stroke;

    // canvas.drawRect(Rect.largest, paint);
    var path = Path();

    var i = 0.0;
    points.forEach((point) {
      var p = point * 100;
      var iScaled = i * pointSpacing;

      path.moveTo(iScaled, yCenter - p);
      path.lineTo(iScaled, yCenter + p);

      i += 1;
    });

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

// // paint.imageFilter = ui.ImageFilter.blur(sigmaX: 20, sigmaY: 20);
// // paint.shader = null;
// // // canvas.drawRect(Rect.largest, paint);
// // paint.color = Colors.yellow;
// // canvas.drawPath(path, paint);

// // // paint.shader = LinearGradient(
// // //   colors: [
// // //     Colors.red,
// // //     Colors.blue,
// // //   ],
// // // ).createShader(Rect.fromLTRB(0, 0, size.width, size.height));
// // paint.color = Colors.black;
// // paint.imageFilter = null;
// // paint.style = PaintingStyle.fill;

// // path.lineTo(size.width, size.height);
// // path.lineTo(0, size.height);

// // canvas.drawShadow(path, Colors.white.withAlpha(50), 1, true);
