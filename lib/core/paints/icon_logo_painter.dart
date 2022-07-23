import 'package:flutter/material.dart';

class IconLogoPainter extends CustomPainter {
  const IconLogoPainter({required this.color});

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.3618262, size.height);
    path_0.cubicTo(
        size.width * 0.2129961,
        size.height * 0.9991426,
        size.width * 0.08988672,
        size.height * 0.6953301,
        size.width * 0.08988672,
        size.height * 0.5406055);
    path_0.cubicTo(
        size.width * 0.08988672,
        size.height * 0.2878633,
        size.width * 0.2794863,
        size.height * 0.2325312,
        size.width * 0.3525566,
        size.height * 0.2325312);
    path_0.cubicTo(
        size.width * 0.3854863,
        size.height * 0.2325312,
        size.width * 0.4206484,
        size.height * 0.2454629,
        size.width * 0.4516621,
        size.height * 0.2569062);
    path_0.cubicTo(
        size.width * 0.4733496,
        size.height * 0.2648887,
        size.width * 0.4957793,
        size.height * 0.2731289,
        size.width * 0.5082539,
        size.height * 0.2731289);
    path_0.cubicTo(
        size.width * 0.5157207,
        size.height * 0.2731289,
        size.width * 0.5333164,
        size.height * 0.2661191,
        size.width * 0.5488516,
        size.height * 0.2599687);
    path_0.cubicTo(
        size.width * 0.5819824,
        size.height * 0.2467793,
        size.width * 0.6232090,
        size.height * 0.2303867,
        size.width * 0.6712168,
        size.height * 0.2303867);
    path_0.cubicTo(
        size.width * 0.6713027,
        size.height * 0.2303867,
        size.width * 0.6714180,
        size.height * 0.2303867,
        size.width * 0.6715020,
        size.height * 0.2303867);
    path_0.cubicTo(
        size.width * 0.7073496,
        size.height * 0.2303867,
        size.width * 0.8160410,
        size.height * 0.2382539,
        size.width * 0.8813867,
        size.height * 0.3363867);
    path_0.lineTo(size.width * 0.8966934, size.height * 0.3593887);
    path_0.lineTo(size.width * 0.8746641, size.height * 0.3760117);
    path_0.cubicTo(
        size.width * 0.8431934,
        size.height * 0.3997578,
        size.width * 0.7857715,
        size.height * 0.4430742,
        size.width * 0.7857715,
        size.height * 0.5288770);
    path_0.cubicTo(
        size.width * 0.7857715,
        size.height * 0.6305000,
        size.width * 0.8508027,
        size.height * 0.6695820,
        size.width * 0.8820449,
        size.height * 0.6883789);
    path_0.cubicTo(
        size.width * 0.8958359,
        size.height * 0.6966758,
        size.width * 0.9101113,
        size.height * 0.7052305,
        size.width * 0.9101113,
        size.height * 0.7239414);
    path_0.cubicTo(
        size.width * 0.9101113,
        size.height * 0.7361582,
        size.width * 0.8126074,
        size.height * 0.9984844,
        size.width * 0.6710156,
        size.height * 0.9984844);
    path_0.cubicTo(
        size.width * 0.6363691,
        size.height * 0.9984844,
        size.width * 0.6118789,
        size.height * 0.9880703,
        size.width * 0.5902773,
        size.height * 0.9788867);
    path_0.cubicTo(
        size.width * 0.5684199,
        size.height * 0.9695879,
        size.width * 0.5495645,
        size.height * 0.9615781,
        size.width * 0.5184082,
        size.height * 0.9615781);
    path_0.cubicTo(
        size.width * 0.5026152,
        size.height * 0.9615781,
        size.width * 0.4826445,
        size.height * 0.9690449,
        size.width * 0.4615020,
        size.height * 0.9769707);
    path_0.cubicTo(
        size.width * 0.4326094,
        size.height * 0.9877539,
        size.width * 0.3999063,
        size.height,
        size.width * 0.3627988,
        size.height);
    path_0.lineTo(size.width * 0.3618262, size.height);
    path_0.close();

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = color.withOpacity(1.0);
    canvas.drawPath(path_0, paint0Fill);

    Path path_1 = Path();
    path_1.moveTo(size.width * 0.6862168, 0);
    path_1.cubicTo(
        size.width * 0.6899043,
        size.height * 0.1329609,
        size.width * 0.5948164,
        size.height * 0.2252031,
        size.width * 0.4998398,
        size.height * 0.2194180);
    path_1.cubicTo(size.width * 0.4841895, size.height * 0.1133105,
        size.width * 0.5948047, 0, size.width * 0.6862168, 0);
    path_1.close();

    Paint paint1Fill = Paint()..style = PaintingStyle.fill;
    paint1Fill.color = color.withOpacity(1.0);
    canvas.drawPath(path_1, paint1Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
