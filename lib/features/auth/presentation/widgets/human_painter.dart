import 'package:flutter/material.dart';

class HumanPainter extends CustomPainter {
  final Color fillColor;
  final double legGapFactor;

  HumanPainter({required this.fillColor, this.legGapFactor = 0.08});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint fill =
        Paint()
          ..color = fillColor.withOpacity(0.98)
          ..style = PaintingStyle.fill;
    final double w = size.width;
    final double h = size.height;
    final double headR = h * 0.095;
    final Offset headCenter = Offset(w / 2, headR);
    canvas.drawCircle(headCenter, headR, fill);
    final Rect neck = Rect.fromCenter(
      center: Offset(w / 2, headCenter.dy + headR + h * 0.015),
      width: w * 0.14,
      height: headR * 0.45,
    );
    canvas.drawRRect(RRect.fromRectAndRadius(neck, Radius.circular(3)), fill);

    final double torsoTop = headCenter.dy + headR + h * 0.03;
    final double torsoH = h * 0.34;
    final Rect torso = Rect.fromLTWH(w * 0.06, torsoTop, w * 0.88, torsoH);
    canvas.drawRRect(
      RRect.fromRectAndRadius(torso, Radius.circular(w * 0.12)),
      fill,
    );
    final double pelvisY = torso.bottom - (torsoH * 0.06);
    final Path leftArm = Path();
    leftArm.moveTo(torso.left + w * 0.02, torso.top + h * 0.02);
    leftArm.quadraticBezierTo(
      torso.left - w * 0.08,
      torso.top + h * 0.16,
      torso.left + w * 0.04,
      torso.bottom + h * 0.02,
    );
    leftArm.lineTo(torso.left + w * 0.14, torso.bottom + h * 0.005);
    leftArm.quadraticBezierTo(
      torso.left + w * 0.05,
      torso.center.dy,
      torso.left + w * 0.02,
      torso.top + h * 0.02,
    );
    leftArm.close();
    canvas.drawPath(leftArm, fill);

    final Path rightArm = Path();
    rightArm.moveTo(torso.right - w * 0.02, torso.top + h * 0.02);
    rightArm.quadraticBezierTo(
      torso.right + w * 0.08,
      torso.top + h * 0.16,
      torso.right - w * 0.04,
      torso.bottom + h * 0.02,
    );
    rightArm.lineTo(torso.right - w * 0.14, torso.bottom + h * 0.005);
    rightArm.quadraticBezierTo(
      torso.right - w * 0.05,
      torso.center.dy,
      torso.right - w * 0.02,
      torso.top + h * 0.02,
    );
    rightArm.close();
    canvas.drawPath(rightArm, fill);

    final double legGap = w * legGapFactor;
    final double legW = (w - legGap) / 2 * 0.55;
    final double legHeight = h - pelvisY;
    final double footHeight = legHeight * 0.10;
    final double legBodyHeight = legHeight - footHeight;
    final double leftLegLeft = (w / 2) - (legGap / 2) - legW;
    final double rightLegLeft = (w / 2) + (legGap / 2);
    final RRect leftLegBody = RRect.fromRectAndRadius(
      Rect.fromLTWH(leftLegLeft, pelvisY, legW, legBodyHeight),
      Radius.circular(legW * 0.18),
    );
    final RRect rightLegBody = RRect.fromRectAndRadius(
      Rect.fromLTWH(rightLegLeft, pelvisY, legW, legBodyHeight),
      Radius.circular(legW * 0.18),
    );
    canvas.drawRRect(leftLegBody, fill);
    canvas.drawRRect(rightLegBody, fill);
    final double leftFootW = legW * 0.58;
    final double rightFootW = legW * 0.58;
    final double leftFootLeft =
        leftLegLeft + (legW - leftFootW) / 2 - legW * 0.01;
    final double rightFootLeft =
        rightLegLeft + (legW - rightFootW) / 2 + legW * 0.01;
    final double footTop = pelvisY + legBodyHeight;
    final Rect leftFootRect = Rect.fromLTWH(
      leftFootLeft,
      footTop,
      leftFootW,
      footHeight,
    );
    final Rect rightFootRect = Rect.fromLTWH(
      rightFootLeft,
      footTop,
      rightFootW,
      footHeight,
    );
    canvas.drawOval(leftFootRect, fill);
    canvas.drawOval(rightFootRect, fill);

    final Paint accent =
        Paint()
          ..color = fillColor.withOpacity(0.035)
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1.0;
    canvas.drawLine(
      Offset(torso.left + 6, torso.top + 6),
      Offset(torso.right - 6, torso.top + 6),
      accent,
    );
  }

  @override
  bool shouldRepaint(covariant HumanPainter oldDelegate) {
    return oldDelegate.fillColor != fillColor ||
        oldDelegate.legGapFactor != legGapFactor;
  }
}
